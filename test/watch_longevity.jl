# Long-lived watch probe for Kuber.jl — G5b in OpenAPIv1ConsumerGaps.md.
#
# G5a covers everything about a long-lived watch that compression can reach: a
# server-initiated close is `timeoutseconds` away, so `test/runtests.jl` proves
# re-establishment, bookmarks and resync in about twelve seconds. What is left
# needs real time and a real network — this probe — and is why it is not a CI
# job:
#
#   - does a watch left alone for hours keep delivering? The apiserver ends one
#     on its own timer (`--min-request-timeout`, 1800 s by default, randomized
#     into [1800, 3600)), so a run of a few hours crosses several closes that
#     nothing asked for
#   - does anything grow? File descriptors and memory across dozens of silent
#     re-establishments are exactly what a short test cannot see
#   - does an intermediary drop it? A load balancer's idle timeout (60–350 s on
#     the common cloud balancers) only exists where there is a load balancer.
#     Run this *through* whatever proxy or LB the deployment has, not against a
#     local apiserver, or it cannot answer that question at all
#
# Reconnects are not directly observable — Kuber re-establishes silently, which
# is the point of it — so the probe measures the thing that actually matters
# instead: every heartbeat it touches an object and times how long the watcher
# takes to see it. A missed heartbeat means the watch stopped working, whatever
# the cause. Resyncs *are* observable, as a list frame on the stream, and are
# counted separately.
#
# Usage:
#   julia --project test/watch_longevity.jl [hours]          # default 2
#
# Needs an API server reachable at $KUBER_SERVER (default http://localhost:8001).
# If nothing is listening there and `kubectl` is available, a `kubectl proxy` is
# started automatically and killed on exit. Pods are created in
# $KUBER_TEST_NAMESPACE (default "default") and cleaned up at the end.
#
# Environment variables:
#   KUBER_SERVER          API server / proxy URL          (default http://localhost:8001)
#   KUBER_TEST_NAMESPACE  namespace for the probe pods    (default "default")
#   KUBER_HEARTBEAT       seconds between heartbeats      (default 300)
#   KUBER_EVENT_TIMEOUT   seconds to wait for an event    (default 60)
#
# A note on the growth numbers: a Julia process grows for its own reasons early
# on — compilation, first-call allocation — so the report takes its baseline
# from the *second* sample and flags sustained growth rather than any growth.
# Treat it as a signal to look closer, not as a leak detector.

using Kuber
using HTTP
using Random
using Printf

const SERVER = get(ENV, "KUBER_SERVER", "http://localhost:8001")
const NAMESPACE = get(ENV, "KUBER_TEST_NAMESPACE", "default")
const HOURS = isempty(ARGS) ? 2.0 : parse(Float64, ARGS[1])
const HEARTBEAT = parse(Float64, get(ENV, "KUBER_HEARTBEAT", "300"))
const EVENT_TIMEOUT = parse(Float64, get(ENV, "KUBER_EVENT_TIMEOUT", "60"))
const LABEL = "kuber-watch-longevity"
const RUNID = lowercase(randstring(4))

# ---------------------------------------------------------------------------
# server / proxy setup — same shape as test/watch_latency.jl

function server_reachable(url)
    try
        resp = HTTP.get(url * "/version"; status_exception = false, request_timeout = 3)
        resp.status == 200
    catch
        false
    end
end

function ensure_server()
    server_reachable(SERVER) && return
    @info("$SERVER not reachable, starting `kubectl proxy`...")
    port = something(tryparse(Int, last(split(SERVER, ':'))), 8001)
    proc = run(pipeline(`kubectl proxy --port=$port`; stdout = devnull, stderr = devnull); wait = false)
    atexit(() -> process_running(proc) && kill(proc))
    deadline = time() + 15
    while time() < deadline && !server_reachable(SERVER)
        sleep(0.5)
    end
    server_reachable(SERVER) ||
        error("cannot reach $SERVER even after starting kubectl proxy; is the cluster up?")
end

function new_ctx()
    ctx = KuberContext()
    set_server(ctx, SERVER)
    set_ns(ctx, NAMESPACE)
    set_retries(ctx; count = 3, all_apis = false)
    Kuber.set_api_versions!(ctx; verbose = false)
    ctx
end

# ---------------------------------------------------------------------------
# process metrics. Linux-only via /proc; elsewhere the columns read as missing
# rather than the probe refusing to run, since liveness is the primary question.

function open_fds()
    try
        length(readdir("/proc/self/fd"))
    catch
        missing
    end
end

