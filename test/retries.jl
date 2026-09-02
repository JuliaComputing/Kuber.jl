# Retry behaviour against injected failures — G14 in OpenAPIv1ConsumerGaps.md.
#
# `k8s_retry_cond` was characterized offline by test/characterize_retries.jl,
# which pins the *exception types* the runtime raises but is not part of
# runtests.jl and never drives the retry loop. This file drives the loop: a
# server that always fails with a chosen status, and a request counter, so
# "retried" is the difference between one request and several and is asserted
# as such rather than inferred.
#
# Offline and deterministic — no cluster involved.
using Kuber, HTTP, JSON, Test

const RETRY_CORE = Kuber.ApiImpl.GROUP_MODULES["v1"]

"""
    failing_api(status) -> (url, count, stop)

A server that answers every request with `status` and a k8s `Status` body.
`count[]` is the number of requests it saw.
"""
function failing_api(status::Int)
    count = Ref(0)
    lck = ReentrantLock()
    body = JSON.json(Dict("kind" => "Status", "apiVersion" => "v1", "status" => "Failure",
                          "code" => status, "reason" => "Injected",
                          "message" => "injected $status"))
    server = HTTP.listen!("127.0.0.1", 0; listenany = true) do http
        lock(() -> (count[] += 1), lck)
        HTTP.setstatus(http, status)
        HTTP.setheader(http, "Content-Type" => "application/json")
        # k8s sheds load with 429 plus Retry-After; sent so the fixture matches
        # what a real apiserver does under priority-and-fairness
        status == 429 && HTTP.setheader(http, "Retry-After" => "1")
        HTTP.setheader(http, "Content-Length" => string(sizeof(body)))
        HTTP.startwrite(http)
        write(http, body)
    end
    return "http://127.0.0.1:$(HTTP.port(server))", count, () -> close(server)
end

"""
    retryctx(url; httpretry=false) -> KuberContext

Discovery pre-seeded. `_call_options` sets `retry=false` on every call by
default (G20), so the request count measures Kuber's retry loop alone unless a
test asks otherwise — see the last testset for what HTTP.jl's layer does when it
is put back.
"""
function retryctx(url; httpretry::Bool = false)
    ctx = KuberContext()
    set_server(ctx, url)
    set_ns(ctx, "default")
    ctx.apis[:Core] = [RETRY_CORE]
    ctx.modelapi[:Pod] = RETRY_CORE
    ctx.initialized = true
    httpretry && Kuber.set_request_options(ctx; retry = true)
    return ctx
end

function failed_list(ctx; kwargs...)
    try
        list(ctx, :Pod; kwargs...)
        return nothing
    catch e
        return e
    end
end

