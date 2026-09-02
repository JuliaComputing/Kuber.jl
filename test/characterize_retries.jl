# Retry-condition characterization (OpenAPIv1TrialBranchPlan.md §4.3).
#
# NOT part of runtests.jl — a manual tool. Run it to pin down exactly which
# exception types the pinned OpenAPI.jl runtime raises for each failure mode
# Kuber's `k8s_retry_cond` has to classify, then encode what it prints in
# `k8s_retry_cond`. Rerun it whenever the OpenAPI pin moves: these are runtime
# internals, not a stable contract.
#
#     kubectl proxy --port=8801 &
#     julia --project test/characterize_retries.jl
#
# The four modes, and why each matters:
#
#   1. retryable HTTP status (503) — the old code matched
#      `OpenAPI.Clients.ApiException.status`
#   2. connection refused / transport failure — the old code used
#      `OpenAPI.Clients.is_request_interrupted`, which no longer exists
#   3. consumer closes a watch channel — MUST NOT be retried (Kuber #68); the
#      old guard was `stream === nothing || isopen(stream)`
#   4. server truncates a watch stream mid-item — new in the 1.0 runtime, which
#      closes the channel with a DecodeError instead of ending silently
#
# Findings at OpenAPI 1ff9ba8 / HTTP 2.6.4 / k8s v1.35.4 (2026-08-13), which is
# what src/helpers.jl encodes:
#
#   503 status         -> OpenAPI.Runtime.ApiError, .status == 503. `.decoded`
#                         is raw Vector{UInt8} for statuses the document does
#                         not describe, so KuberException parses the body itself
#   connection refused -> HTTP.ConnectError (NOT an ApiError). Transport
#                         failures are HTTP.jl exceptions now; the old
#                         `is_request_interrupted` helper is gone
#   consumer close     -> the watch call does not throw AT ALL. It returns at
#                         the response head, so by the time a consumer closes
#                         the channel there is no in-flight call to retry. Watch
#                         failures surface on the channel, not from the call —
#                         which is why retry-vs-stop lives in the re-watch loop
#   truncated stream   -> channel closes with OpenAPI.Runtime.DecodeError
#                         ("streaming response ended with a truncated item")
#   dropped connection -> on an item boundary this is a CLEAN close,
#                         indistinguishable from a watch ending normally. So a
#                         clean close cannot mean "stop": only the consumer
#                         closing the channel means that
#   410 Gone           -> NOT an ApiError. k8s answers an expired
#                         resourceVersion with HTTP 200 and an in-stream
#                         {"type": "ERROR", "object": Status(reason=Expired,
#                         code=410)} event (plan §5.3 assumed an ApiError)
using HTTP, JSON, Sockets, Kuber

const K8s = Kuber.ApiImpl.K8sV1
const PROXY = "http://127.0.0.1:8801"

describe(e) = string(typeof(e))

function report(label, e)
    println("\n── ", label)
    println("   type:   ", describe(e))
    if e isa K8s.ApiError
        println("   status:  ", e.status)
        println("   opid:    ", e.operation_id)
        println("   decoded: ", e.decoded === nothing ? "nothing" : describe(e.decoded))
        println("   body:    ", isvalid(String, e.body) ? first(String(copy(e.body)), 120) : "$(length(e.body)) bytes")
    end
    for f in fieldnames(typeof(e))
        f in (:body, :decoded, :headers, :decoded_headers) && continue
        v = getfield(e, f)
        v isa Exception && println("   .", f, " = ", describe(v), ": ", sprint(showerror, v)[1:min(end, 160)])
    end
    println("   showerror: ", sprint(showerror, e)[1:min(end, 200)])
    return typeof(e)
end

"""
Serve one canned response on an ephemeral port; returns `(url, stopper)`.

Raw TCP rather than `HTTP.listen!` so the response bytes — including a
deliberately truncated body and a connection dropped with no terminator — are
under our control exactly.
"""
function fakeserver(respond)
    server = Sockets.listen(Sockets.localhost, 0)
    port = Int(Sockets.getsockname(server)[2])
    @async try
        while true
            sock = Sockets.accept(server)
            @async try
                while true                      # drain the request head
                    line = readline(sock)
                    (isempty(line) || line == "\r") && break
                end
                respond(sock)
            catch
            finally
                close(sock)
            end
        end
    catch
    end
    return "http://127.0.0.1:$port", () -> close(server)
end

"""Response head with no Content-Length: the body ends when the socket closes."""
function streaming_head(sock, status = 200)
    write(sock, "HTTP/1.1 $status OK\r\nContent-Type: application/json\r\nConnection: close\r\n\r\n")
    flush(sock)
end

const WATCH_EVENT = JSON.json(Dict("type" => "ADDED",
    "object" => Dict("kind" => "Pod", "apiVersion" => "v1",
                     "metadata" => Dict("name" => "p1", "resourceVersion" => "1"))))

results = Pair{String,Any}[]

# ── 1. retryable status ────────────────────────────────────────────────────
let
    body = JSON.json(Dict("kind" => "Status", "apiVersion" => "v1", "status" => "Failure",
                          "message" => "the server is currently unable to handle the request",
                          "reason" => "ServiceUnavailable", "code" => 503))
    url, stop = fakeserver() do sock
        write(sock, "HTTP/1.1 503 Service Unavailable\r\nContent-Type: application/json\r\n",
              "Content-Length: $(sizeof(body))\r\nConnection: close\r\n\r\n", body)
        flush(sock)
    end
    client = K8s.Client(url; require_credentials = false)
    e = try
        K8s.listcorev1namespacedpod("default"; client)
        nothing
    catch err
        err
    end
    push!(results, "503 status" => report("503 from server", e))
    stop()
