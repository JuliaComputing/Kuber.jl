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
podlist(rv, names = String[]) = JSON.json(Dict("kind" => "PodList", "apiVersion" => "v1",
    "metadata" => Dict("resourceVersion" => rv),
    "items" => [Dict("kind" => "Pod", "apiVersion" => "v1",
                     "metadata" => Dict("name" => n, "namespace" => "default",
                                        "resourceVersion" => rv)) for n in names]))

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

A fake apiserver. Buffered list requests are answered by `listbody(n)`, an empty
`PodList` at resourceVersion 100 unless overridden — `n` is the list request's
number, so a test can make the second list differ from the first. Watch requests
(`watch=true` in the query) are handed to `watchhandler(http, request_number,
alive)`, which writes frames and may truncate the stream or return early to end
it. `requests` accumulates every request target seen.
"""
function fakeapi(watchhandler; listbody = n -> podlist("100"))
    requests = String[]
    lck = ReentrantLock()
    watches = Ref(0)
    lists = Ref(0)
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
            body = listbody(lock(() -> (lists[] += 1), lck))
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
listqueries(requests) = filter(t -> !occursin("watch=true", t), requests)

startwatch(ctx, stream; push_initial = false) =
    @async list(Kuber.KuberWatchContext(ctx, stream), :Pod; watch = true, push_initial = push_initial)

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

    @testset "a caller can end a watch and re-establish it itself" begin
        # G2. `K8sReflector.jl:216-245` wraps `Kuber.watch` in its own
        # `while true` and relies on `watch` *returning* so it can re-establish
        # from a resourceVersion it tracked. Here a watch carries no deadline and
        # the pump re-watches internally, so a clean server close — including one
        # caused by `timeout_seconds` — never ends the watch. The only thing that
        # does is the consumer closing the stream, which a stream processor does
        # simply by leaving its event loop.
        #
        # So the reflector's loop cannot work as written, but the *pattern* is
        # still expressible, and this is the shape of it.
        url, requests, stop = fakeapi() do http, n, alive
            frame(http, event("ADDED", "p$n", "10$n"))
            hold(alive)
        end
        ctx = fakectx(url)

        seen = KuberEvent[]
        rv = nothing
        driver = @async for _ in 1:2
            # round 1 has nothing to resume from and lists; round 2 resumes
            resume = rv === nothing ? NamedTuple() : (; resource_version = rv)
            watch(ctx, list, :Pod; resume...) do stream
                for item in stream
                    item isa KuberEvent || continue   # the initial list frame
                    push!(seen, item)
                    rv = Kuber._resource_version(item.object)
                    break        # leaving the loop closes the stream, which ends
                end              # the watch — the reflector's re-establish point
            end
        end
        @test timedwait(() -> istaskdone(driver), FIRST_EVENT_TIMEOUT) == :ok
        istaskfailed(driver) && @error "the re-establishment loop failed" driver.result
        @test !istaskfailed(driver)

        # both rounds ran, and the second resumed where the first stopped
        @test length(seen) == 2
        @test Kuber._resource_version(seen[1].object) == "101"
        @test Kuber._resource_version(seen[2].object) == "102"

        queries = watchqueries(requests)
        @test length(queries) == 2
        @test occursin("resourceVersion=100", queries[1])   # from the initial list
        @test occursin("resourceVersion=101", queries[2])   # from the caller

        # …and the resumed round did not list. That is the useful half of the
        # `if !watch || resource_version === nothing` guard: a caller that keeps
        # its own store pays for the initial state exactly once. (The same guard
        # is why `resource_version=` does nothing on a *non-watch* read — G17.)
        @test length(listqueries(requests)) == 1

        stop()
    end

    @testset "no event is dropped or duplicated across a re-watch" begin
        # G3. The other re-watch tests assert that a resume *happens* with the
        # right resourceVersion. This one asserts the property a cache-maintaining
        # consumer actually depends on: the event sequence either side of the seam
        # is exactly what the server sent, with nothing lost and nothing repeated.
        #
        # Two things make it a real test rather than a restatement. The first
        # watch sends a *burst* and then closes cleanly, so events are in flight
        # when the connection ends rather than neatly one per round trip; and the
        # consumer does not read anything until the seam has demonstrably passed,
        # so the events have to survive buffered across it.
        url, requests, stop = fakeapi() do http, n, alive
            if n == 1
                for rv in ("101", "102", "103")
                    frame(http, event("ADDED", "p$rv", rv))
                end
                sleep(0.5)          # then return: a clean close, mid-sequence
            else
                for rv in ("104", "105")
                    frame(http, event("MODIFIED", "p$rv", rv))
                end
                hold(alive)
            end
        end
        ctx = fakectx(url)
        stream = Kuber.KuberEventStream(16)
        watcher = startwatch(ctx, stream)

        # wait for the seam itself, not for an event, so nothing is consumed
        # until the re-watch has already been established
        @test timedwait(() -> length(watchqueries(requests)) >= 2,
                        FIRST_EVENT_TIMEOUT) == :ok

        events = [take_event(stream, 30.0) for _ in 1:5]
        versions = [Kuber._resource_version(e.object) for e in events]
        @test versions == ["101", "102", "103", "104", "105"]
        @test allunique(versions)
        @test [e.type for e in events] ==
              ["ADDED", "ADDED", "ADDED", "MODIFIED", "MODIFIED"]
        # nothing extra is waiting either — a re-delivered frame would show up here
        @test !isready(stream)

        queries = watchqueries(requests)
        @test length(queries) == 2
        # the resume names the last version delivered, not the first of the burst
        @test occursin("resourceVersion=103", queries[2])

        close(stream)
        @test timedwait(() -> istaskdone(watcher), 15.0) == :ok
        @test !istaskfailed(watcher)
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

    # An expired resourceVersion is answered in-stream, with an ERROR event
    # carrying a Status(reason=Expired, code=410) under HTTP 200 — not an HTTP
    # error. Watching again *without* a resourceVersion would recover the
    # connection but not the truth: k8s replays current state as synthetic ADDED
    # events, so a consumer hears about everything that still exists and never
    # about what was deleted while the watch was gone. Kuber lists again instead,
    # and delivers that list as a resync frame (G1 in OpenAPIv1ConsumerGaps.md).
    expiredapi(listbody) = fakeapi(; listbody = listbody) do http, n, alive
        if n == 1
            frame(http, event("ADDED", "p1", "101"))
            sleep(0.5)
            frame(http, JSON.json(Dict("type" => "ERROR",
                "object" => Dict("kind" => "Status", "apiVersion" => "v1",
                                 "status" => "Failure", "reason" => "Expired",
                                 "message" => "too old resource version", "code" => 410))))
            sleep(0.5)
        else
            frame(http, event("MODIFIED", "p2", "301"))
            hold(alive)
        end
    end

    # p1 exists at the first list and is gone by the second: exactly the object a
    # replay would never mention.
    expiredlists(n) = n == 1 ? podlist("100", ["p1"]) : podlist("300", ["p2"])

    @testset "an expired resourceVersion resyncs from a fresh list" begin
        url, requests, stop = expiredapi(expiredlists)
        ctx = fakectx(url)
        stream = Kuber.KuberEventStream(16)
        watcher = startwatch(ctx, stream; push_initial = true)

        initial = take_event(stream)
        @test kuber_kind(initial) == "PodList"
        @test Kuber._field(initial.metadata.resourceversion) == "100"

        @test take_event(stream, 30.0).object.metadata.name == "p1"

        # the ERROR frame is not delivered; a fresh list is
        resync = take_event(stream, 30.0)
        @test kuber_kind(resync) == "PodList"
        @test Kuber._field(resync.metadata.resourceversion) == "300"
        @test [Kuber._field(p.metadata.name) for p in resync.items] == ["p2"]

        @test take_event(stream, 30.0).type == "MODIFIED"

        @test length(listqueries(requests)) == 2             # it really re-listed
        queries = watchqueries(requests)
        @test length(queries) >= 2
        @test occursin("resourceVersion=100", queries[1])     # from the initial list
        @test occursin("resourceVersion=300", queries[2])     # from the resync list

        close(stream)
        @test timedwait(() -> istaskdone(watcher), 15.0) == :ok
        stop()
    end

    @testset "push_initial=false recovers, but is told nothing about the gap" begin
        # The events-only form (`watch(ctx, O, stream)`) opts out of list frames,
        # so it opts out of the resync too. It still re-lists — that is where the
        # resourceVersion to resume from comes from — but a consumer maintaining
        # a cache on this form has to track expiry itself.
        url, requests, stop = expiredapi(expiredlists)
        ctx = fakectx(url)
        stream = Kuber.KuberEventStream(16)
        watcher = startwatch(ctx, stream)

        @test take_event(stream).object.metadata.name == "p1"
        next = take_event(stream, 30.0)
        @test next isa KuberEvent                             # no list frame
        @test next.type == "MODIFIED"

        @test length(listqueries(requests)) == 2
        @test occursin("resourceVersion=300", watchqueries(requests)[2])

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
