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

Discovery pre-seeded, and HTTP.jl's own retry layer off by default so the
request count measures *Kuber's* retry loop alone. See the last testset for what
happens when it is left on.
"""
function retryctx(url; httpretry::Bool = false)
    ctx = KuberContext()
    set_server(ctx, url)
    set_ns(ctx, "default")
    ctx.apis[:Core] = [RETRY_CORE]
    ctx.modelapi[:Pod] = RETRY_CORE
    ctx.initialized = true
    httpretry || Kuber.set_request_options(ctx; retry = false)
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
            # `max_tries` is the number of *retries*, so a retried call makes
            # max_tries+1 requests — see the off-by-one testset below
            @test count[] == (retried ? 4 : 1)
            stop()
        end
    end

    @testset "max_tries counts retries, not tries" begin
        # k8s_delay builds ExponentialBackOff(n=max_tries) and Base.retry does n
        # retries on top of the first attempt, so max_tries=1 is two requests,
        # not one. `master` computes the delays identically, so this is shared
        # rather than introduced here — but it means `set_retries(ctx; count=0)`
        # is the only way to get a single attempt, and the docstring's "if
        # max_tries > 1" reads as though 1 already meant that.
        for (tries, requests) in ((0, 1), (1, 2), (3, 4))
            url, count, stop = failing_api(503)
            failed_list(retryctx(url); max_tries = tries)
            @test count[] == requests
            stop()
        end
    end

    @testset "429 is not retried" begin
        # Kubernetes sheds load with 429 and a Retry-After header, and client-go
        # retries it. k8s_retryable_codes is [0, 500, 501, 502, 503, 504] here —
        # identically on master — so a throttled call fails at once instead of
        # backing off. Pinned rather than fixed: changing it is a behaviour
        # change shared with master, recorded as G19. If this starts failing
        # because 429 joined the list, that is the fix landing.
        url, count, stop = failing_api(429)
        err = failed_list(retryctx(url); max_tries = 5)
        @test err isa KuberException
        @test err.code == 429
        @test !Kuber.is_retryable(err)
        @test count[] == 1
        stop()
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
        @test count[] == 4
        @test istaskfailed(watcher)
        @test Kuber.is_retryable(watcher.result)
        close(stream)
        stop()
    end

    @testset "HTTP.jl retries underneath, and multiplies the request count" begin
        # G20. Kuber's loop is not the only one: HTTP.jl 2.x retries idempotent
        # requests on a retryable status by default, so each Kuber attempt costs
        # several requests. Measured at this pin: five, making a `max_tries=1`
        # list ten requests against a struggling apiserver rather than two.
        #
        # Asserted as a multiplier rather than an exact count, since the factor
        # is HTTP.jl's default and not Kuber's contract — the point is that
        # `max_tries` does not bound the number of requests.
        url, count, stop = failing_api(503)
        failed_list(retryctx(url; httpretry = true); max_tries = 1)
        @test count[] > 2                       # 2 is what Kuber alone would do
        @test count[] % 2 == 0                  # a whole number of Kuber attempts
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
