# Offline checks on src/helpers.jl: context, conversions, exceptions, retry
# classification, request options. No cluster needed (Phase 2 gate, §6.2).
using Kuber, HTTP, JSON, Test

const R = Kuber.ApiImpl
const Runtime = Kuber.Runtime

const POD_JSON = """{
    "kind": "Pod",
    "apiVersion": "v1",
    "metadata": {"name": "somepod", "namespace": "default", "labels": {"name": "somepod"}},
    "spec": {"containers": [{"name": "nginx", "image": "nginx"}]}
}"""

@testset "helpers" begin
    @testset "context defaults" begin
        ctx = KuberContext()
        @test get_server(ctx) == "http://localhost:8001"
        @test get_ns(ctx) == "default"
        @test !ctx.initialized
        @test isempty(ctx.clients)
        @test Kuber.retries(ctx, true) == 1        # mutating calls don't retry by default
        @test Kuber.retries(ctx, false) == 5
        set_retries(ctx; count = 3, all_apis = true)
        @test Kuber.retries(ctx, true) == 3
        set_ns(ctx, "kube-system")
        @test get_ns(ctx) == "kube-system"
        @test sprint(show, ctx) == "Kubernetes namespace kube-system at http://localhost:8001"
    end

    @testset "set_server resets clients" begin
        ctx = KuberContext()
        core = R.GROUP_MODULES["v1"]
        client = Kuber.client_for(ctx, core)
        @test client === Kuber.client_for(ctx, core)          # cached per module
        @test Kuber.client_for(ctx, R.GROUP_MODULES["apps/v1"]) !== client
        set_server(ctx, "http://127.0.0.1:8801")
        @test get_server(ctx) == "http://127.0.0.1:8801"
        @test isempty(ctx.clients)
        @test Kuber.client_for(ctx, core) !== client
    end

    @testset "watch codec is registered, scoped to the accept media" begin
        ctx = KuberContext()
        client = Kuber.client_for(ctx, R.GROUP_MODULES["v1"])
        @test haskey(client.media_decoders, Kuber.WATCH_MEDIA)
        @test !haskey(client.media_decoders, "application/json")
    end

    @testset "kuber_obj / kuber_type / kind_to_type" begin
        pod = kuber_obj(POD_JSON)
        @test pod isa R.KIND_TYPES[("v1", "Pod")]
        @test pod.metadata.name == "somepod"
        @test kuber_kind(pod) == "Pod"
        # absent optional fields are ABSENT now, not nothing
        @test pod.status isa Runtime.Absent
        @test Kuber._field(pod.status) === nothing
        @test Kuber._field(pod.status, :fallback) === :fallback
        @test Kuber._field(pod.metadata.name) == "somepod"

        @test kuber_obj(JSON.parse(POD_JSON)) isa R.KIND_TYPES[("v1", "Pod")]
        @test kuber_type(JSON.parse(POD_JSON)) === R.KIND_TYPES[("v1", "Pod")]
        # apiVersion defaults to core v1 when the payload omits it
        @test kuber_type(Dict("kind" => "Pod")) === R.KIND_TYPES[("v1", "Pod")]

        ctx = KuberContext()
        @test kind_to_type(ctx, :Pod, "v1") === R.KIND_TYPES[("v1", "Pod")]
        @test kind_to_type(ctx, "PodList", "v1") === R.KIND_TYPES[("v1", "PodList")]
        @test kind_to_type(ctx, :Deployment, "apps/v1") === R.KIND_TYPES[("apps/v1", "Deployment")]
        @test_throws KeyError kind_to_type(ctx, :Pod, "apps/v1")
    end

    @testset "kuber_props reads open string maps" begin
        pod = kuber_obj("""{"kind": "Pod", "apiVersion": "v1",
            "metadata": {"name": "p", "labels": {"a": "b"},
                         "annotations": {"seq": "7", "other": "x"}},
            "spec": {"containers": [{"name": "c", "image": "busybox"}]}}""")
        # k8s string maps generate an open struct, not a Dict, so indexing the
        # field directly does not work — this is the trap kuber_props exists for
        @test !(pod.metadata.annotations isa AbstractDict)
        @test kuber_props(pod.metadata.annotations)["seq"] == "7"
        @test kuber_props(pod.metadata.labels)["a"] == "b"

        # ABSENT, null, and a plain Dict all normalize
        bare = kuber_obj("""{"kind": "Pod", "apiVersion": "v1", "metadata": {"name": "p"}}""")
        @test kuber_props(bare.metadata.annotations) == Dict{String,String}()
        @test kuber_props(bare.metadata.annotations, Dict("d" => "1")) == Dict("d" => "1")
        @test kuber_props(nothing) == Dict{String,String}()
        @test kuber_props(Dict("k" => "v")) == Dict("k" => "v")
    end

    @testset "KuberException from ApiError" begin
        status = JSON.json(Dict("kind" => "Status", "apiVersion" => "v1", "status" => "Failure",
                                "message" => "pods \"nope\" not found", "reason" => "NotFound", "code" => 404))
        err = Runtime.ApiError("readCoreV1NamespacedPod", 404, Pair{String,String}[],
                               Dict{String,Any}(), Vector{UInt8}(status), nothing, nothing)
        e = KuberException(err)
        # the Status body overrides both message and code
        @test e.code == 404
        @test e.message == "pods \"nope\" not found"
        @test e.status isa R.KIND_TYPES[("v1", "Status")]
        @test e.response === err
        @test occursin("not found", sprint(showerror, e))

        # a non-Status body is kept verbatim, and the HTTP status stands
        plain = Runtime.ApiError("readCoreV1NamespacedPod", 503, Pair{String,String}[],
                                 Dict{String,Any}(), Vector{UInt8}("upstream boom"), nothing, nothing)
        e2 = KuberException(plain)
        @test e2.code == 503
        @test e2.message == "upstream boom"
        @test e2.status === nothing

        empty = Runtime.ApiError("readCoreV1NamespacedPod", 500, Pair{String,String}[],
                                 Dict{String,Any}(), UInt8[], nothing, nothing)
        @test KuberException(empty).message == "HTTP 500 in readCoreV1NamespacedPod"
    end

    @testset "retry classification" begin
        retryable(e) = Kuber.k8s_retry_cond(nothing, e)[2]
        api(status) = Runtime.ApiError("op", status, Pair{String,String}[], Dict{String,Any}(), UInt8[], nothing, nothing)

        @test retryable(api(503))
        @test retryable(api(500))
        @test retryable(api(504))
        @test !retryable(api(404))
        @test !retryable(api(409))
        @test !retryable(api(401))

        @test retryable(KuberException(503, "boom", nothing, nothing))
        @test !retryable(KuberException(404, "gone", nothing, nothing))

        # transport failures: HTTP.jl exceptions now, not is_request_interrupted
        @test retryable(HTTP.ConnectError("127.0.0.1:1", ErrorException("refused")))
        @test retryable(HTTP.DNSError("nosuchhost", ErrorException("nxdomain")))
        @test retryable(HTTP.TimeoutError("read", 5_000_000_000))
        @test retryable(Base.IOError("connection reset by peer", -104))
        @test retryable(EOFError())
        # …but not the ones that are decisions rather than accidents
        @test !retryable(HTTP.CanceledError("cancelled"))
        @test !retryable(HTTP.AddressInUseError("127.0.0.1:8801"))
        @test !retryable(ErrorException("something else"))
        # a truncated watch stream is handled by the watch loop, not here
        @test !retryable(Runtime.DecodeError("streaming response ended with a truncated item"))

        # and it actually retries. `max_tries` counts retries, so the call is
        # attempted max_tries+1 times — unchanged from the 0.2.x line.
        tries = 0
        try
            Kuber.k8s_retry(; max_tries = 3, tps = 100) do
                tries += 1
                throw(api(503))
            end
        catch
        end
        @test tries == 4

        tries = 0
        try
            Kuber.k8s_retry(; max_tries = 3, tps = 100) do
                tries += 1
                throw(api(404))
            end
        catch
        end
        @test tries == 1
    end

    @testset "watch-stream failures are recoverable" begin
        # The watch pump re-establishes when the raw channel dies with either a
        # DecodeError (a truncated item) or anything k8s_retry_cond accepts. The
        # case that matters is a connection aborted mid-chunk — an apiserver
        # restart or network drop — which HTTP.jl reports as a ParseError. Before
        # this was classified as recoverable the pump rethrew it and the watch
        # died, which is precisely what Kuber #68 is about.
        recoverable(e) = e isa Runtime.DecodeError || Kuber.k8s_retry_cond(nothing, e)[2]

        @test recoverable(HTTP.ParseError("unexpected EOF while reading HTTP/1 data"))
        @test recoverable(Runtime.DecodeError("streaming response ended with a truncated item"))
        @test recoverable(HTTP.ConnectError("127.0.0.1:8801", ErrorException("refused")))
        @test recoverable(EOFError())
        # but a deliberate cancellation is not a failure to recover from
        @test !recoverable(HTTP.CanceledError("cancelled"))
    end

    @testset "request options and timeouts" begin
        ctx = KuberContext()
        @test get_request_options(ctx) == NamedTuple()
        @test get_timeout(ctx) === nothing

        set_timeout(ctx, 30)
        @test get_timeout(ctx) == 30
        @test Kuber._call_options(ctx) == (request_timeout = 30,)
        # a watch has no overall deadline, but keeps the other options
        @test Kuber._call_options(ctx; watch = true) == NamedTuple()
        set_request_options(ctx; connect_timeout = 5)
        @test Kuber._call_options(ctx; watch = true) == (connect_timeout = 5,)
        @test get_timeout(ctx) == 30

        with_timeout(ctx, 10) do c
            @test get_timeout(c) == 10
        end
        @test get_timeout(ctx) == 30

        # and it restores on error
        @test_throws ErrorException with_timeout(ctx, 10) do c
            error("boom")
        end
        @test get_timeout(ctx) == 30

        wctx = Kuber.KuberWatchContext(ctx, Kuber.KuberEventStream(1))
        @test get_timeout(wctx) == 30
        with_timeout(wctx, 10) do w
            @test get_timeout(w) == 10
        end
        @test get_timeout(wctx) == 30
    end

    @testset "api_group naming is unchanged" begin
        @test Kuber.api_group("apiregistration.k8s.io") == "Apiregistration"
        @test Kuber.api_group("karpenter.sh") == "KarpenterSh"
        @test Kuber.api_group("apps") == "Apps"
        @test Kuber.api_group("rbac.authorization.k8s.io") == "RbacAuthorization"
    end

    @testset "override_pref" begin
        @test Kuber.override_pref("apps", "v1", nothing) == "v1"
        @test Kuber.override_pref("apps", "v1", ("apps" => "v1beta2",)) == "v1beta2"
        @test Kuber.override_pref("batch", "v1", ("apps" => "v1beta2",)) == "v1"
    end

    @testset "KuberEvent" begin
        pod = kuber_obj(POD_JSON)
        ev = KuberEvent("ADDED", pod)
        @test ev.type == "ADDED"                 # not `type_`, unlike the generated model
        @test ev.object === pod
        @test occursin("ADDED", sprint(show, ev))
    end
end