function rss_mb()
    try
        # `readlines`, not `eachline`: returning early out of an `eachline` loop
        # leaves the stream open, so this function would leak one descriptor per
        # call — and it is the function reporting descriptor counts. The first
        # run of this probe "found" exactly that, growing one fd per heartbeat
        # with the leak entirely in the instrument.
        for line in readlines("/proc/self/status")
            startswith(line, "VmRSS:") || continue
            return parse(Float64, split(line)[2]) / 1024
        end
        missing
    catch
        missing
    end
end

# A full collection first, so this reports memory still reachable rather than
# memory not yet collected. Without it the number tracks GC timing — it rose
# 61 MB across one two-minute run and fell 98 MB across the next — and a growth
# check on top of that is noise. A collection per heartbeat is nothing against a
# five-minute interval.
live_mb() = (GC.gc(); Base.gc_live_bytes() / 1024^2)

# ---------------------------------------------------------------------------
# watcher

const SIGHTINGS = NamedTuple{(:t, :type, :name),Tuple{Float64,String,String}}[]
const LCK = ReentrantLock()
const STARTED = Ref(false)
const RESYNCS = Ref(0)      # a list frame after the first means a 410 resync
const BOOKMARKS = Ref(0)
const FRAMES = Ref(0)

snapshot() = lock(() -> length(SIGHTINGS), LCK)

function start_watcher()
    wctx = new_ctx()
    stream_ref = Ref{Any}(nothing)
    task = @async watch(wctx, list, :Pod;
                        label_selector = "$LABEL=$RUNID",
                        allow_watch_bookmarks = true) do stream
        stream_ref[] = stream
        for event in stream
            t = time()
            lock(LCK) do
                FRAMES[] += 1
                if !isa(event, KuberEvent)
                    # the initial typed List, and every resync list after it
                    STARTED[] ? (RESYNCS[] += 1) : (STARTED[] = true)
                    return
                end
                event.type == "BOOKMARK" && (BOOKMARKS[] += 1)
                name = try
                    string(Kuber._field(event.object.metadata.name))
                catch
                    ""
                end
                push!(SIGHTINGS, (t = t, type = string(event.type), name = name))
            end
        end
    end
    task, stream_ref
end

function wait_for_sighting(pred::Function, start_idx::Int; timeout = EVENT_TIMEOUT)
    deadline = time() + timeout
    while time() < deadline
        found = lock(LCK) do
            idx = findnext(pred, SIGHTINGS, start_idx + 1)
            idx === nothing ? nothing : SIGHTINGS[idx]
        end
        found === nothing || return found
        sleep(0.05)
    end
    nothing
end

# ---------------------------------------------------------------------------
# heartbeat: create a pod, wait to hear about it, delete it

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

function heartbeat(ctx, i)
    name = "watch-longevity-$RUNID-$i"
    start_idx = snapshot()
    t0 = time()
    reaction = missing
    err = nothing
    try
        put!(ctx, kuber_obj(pod_json(name)))
        s = wait_for_sighting(e -> e.type == "ADDED" && e.name == name, start_idx)
        reaction = s === nothing ? missing : s.t - t0
    catch ex
        err = ex
    finally
        try
            delete!(ctx, :Pod, name; grace_period_seconds = 0)
        catch
        end
    end
    # Sampled outside the lock: `live_mb` runs a full collection, and the
    # watcher task should not wait on it.
    fds, rss, live = open_fds(), rss_mb(), live_mb()
    lock(LCK) do
        (beat = i, t = t0, reaction = reaction, err = err,
         events = length(SIGHTINGS), bookmarks = BOOKMARKS[], resyncs = RESYNCS[],
         fds = fds, rss = rss, live = live)
    end
end

function cleanup(ctx)
    try
        pods = get(ctx, :Pod; label_selector = "$LABEL=$RUNID")
        for item in pods.items
            try
                delete!(ctx, :Pod, Kuber._field(item.metadata.name); grace_period_seconds = 0)
            catch ex
                @warn("failed to delete leftover pod", exception = ex)
            end
        end
    catch ex
        @warn("cleanup failed", exception = ex)
    end
end

# ---------------------------------------------------------------------------
# reporting

fmt(x::Missing, _) = "-"
fmt(x, digits) = string(round(x; digits = digits))
fmt_int(x) = x === missing ? "-" : string(x)
fmt_ms(x) = x === missing ? "MISSED" : string(round(x * 1000; digits = 1))