end

# ── 2. transport failure (nothing listening) ───────────────────────────────
let
    client = K8s.Client("http://127.0.0.1:1"; require_credentials = false)
    e = try
        K8s.listcorev1namespacedpod("default"; client)
        nothing
    catch err
        err
    end
    push!(results, "connection refused" => report("connection refused", e))
end

# ── 3. consumer closes the watch channel (must NOT retry) ──────────────────
let
    client = K8s.Client(PROXY; require_credentials = false)
    K8s.codec!(client, "application/json;stream=watch"; decode = (bytes, _) -> JSON.parse(String(bytes)))
    pods = K8s.listcorev1namespacedpod("default"; client)
    events = Channel{Any}(16)
    e = try
        K8s.listcorev1namespacedpod("default"; client, watch = true,
            resourceversion = pods.metadata.resourceversion,
            accept = "application/json;stream=watch", stream_to = events)
        sleep(0.5)
        close(events)          # the documented way for a consumer to stop a watch
        sleep(1.5)
        nothing                # did the call itself throw?
    catch err
        err
    end
    println("\n── consumer close(events)")
    println("   call threw:  ", e === nothing ? "no" : describe(e))
    println("   isopen:      ", isopen(events))
    tk = try
        take!(events)
        "value"
    catch err
        describe(err)
    end
    println("   take! after: ", tk)
    push!(results, "consumer close" => (e === nothing ? "no throw" : describe(e)))
end

# ── 4. server truncates a watch stream mid-item ────────────────────────────
let
    url, stop = fakeserver() do sock
        streaming_head(sock)
        write(sock, WATCH_EVENT, "\n")          # one complete event…
        flush(sock)
        sleep(0.3)
        write(sock, "{\"type\": \"ADDED\", \"object\": {\"kind\": ")   # …then a truncated one
        flush(sock)
    end
    client = K8s.Client(url; require_credentials = false)
    K8s.codec!(client, "application/json;stream=watch"; decode = (bytes, _) -> JSON.parse(String(bytes)))
    events = Channel{Any}(16)
    K8s.listcorev1namespacedpod("default"; client, watch = true,
        accept = "application/json;stream=watch", stream_to = events)
    got = Any[]
    e = try
        for ev in events
            push!(got, ev)
        end
        nothing
    catch err
        err
    end
    println("\n── truncated stream")
    println("   items before failure: ", length(got))
    e === nothing ? println("   channel closed cleanly (no error)") : report("truncated stream", e)
    push!(results, "truncated stream" => (e === nothing ? "clean close" : describe(e)))
    stop()
end

# ── 5. server drops a live watch connection mid-stream ─────────────────────
let
    url, stop = fakeserver() do sock
        streaming_head(sock)
        write(sock, WATCH_EVENT, "\n")
        flush(sock)
        sleep(0.3)                              # then drop, on an item boundary
    end
    client = K8s.Client(url; require_credentials = false)
    K8s.codec!(client, "application/json;stream=watch"; decode = (bytes, _) -> JSON.parse(String(bytes)))
    events = Channel{Any}(16)
    e = try
        K8s.listcorev1namespacedpod("default"; client, watch = true,
            accept = "application/json;stream=watch", stream_to = events)
        got = Any[]
        for ev in events
            push!(got, ev)
        end
        println("\n── dropped connection: ", length(got), " items, channel closed cleanly")
        nothing
    catch err
        err
    end
    e === nothing || report("dropped connection", e)
    push!(results, "dropped connection" => (e === nothing ? "clean close" : describe(e)))
    stop()
end

# ── 6. 410 Gone: a watch resumed from an expired resourceVersion ───────────
# k8s's watch protocol answer to "your resourceVersion is too old"; §5.3 has to
# turn it into a fresh list+watch rather than a retry of the same call.
let
    client = K8s.Client(PROXY; require_credentials = false)
    K8s.codec!(client, "application/json;stream=watch"; decode = (bytes, _) -> JSON.parse(String(bytes)))
    events = Channel{Any}(8)
    e = try
        K8s.listcorev1namespacedpod("default"; client, watch = true,
            resourceversion = "1", timeoutseconds = Int64(5),
            accept = "application/json;stream=watch", stream_to = events)
        nothing
    catch err
        err
    end
    println("\n── expired resourceVersion")
    if e === nothing
        println("   call threw: no — reading the stream instead")
        got = Any[]
        streamerr = try
            for ev in events
                push!(got, ev)
                length(got) >= 3 && break
            end
            nothing
        catch err
            err
        end
        for ev in got
            println("   event: type=", get(ev, "type", "?"),
                    " object.kind=", get(get(ev, "object", Dict()), "kind", "?"),
                    " reason=", get(get(ev, "object", Dict()), "reason", "-"),
                    " code=", get(get(ev, "object", Dict()), "code", "-"))
        end
        streamerr === nothing || println("   stream error: ", describe(streamerr))
        push!(results, "410 Gone" => isempty(got) ? "no events" :
              "in-stream $(get(got[1], "type", "?")) event, code=$(get(get(got[1], "object", Dict()), "code", "-"))")
        close(events)
    else
        report("expired resourceVersion (410 Gone)", e)
        push!(results, "410 Gone" => describe(e) * (e isa K8s.ApiError ? " status=$(e.status)" : ""))
    end
end

println("\n\n════ SUMMARY ════")
for (label, T) in results
    println("  ", rpad(label, 22), " -> ", T)
end
