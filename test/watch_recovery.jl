# Watch recovery semantics: the acceptance criteria of
# OpenAPIv1TrialBranchPlan.md §6 that need failure injection rather than a
# cooperative cluster — a consumer stopping a watch, a connection dropped
# mid-stream (Kuber #68), a truncated item, and an expired resourceVersion.
#
# Driven by a fake apiserver so the failures are deterministic and every
# request's query string can be inspected. Discovery is pre-seeded, so the fake
# server only has to answer the pod list path.
#
# The server is built on HTTP.jl rather than raw TCP on purpose. A hand-rolled
# chunked response is *not* enough: one that curl streams happily still arrives
# at the HTTP.jl client only when the connection closes, which would make these
# tests pass at teardown and prove nothing about streaming. Using the same
# library on both ends keeps the framing beyond question — and the real
# apiserver's framing (Transfer-Encoding: chunked, one event per chunk) is
# already covered live by test/watch_latency.jl.
using Kuber, HTTP, JSON, Test

const R = Kuber.ApiImpl
const CORE = R.GROUP_MODULES["v1"]

"""A pod list the strict client will accept."""
podlist(rv) = JSON.json(Dict("kind" => "PodList", "apiVersion" => "v1",
                             "metadata" => Dict("resourceVersion" => rv), "items" => []))

event(type, name, rv) = JSON.json(Dict("type" => type,
    "object" => Dict("kind" => "Pod", "apiVersion" => "v1",
                     "metadata" => Dict("name" => name, "namespace" => "default",
                                        "resourceVersion" => rv))))

"""Write one watch frame and push it out immediately."""
function frame(http, text)
    write(http, text * "\n")
    flush(http)
end

"""
    hold(alive)

Keep a watch response open until the server is stopped.

Handlers must not simply `sleep` for a long time: `close(server)` waits for
in-flight handlers to return, so a sleeping handler hangs teardown rather than
the test failing.
"""
function hold(alive)
    while alive[]
        sleep(0.1)
    end
end

"""
    fakeapi(watchhandler) -> (url, requests, stop)

A fake apiserver. Buffered list requests are answered with an empty `PodList` at
resourceVersion 100; watch requests (`watch=true` in the query) are handed to
`watchhandler(http, request_number, alive)`, which writes frames and may
truncate the stream or return early to end it. `requests` accumulates every
request target seen.
"""
function fakeapi(watchhandler)
    requests = String[]
    lck = ReentrantLock()
    watches = Ref(0)
    alive = Ref(true)
    server = HTTP.listen!("127.0.0.1", 0; listenany = true) do http
        target = String(http.message.target)
        lock(lck) do
            push!(requests, target)
        end
        HTTP.setheader(http, "Content-Type" => "application/json")
        if occursin("watch=true", target)
            n = lock(() -> (watches[] += 1), lck)
            HTTP.startwrite(http)
            watchhandler(http, n, alive)
        else
            body = podlist("100")
            HTTP.setheader(http, "Content-Length" => string(sizeof(body)))
            HTTP.startwrite(http)
            write(http, body)
        end
    end
    stop = () -> (alive[] = false; close(server))
    return "http://127.0.0.1:$(HTTP.port(server))", requests, stop
end

"""A context wired to `url` with discovery pre-seeded (the fake server has none)."""
function fakectx(url)
    ctx = KuberContext()
    set_server(ctx, url)
    set_ns(ctx, "default")
    ctx.apis[:Core] = [CORE]
    ctx.modelapi[:Pod] = CORE
    ctx.initialized = true
    return ctx
end

watchqueries(requests) = filter(t -> occursin("watch=true", t), requests)

startwatch(ctx, stream) =
    @async list(Kuber.KuberWatchContext(ctx, stream), :Pod; watch = true, push_initial = false)

# The first event on a cold process waits for the whole watch and decode path to
# compile; steady state is single-digit ms (test/watch_latency.jl).
const FIRST_EVENT_TIMEOUT = 90.0

function take_event(stream, timeout = FIRST_EVENT_TIMEOUT)
    @test timedwait(() -> isready(stream), timeout) == :ok
    return take!(stream)
end