function report(samples, t_start)
    println()
    println("="^92)
    @printf(" Long-lived watch probe — %.2f h against %s (namespace %s, run %s)\n",
            (time() - t_start) / 3600, SERVER, NAMESPACE, RUNID)
    println(" A missed heartbeat means the watch stopped delivering, however it stopped.")
    println("="^92)
    hdr = string(lpad("beat", 5), lpad("elapsed", 10), lpad("react ms", 11),
                 lpad("events", 9), lpad("bookmk", 8), lpad("resync", 8),
                 lpad("fds", 7), lpad("rss MB", 10), lpad("live MB", 10))
    println(hdr)
    println("-"^length(hdr))
    for s in samples
        line = string(lpad(s.beat, 5),
                      lpad(string(round((s.t - t_start) / 60; digits = 1), "m"), 10),
                      lpad(fmt_ms(s.reaction), 11),
                      lpad(s.events, 9), lpad(s.bookmarks, 8), lpad(s.resyncs, 8),
                      lpad(fmt_int(s.fds), 7), lpad(fmt(s.rss, 1), 10),
                      lpad(fmt(s.live, 1), 10))
        s.reaction === missing && (line *= "   ⚠ MISSED")
        s.err === nothing || (line *= "   ⚠ ERROR: " * sprint(showerror, s.err))
        println(line)
    end

    missed = count(s -> s.reaction === missing, samples)
    errored = count(s -> s.err !== nothing, samples)
    println()
    println(" Heartbeats: $(length(samples)), missed $missed, errored $errored")
    if !isempty(samples)
        last = samples[end]
        println(" Resyncs (410 -> fresh list): $(last.resyncs);  bookmarks: $(last.bookmarks);" *
                "  events: $(last.events)")
    end

    # Growth is measured from the second sample: the first carries the process's
    # own warm-up, which is not what this is looking for.
    if length(samples) >= 3
        base, fin = samples[2], samples[end]
        span = (fin.t - base.t) / 3600
        println()
        println(" Growth from beat $(base.beat) to $(fin.beat) (over $(round(span; digits=2)) h)")
        for (name, a, b, unit) in (("open fds", base.fds, fin.fds, ""),
                                   ("rss", base.rss, fin.rss, " MB"),
                                   ("gc live", base.live, fin.live, " MB"))
            if a === missing || b === missing
                println("   ", rpad(name, 10), " unavailable on this platform")
                continue
            end
            delta = b - a
            flag = (a > 0 && delta > 0.25 * a) ? "   ⚠ look closer" : ""
            # A per-hour rate off a short span is noise pretending to be a trend.
            rate = span >= 0.25 ? @sprintf(", %+.1f%s/h", delta / span, unit) : ""
            @printf("   %-10s %8.1f -> %8.1f%s  (%+.1f%s%s)%s\n",
                    name, a, b, unit, delta, unit, rate, flag)
        end
    end

    println()
    if missed == 0 && errored == 0
        println(" The watch delivered every heartbeat for the whole run ✓")
    else
        println(" ⚠ The watch missed $missed heartbeat(s) and errored on $errored.")
        println("   Re-run with KUBER_HEARTBEAT smaller to narrow when it stopped.")
    end
    println("="^92)
end

# ---------------------------------------------------------------------------

function main()
    ensure_server()
    @info("long-lived watch probe", hours = HOURS, heartbeat_s = HEARTBEAT,
          server = SERVER, namespace = NAMESPACE, runid = RUNID)
    ctx = new_ctx()

    watch_task, stream_ref = start_watcher()
    timedwait(() -> STARTED[] || istaskfailed(watch_task), 30.0; pollint = 0.1)
    istaskfailed(watch_task) && fetch(watch_task)
    STARTED[] || error("watcher did not start within 30s")

    # One untimed pass first. The first `put!`/`delete!` in a fresh process pays
    # for compilation, and a fourteen-second "reaction" that is really codegen
    # would otherwise be the most alarming number in the table — or a missed
    # heartbeat, under a short KUBER_EVENT_TIMEOUT.
    @info("warming up (one untimed heartbeat)")
    heartbeat(ctx, 0)
    @info("watcher ready; first heartbeat now, then every $(HEARTBEAT)s")

    t_start = time()
    deadline = t_start + HOURS * 3600
    samples = Any[]
    i = 0
    try
        while true
            i += 1
            s = heartbeat(ctx, i)
            push!(samples, s)
            @info("beat $i", elapsed = string(round((time() - t_start) / 60; digits = 1), "m"),
                  reaction = fmt_ms(s.reaction) * "ms", resyncs = s.resyncs,
                  bookmarks = s.bookmarks, fds = s.fds, rss = fmt(s.rss, 1))
            if istaskfailed(watch_task)
                @error("the watcher task died — the watch did not survive")
                fetch(watch_task)
            end
            time() + HEARTBEAT > deadline && break
            sleep(HEARTBEAT)
        end
    catch ex
        ex isa InterruptException || rethrow()
        @info("interrupted; reporting what was collected")
    finally
        cleanup(ctx)
        stream_ref[] === nothing || close(stream_ref[])
        try
            timedwait(() -> istaskdone(watch_task), 10.0; pollint = 0.2)
        catch
        end
    end

    isempty(samples) || report(samples, t_start)
end

main()