@testset "retries" begin
    @testset "a retryable status is retried, a decision is not" begin
        # 500/502/503/504 are what a busy or restarting apiserver produces and
        # are worth riding out. 404/409/422 are answers: retrying them turns a
        # fast "no" into a slow one, and 409 is what a create against an
        # existing object returns.
        for (status, retried) in ((500, true), (502, true), (503, true), (504, true),
                                  (404, false), (409, false), (422, false))
            url, count, stop = failing_api(status)
            err = failed_list(retryctx(url); max_tries = 3)
            @test err isa KuberException
            @test err.code == status
            @test Kuber.is_retryable(err) == retried
            # `max_tries` is a count of attempts, so a retried call makes
            # exactly that many requests
            @test count[] == (retried ? 3 : 1)
            stop()
        end
    end

    @testset "max_tries counts attempts" begin
        # It counted *retries* until G20: k8s_delay passed max_tries straight
        # through as ExponentialBackOff's `n`, and Base.retry does n retries on
        # top of the first attempt, so max_tries=1 was two requests. That also
        # meant a mutating call — pinned to retries(ctx, true) == 1 — was
        # retried once, despite set_retries(all_apis=false) meaning it must not
        # be. master computes the delays the same way and has the same bug.
        for (tries, requests) in ((0, 1), (1, 1), (2, 2), (3, 3), (5, 5))
            url, count, stop = failing_api(503)
            failed_list(retryctx(url); max_tries = tries)
            @test count[] == requests
            stop()
        end
    end

    @testset "a mutating call is not retried" begin
        # The contract set_retries documents: all_apis=false means put! and
        # friends get one attempt. Before G20 they got two, because max_tries=1
        # meant "one retry". Asserted through `retries` rather than through a
        # live put! so it pins the budget rather than one verb's behaviour.
        ctx = retryctx("http://127.0.0.1:1")
        @test Kuber.retries(ctx, true) == 1
        @test Kuber.retries(ctx, false) == 5
        url, count, stop = failing_api(503)
        failed_list(retryctx(url); max_tries = Kuber.retries(ctx, true))
        @test count[] == 1
        stop()
    end

    @testset "429 is retried, and Retry-After is honoured" begin
        # G19. Kubernetes' priority-and-fairness layer sheds load with 429 plus
        # Retry-After, and client-go retries it; k8s_retryable_codes omitted it
        # until now — on master it still does — so a throttled call failed at
        # once where client-go would have absorbed it.
        url, count, stop = failing_api(429)
        err = failed_list(retryctx(url); max_tries = 3)
        @test err isa KuberException
        @test err.code == 429
        @test Kuber.is_retryable(err)
        @test count[] == 3
        stop()

        # The fixture sends `Retry-After: 1`, which is longer than the backoff
        # would wait on its own (first delay is 1/tps = 0.5 s), so honouring it
        # is observable as elapsed time. Two retries at >= 1 s each.
        url, count, stop = failing_api(429)
        elapsed = @elapsed failed_list(retryctx(url); max_tries = 3)
        @test count[] == 3
        @test elapsed >= 2.0
        stop()

        # …and it only applies to 429: a 503 carrying the same header would be
        # paced by the backoff instead, which is why _retry_after checks the code
        @test Kuber._retry_after(KuberException(503, "x", nothing, nothing)) == 0.0
        @test Kuber._retry_after(KuberException(429, "x", nothing, nothing)) == 0.0
    end

    @testset "a watch establish failure is retried" begin
        # The establish call is the only thing in the watch path k8s_retry wraps:
        # once the response head arrives the call has returned, so nothing after
        # that is a retry (see k8s_retry_cond's docstring).
        url, count, stop = failing_api(503)
        ctx = retryctx(url)
        stream = Kuber.KuberEventStream(4)
        wctx = Kuber.KuberWatchContext(ctx, stream)
        # resource_version skips the initial list, so every request here is a
        # watch establish
        watcher = @async list(wctx, :Pod; watch = true, push_initial = false,
                              resource_version = "1", max_tries = 3)
        @test timedwait(() -> istaskdone(watcher), 90.0) == :ok
        @test count[] == 3
        @test istaskfailed(watcher)
        @test Kuber.is_retryable(watcher.result)
        close(stream)
        stop()
    end

    @testset "HTTP.jl's retry layer is off, and multiplies the count when on" begin
        # G20. Kuber's loop was not the only one: HTTP.jl 2.x retries idempotent
        # requests on a retryable status by default, so each Kuber attempt cost
        # several requests, `max_tries` bounded none of them, and a mutating call
        # could be retried by a layer with no notion of mutating. A KuberContext
        # now sets retry=false, so Kuber owns it.
        url, count, stop = failing_api(503)
        failed_list(retryctx(url); max_tries = 1)
        @test count[] == 1                      # the default: Kuber alone
        stop()

        # …and handing it back still works, for anyone who wants it. Asserted as
        # a multiplier rather than an exact count: the factor is HTTP.jl's
        # default, not Kuber's contract.
        url, count, stop = failing_api(503)
        failed_list(retryctx(url; httpretry = true); max_tries = 1)
        @test count[] > 1
        stop()
    end

    @testset "is_retryable classifies what consumers will hand it" begin
        # C2/G15's helper, over the shapes a consumer actually catches.
        @test Kuber.is_retryable(KuberException(503, "unavailable", nothing, nothing))
        @test !Kuber.is_retryable(KuberException(404, "not found", nothing, nothing))

        # a failure raised inside a task, which is how `watch` reports one
        wrapped = try
            @sync @async throw(KuberException(503, "unavailable", nothing, nothing))
        catch e
            e
        end
        @test wrapped isa CompositeException
        @test Kuber.is_retryable(wrapped)

        # …and a transport failure, which carries no status at all
        transport = try
            HTTP.get("http://127.0.0.1:1"; retry = false, connect_timeout = 5)
            nothing
        catch e
            e
        end
        @test transport !== nothing
        @test Kuber.is_retryable(transport)
    end
end