@testset "watch recovery" begin
    @testset "consumer close stops the watch, even on a silent stream" begin
        # The stream goes quiet after one event. Closing it must still end the
        # watch promptly rather than waiting for a frame that never comes.
        url, requests, stop = fakeapi() do http, n, alive
            frame(http, event("ADDED", "p1", "101"))
            hold(alive)                    # silence
        end
        ctx = fakectx(url)
        stream = Kuber.KuberEventStream(16)
        watcher = startwatch(ctx, stream)
        @test take_event(stream) isa KuberEvent

        t0 = time()
        close(stream)
        @test timedwait(() -> istaskdone(watcher), 15.0) == :ok
        @test (time() - t0) < 5.0           # not waiting for the next frame
        @test !istaskfailed(watcher)
        # a stop must not be mistaken for a failure and re-established
        @test length(watchqueries(requests)) == 1
        stop()
    end

    @testset "dropped connection re-watches from the last resourceVersion" begin
        # Kuber #68: a connection dropped mid-watch is retried. On an item
        # boundary this looks exactly like a watch ending normally, so the loop
        # must re-establish either way — and resume from where it got to.
        url, requests, stop = fakeapi() do http, n, alive
            if n == 1
                frame(http, event("ADDED", "p1", "101"))
                # Returning ends the response; with HTTP.jl on both ends that is
                # a *clean* end rather than an abort — which is exactly the case
                # that matters, since a real drop on an item boundary is
                # indistinguishable from one (a genuine abort is characterized in
                # test/characterize_retries.jl).
                sleep(0.5)
            else
                frame(http, event("MODIFIED", "p1", "102"))
                hold(alive)
            end
        end
        ctx = fakectx(url)
        stream = Kuber.KuberEventStream(16)
        watcher = startwatch(ctx, stream)

        @test take_event(stream).type == "ADDED"
        # only arrives if the watch re-established itself
        @test take_event(stream, 30.0).type == "MODIFIED"

        queries = watchqueries(requests)
        @test length(queries) >= 2
        @test occursin("resourceVersion=100", queries[1])   # from the initial list
        @test occursin("resourceVersion=101", queries[2])   # from the last event seen

        close(stream)
        @test timedwait(() -> istaskdone(watcher), 15.0) == :ok
        stop()
    end

    @testset "truncated item re-watches" begin
        # The 1.0 runtime closes the channel with a DecodeError instead of ending
        # silently; that is a failure to recover from, not one to surface.
        url, requests, stop = fakeapi() do http, n, alive
            if n == 1
                frame(http, event("ADDED", "p1", "101"))
                sleep(0.5)
                write(http, "{\"type\": \"ADDED\", \"object\": {\"kind\": ")   # truncated
                flush(http)
                sleep(0.5)
            else
                frame(http, event("MODIFIED", "p1", "102"))
                hold(alive)
            end
        end
        ctx = fakectx(url)
        stream = Kuber.KuberEventStream(16)
        watcher = startwatch(ctx, stream)

        @test take_event(stream).type == "ADDED"
        @test take_event(stream, 30.0).type == "MODIFIED"
        @test length(watchqueries(requests)) >= 2

        close(stream)
        @test timedwait(() -> istaskdone(watcher), 15.0) == :ok
        stop()
    end

    @testset "expired resourceVersion starts over without one" begin
        # k8s answers an expired resourceVersion with an in-stream ERROR event
        # carrying a Status(reason=Expired, code=410), not an HTTP error. The
        # protocol's answer is to list again and watch from scratch.
        url, requests, stop = fakeapi() do http, n, alive
            if n == 1
                frame(http, event("ADDED", "p1", "101"))
                sleep(0.5)
                frame(http, JSON.json(Dict("type" => "ERROR",
                    "object" => Dict("kind" => "Status", "apiVersion" => "v1",
                                     "status" => "Failure", "reason" => "Expired",
                                     "message" => "too old resource version", "code" => 410))))
                sleep(0.5)
            else
                frame(http, event("ADDED", "p2", "200"))
                hold(alive)
            end
        end
        ctx = fakectx(url)
        stream = Kuber.KuberEventStream(16)
        watcher = startwatch(ctx, stream)

        @test take_event(stream).object.metadata.name == "p1"
        # the ERROR frame itself is not delivered as an event
        next = take_event(stream, 30.0)
        @test next.type == "ADDED"
        @test next.object.metadata.name == "p2"

        queries = watchqueries(requests)
        @test length(queries) >= 2
        @test occursin("resourceVersion=100", queries[1])   # from the initial list
        @test !occursin("resourceVersion", queries[2])      # started over

        close(stream)
        @test timedwait(() -> istaskdone(watcher), 15.0) == :ok
        stop()
    end

    # A connection aborted *mid-chunk* — an apiserver restart or a network drop,
    # the one #68 shape a clean end does not stand in for — closes the channel
    # with an HTTP.jl error (`ParseError: unexpected EOF while reading HTTP/1
    # data`) rather than the DecodeError a truncated item gives. Reproducing it
    # needs the listener killed underneath the client, which leaves nothing for
    # the retry to reach, so the recovery decision is asserted where it is made:
    # see "watch-stream failures are recoverable" in test/helpers.jl.

    @testset "an endlessly empty watch backs off instead of spinning" begin
        # A server that answers 200 and ends the stream without delivering
        # anything is not a retryable failure, so k8s_retry never sees it. Left
        # unthrottled the loop would re-establish as fast as the apiserver could
        # answer.
        url, requests, stop = fakeapi() do http, n, alive
            frame(http, "")            # a response, but no events, ever
        end
        ctx = fakectx(url)
        stream = Kuber.KuberEventStream(16)
        watcher = startwatch(ctx, stream)
        sleep(1.0)                     # let the first attempts happen and compile
        before = length(watchqueries(requests))
        sleep(3.0)
        attempts = length(watchqueries(requests)) - before
        @test attempts <= 6            # backing off, not spinning
        close(stream)
        @test timedwait(() -> istaskdone(watcher), 20.0) == :ok
        stop()
    end

    @testset "establish failures are retried, then surfaced" begin
        # Nothing listening: a transport failure while establishing the watch is
        # what k8s_retry actually wraps.
        ctx = fakectx("http://127.0.0.1:1")
        stream = Kuber.KuberEventStream(4)
        wctx = Kuber.KuberWatchContext(ctx, stream)
        @test_throws Exception list(wctx, :Pod; watch = true, push_initial = false,
                                   resource_version = "1", max_tries = 1)
    end
end
