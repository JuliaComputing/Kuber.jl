# Watch reaction-time probe for Kuber.jl.
#
# Starts a watch on pods (filtered by a label selector), then on a separate
# task repeatedly creates a pod, patches it, and deletes it, measuring how
# long the watcher takes to see the corresponding ADDED / MODIFIED / DELETED
# events. Prints a per-iteration table and a summary at the end, highlighting
# abnormal delays and missed events.
#
# Usage:
#   julia --project test/watch_latency.jl [iterations]      # default 20
#
# Needs an API server reachable at $KUBER_SERVER (default http://localhost:8001).
# If nothing is listening there and `kubectl` is available (e.g. pointing at a
# local k3s cluster), a `kubectl proxy` is started automatically and killed on
# exit. Pods are created in $KUBER_TEST_NAMESPACE (default "default") and
# cleaned up at the end.
#
# Environment variables:
#   KUBER_SERVER          API server / proxy URL       (default http://localhost:8001)
#   KUBER_TEST_NAMESPACE  namespace for the test pods  (default "default")
#   KUBER_EVENT_TIMEOUT   seconds to wait for a watch event (default 30)
#   KUBER_WATCH_DEBUG=1   dump every observed watch event with arrival times

using Kuber
using HTTP
using Random


const SERVER = get(ENV, "KUBER_SERVER", "http://localhost:8001")
const NAMESPACE = get(ENV, "KUBER_TEST_NAMESPACE", "default")
const NITER = isempty(ARGS) ? 20 : parse(Int, ARGS[1])
const LABEL = "kuber-watch-latency"
const SEQ_ANNOTATION = "kuber-watch-latency-seq"
# seconds to wait for a watch event before declaring it missed (env-overridable)
const EVENT_TIMEOUT = parse(Float64, get(ENV, "KUBER_EVENT_TIMEOUT", "30"))
const RUNID = lowercase(randstring(4))
# There is one HTTP backend now (HTTP.jl 2.x). What this probe still checks is
# that Kuber's watch wrapper adds no buffering of its own on top of the runtime:
# upstream delivers small chunks incrementally (verified 0.0 s first-item latency
# while the server stalls), and a regression here would show up as MISSED or
# abnormal reactions.
const DEBUG = get(ENV, "KUBER_WATCH_DEBUG", "0") == "1"
const T0_RUN = Ref(0.0)

# ---------------------------------------------------------------------------
# server / proxy setup

function server_reachable(url)
    try
        resp = HTTP.get(url * "/version"; status_exception=false, request_timeout=3)
        resp.status == 200
    catch
        false
    end
end

function ensure_server()
    server_reachable(SERVER) && return
    @info("$SERVER not reachable, starting `kubectl proxy`...")
    port = something(tryparse(Int, last(split(SERVER, ':'))), 8001)
    proc = run(pipeline(`kubectl proxy --port=$port`; stdout=devnull, stderr=devnull); wait=false)
    atexit(() -> process_running(proc) && kill(proc))
    deadline = time() + 15
    while time() < deadline && !server_reachable(SERVER)
        sleep(0.5)
    end
    server_reachable(SERVER) || error("cannot reach $SERVER even after starting kubectl proxy; is the cluster up?")
end

function new_ctx(; timeout=nothing)
    ctx = KuberContext()
    set_server(ctx, SERVER)
    set_ns(ctx, NAMESPACE)
    set_retries(ctx; count=3, all_apis=false)
    Kuber.set_api_versions!(ctx; verbose=false)
    timeout === nothing || Kuber.set_timeout(ctx, timeout)
    ctx
end

# ---------------------------------------------------------------------------
# watcher: record every pod watch event with its arrival time

const SIGHTINGS = NamedTuple{(:t, :type, :name, :seq),Tuple{Float64,String,String,String}}[]
const LCK = ReentrantLock()
const WATCH_STARTED = Ref(false)

snapshot() = lock(() -> length(SIGHTINGS), LCK)

function start_watcher()
    # No per-request deadline is needed: a watch never carries `request_timeout`.
    wctx = new_ctx()
    stream_ref = Ref{Any}(nothing)
    task = @async watch(wctx, list, :Pod; label_selector="$LABEL=$RUNID") do stream
        stream_ref[] = stream
        for event in stream
            t = time()
            WATCH_STARTED[] = true
            isa(event, KuberEvent) || continue   # skip the initial PodList
            # `event.object` is already the typed model — no kuber_obj needed —
            # and its optional fields may be ABSENT rather than nothing.
            obj = event.object
            name = try string(obj.metadata.name) catch; "" end
            # labels and annotations are open objects: kuber_props reads them
            seq = try string(kuber_props(obj.metadata.annotations)[SEQ_ANNOTATION]) catch; "" end
            lock(LCK) do
                push!(SIGHTINGS, (t=t, type=string(event.type), name=name, seq=seq))
            end
        end
    end
    task, stream_ref
end

# wait until a sighting past index `start_idx` matches `pred`; returns the
# sighting (with its arrival timestamp) or `nothing` on timeout
function wait_for_sighting(pred::Function, start_idx::Int; timeout=EVENT_TIMEOUT)
    deadline = time() + timeout
    while time() < deadline
        found = lock(LCK) do
            idx = findnext(pred, SIGHTINGS, start_idx + 1)
            idx === nothing ? nothing : SIGHTINGS[idx]
        end
        found === nothing || return found
        sleep(0.002)
    end
    nothing
end

# ---------------------------------------------------------------------------
# driver: create / update / delete pods and time the watcher's reaction

pod_json(name) = """{
    "kind": "Pod",
    "apiVersion": "v1",
    "metadata": {
        "name": "$name",
        "namespace": "$NAMESPACE",
        "labels": {"$LABEL": "$RUNID"}
    },
    "spec": {
        "terminationGracePeriodSeconds": 0,
        "containers": [{
            "name": "main",
            "image": "busybox:stable",
            "command": ["sh", "-c", "sleep 3600"]
        }]
    }
}"""

# one measurement: run `action`, then wait for the matching watch event;
# returns (api call duration, reaction time from action start to event arrival)
function timed_op(action::Function, pred::Function)
    start_idx = snapshot()
    t0 = time()
    action()
    api = time() - t0
    s = wait_for_sighting(pred, start_idx)
    react = s === nothing ? missing : s.t - t0
    api, react
end

function run_iteration(ctx, i)
    name = "watch-latency-$RUNID-$i"
    pod = kuber_obj(pod_json(name))

    create_api, create_react = timed_op(
        () -> put!(ctx, pod),
        e -> e.type == "ADDED" && e.name == name)

    patch = Dict("metadata" => Dict("annotations" => Dict(SEQ_ANNOTATION => string(i))))
    update_api, update_react = timed_op(
        () -> update!(ctx, :Pod, name, patch, "application/merge-patch+json"),
        e -> e.type == "MODIFIED" && e.name == name && e.seq == string(i))

    delete_api, delete_react = timed_op(
        () -> delete!(ctx, :Pod, name; grace_period_seconds=0),
        e -> e.type == "DELETED" && e.name == name)

    (iter=i, create_api=create_api, create_react=create_react,
     update_api=update_api, update_react=update_react,
     delete_api=delete_api, delete_react=delete_react)
end

function cleanup(ctx)
    try
        pods = get(ctx, :Pod; label_selector="$LABEL=$RUNID")
        for item in pods.items
            try
                delete!(ctx, :Pod, item.metadata.name; grace_period_seconds=0)
            catch ex
                @warn("failed to delete leftover pod", pod=item.metadata.name, exception=ex)
            end
        end
    catch ex
        @warn("cleanup failed", exception=ex)
    end
end

# ---------------------------------------------------------------------------
# reporting

fmt_ms(x) = x === missing ? "MISSED" : string(round(x * 1000; digits=1))

function med(v)
    isempty(v) && return NaN
    s = sort(v)
    n = length(s)
    isodd(n) ? s[(n + 1) ÷ 2] : (s[n ÷ 2] + s[n ÷ 2 + 1]) / 2
end

pctl(v, p) = isempty(v) ? NaN : sort(v)[clamp(ceil(Int, p * length(v)), 1, length(v))]

# an op is abnormal if the event never arrived, or its reaction time exceeds
# max(500ms, 3x the median for that op type)
abnormal_threshold(m) = max(0.5, 3 * m)
is_abnormal(react, m) = react === missing || react > abnormal_threshold(m)

function report(results)
    ops = [(:create_react, "create"), (:update_react, "update"), (:delete_react, "delete")]
    medians = Dict(op => med([r[op] for r in results if r[op] !== missing]) for (op, _) in ops)

    println()
    println("="^78)
    println(" Watch reaction-time report — $(length(results)) iterations against $SERVER")
    println(" (api = API call duration, react = action start -> watch event arrival, ms)")
    println("="^78)
    hdr = string(lpad("iter", 5), " |",
        lpad("create api", 11), lpad("react", 9), " |",
        lpad("update api", 11), lpad("react", 9), " |",
        lpad("delete api", 11), lpad("react", 9))
    println(hdr)
    println("-"^length(hdr))
    abnormalities = String[]
    for r in results
        flags = String[]
        for (op, opname) in ops
            is_abnormal(r[op], medians[op]) && push!(flags, opname)
        end
        line = string(lpad(r.iter, 5), " |",
            lpad(fmt_ms(r.create_api), 11), lpad(fmt_ms(r.create_react), 9), " |",
            lpad(fmt_ms(r.update_api), 11), lpad(fmt_ms(r.update_react), 9), " |",
            lpad(fmt_ms(r.delete_api), 11), lpad(fmt_ms(r.delete_react), 9))
        if !isempty(flags)
            line *= "   ⚠ SLOW: " * join(flags, ", ")
            for (op, opname) in ops
                if r[op] === missing
                    push!(abnormalities, "iter $(r.iter) $opname: watch event never arrived (waited $(EVENT_TIMEOUT)s)")
                elseif is_abnormal(r[op], medians[op])
                    push!(abnormalities, "iter $(r.iter) $opname: react=$(fmt_ms(r[op]))ms " *
                        "(threshold $(fmt_ms(abnormal_threshold(medians[op])))ms, median $(fmt_ms(medians[op]))ms)")
                end
            end
        end
        println(line)
    end

    println()
    println(" Summary (watcher reaction time, ms)")
    println(string(lpad("op", 8), lpad("ok", 5), lpad("missed", 8),
        lpad("min", 9), lpad("median", 9), lpad("mean", 9), lpad("p95", 9), lpad("max", 9)))
    for (op, opname) in ops
        vals = [Float64(r[op]) for r in results if r[op] !== missing]
        nmissed = count(r -> r[op] === missing, results)
        if isempty(vals)
            println(string(lpad(opname, 8), lpad(0, 5), lpad(nmissed, 8), "  (no events received!)"))
        else
            println(string(lpad(opname, 8), lpad(length(vals), 5), lpad(nmissed, 8),
                lpad(fmt_ms(minimum(vals)), 9), lpad(fmt_ms(med(vals)), 9),
                lpad(fmt_ms(sum(vals) / length(vals)), 9),
                lpad(fmt_ms(pctl(vals, 0.95)), 9), lpad(fmt_ms(maximum(vals)), 9)))
        end
    end

    println()
    if isempty(abnormalities)
        println(" No abnormal delays detected ✓")
    else
        println(" ⚠ ABNORMAL DELAYS ($(length(abnormalities))):")
        for a in abnormalities
            println("   - ", a)
        end
    end
    println("="^78)
end

# ---------------------------------------------------------------------------
# main

function main()
    T0_RUN[] = time()
    ensure_server()

    @info("initializing contexts against $SERVER (namespace $NAMESPACE, run id $RUNID)")
    ctx = new_ctx()

    @info("starting pod watcher (label selector $LABEL=$RUNID)")
    watch_task, stream_ref = start_watcher()
    timedwait(() -> WATCH_STARTED[] || istaskfailed(watch_task), 30.0; pollint=0.1)
    istaskfailed(watch_task) && fetch(watch_task)   # rethrow the watcher's error
    WATCH_STARTED[] || error("watcher did not start within 30s")
    @info("watcher ready")

    results = Any[]
    try
        for i in 1:NITER
            r = run_iteration(ctx, i)
            missed = [n for n in (:create_react, :update_react, :delete_react) if r[n] === missing]
            @info("iteration $i/$NITER done", create="$(fmt_ms(r.create_react))ms",
                update="$(fmt_ms(r.update_react))ms", delete="$(fmt_ms(r.delete_react))ms",
                missed=isempty(missed) ? "none" : join(missed, ","))
            push!(results, r)
            sleep(0.2)   # let residual events (status updates etc.) drain between iterations
        end
    finally
        cleanup(ctx)
        # closing the stream aborts the watch HTTP request and ends the watcher task
        stream_ref[] === nothing || close(stream_ref[])
        try
            timedwait(() -> istaskdone(watch_task), 10.0; pollint=0.2)
        catch
        end
    end

    if DEBUG
        println("\n--- all watch events seen (t is seconds since run start) ---")
        lock(LCK) do
            for s in SIGHTINGS
                println(" t=", round(s.t - T0_RUN[]; digits=3), "s  ", rpad(s.type, 9), " ", s.name,
                    isempty(s.seq) ? "" : "  seq=$(s.seq)")
            end
        end
    end

    isempty(results) || report(results)
end

main()
