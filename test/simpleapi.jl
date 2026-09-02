# Offline checks on src/simpleapi.jl: resolution, kwarg translation, event
# decoding, and the watch-abort semantics of Kuber #67. No cluster needed.
using Kuber, JSON, Test

const R = Kuber.ApiImpl
const Runtime = Kuber.Runtime

@testset "simpleapi" begin
    @testset "sel" begin
        @test sel("name", :exists) == "name"
        @test sel("name", :in, "a", "b") == "name in (a,b)"
        @test sel("a in (x)", "b notin (y)") == "a in (x), b notin (y)"
    end

    @testset "kwarg translation" begin
        # snake_case to the generated lowercase names
        @test Kuber._op_kwargs((label_selector = "a=b",)) == (labelselector = "a=b",)
        @test Kuber._op_kwargs((resource_version = "42",)) == (resourceversion = "42",)
        @test Kuber._op_kwargs((tail_lines = 5,)) == (taillines = 5,)
        # already-lowercase names pass through
        @test Kuber._op_kwargs((labelselector = "a=b",)) == (labelselector = "a=b",)
        # `nothing` is dropped, not forwarded: generated optionals are
        # Union{Absent,T}, so an explicit nothing would fail request validation
        @test Kuber._op_kwargs((label_selector = nothing, limit = 5)) == (limit = 5,)
        @test Kuber._op_kwargs((;)) == NamedTuple()
    end

    @testset "scope resolution" begin
        @test Kuber._scopes("default") == (:namespaced, :cluster, :allns)
        @test Kuber._scopes("*") == (:allns, :cluster)
        @test Kuber._scopes(nothing) == (:cluster, :allns)
        @test Kuber._scopes("") == (:cluster, :allns)

        core = R.GROUP_MODULES["v1"]
        # namespaced kinds resolve namespaced
        key, f, params, scope = Kuber._find_op(core, :list, :Pod, "default")
        @test scope === :namespaced
        @test f === core.listcorev1namespacedpod
        @test params == [:namespace]
        # and fall back to all-namespaces for "*"
        @test Kuber._find_op(core, :list, :Pod, "*")[4] === :allns
        # a cluster-scoped kind falls back even though ctx.namespace looks set:
        # this is why `get(ctx, :Namespace, "default")` works without a kwarg
        @test Kuber._find_op(core, :get, :Namespace, "default")[4] === :cluster
        @test Kuber._find_op(core, :list, :Node, "default")[4] === :cluster
        # a missing verb is a clean error, not a reflective guess
        @test_throws ArgumentError Kuber._find_op(core, :create, :ComponentStatus, "default")
        @test_throws ArgumentError Kuber._find_op(core, :list, :NoSuchKind, "default")
    end

    @testset "positional arguments follow the spec's path order" begin
        # the namespace comes FIRST, the reverse of the old client
        @test Kuber._positional([:namespace, :name], "ns", "nm", nothing) == ["ns", "nm"]
        @test Kuber._positional([:name], nothing, "nm", nothing) == ["nm"]
        @test Kuber._positional(Symbol[], nothing, nothing, nothing) == []
        @test Kuber._positional([:namespace, :body], "ns", nothing, :payload) == ["ns", :payload]
        @test_throws ArgumentError Kuber._positional([:namespace], nothing, nothing, nothing)
        @test_throws ArgumentError Kuber._positional([:name], nothing, nothing, nothing)
        @test_throws ArgumentError Kuber._positional([:body], nothing, nothing, nothing)

        # Everything the apiserver serves calls its object parameter `name`, but
        # a group Kuber does not ship need not — custom.metrics.k8s.io's path is
        # /namespaces/{namespace}/{compositemetricname}. The name argument fills
        # whichever single non-namespace parameter there is.
        @test Kuber._positional([:namespace, :compositemetricname], "ns", "pods/*/rps", nothing) ==
              ["ns", "pods/*/rps"]
        @test_throws ArgumentError Kuber._positional([:compositemetricname], nothing, nothing, nothing)
        @test Kuber._takes_name([:namespace, :compositemetricname])
        @test !Kuber._takes_name([:namespace])
        @test !Kuber._takes_name([:namespace, :body])
        # …but two of them cannot be addressed positionally at all
        @test_throws ArgumentError Kuber._positional([:name, :other], nothing, "x", nothing)
    end

    @testset "custom metrics composite names" begin
        # custom.metrics.k8s.io addresses a metric by a composite path segment
        # rather than by a resource name. The helpers only build that segment;
        # exercising the call end to end needs a cluster running an adapter, so
        # what is pinned here is the naming, which is what master's helpers were.
        @test Kuber._composite_metric_name("http_requests") == "metrics/http_requests"
        @test Kuber._composite_metric_name("pods", "http_requests") == "pods/*/http_requests"
        @test Kuber._composite_metric_name("pods", "web-1", "http_requests") ==
              "pods/web-1/http_requests"

        # They route through the verb layer now instead of erroring outright, so
        # an unregistered group is reported as one.
        ctx = KuberContext()
        ctx.initialized = true
        for call in (() -> list_namespaced_custom_metrics(ctx, "http_requests"),
                     () -> list_namespaced_custom_metrics(ctx, "pods", "http_requests"),
                     () -> list_namespaced_custom_metrics(ctx, "pods", "web-1", "http_requests"),
                     () -> list_custom_metrics(ctx, "nodes", "cpu"),
                     () -> list_custom_metrics(ctx, "nodes", "node-1", "cpu"))
            e = try
                call()
            catch ex
                ex
            end
            @test e isa ArgumentError
            @test occursin("MetricValue", e.msg)
        end
    end

    @testset "a name is refused where the operation takes none" begin
        ctx = KuberContext()
        ctx.initialized = true
        ctx.modelapi[:Pod] = R.GROUP_MODULES["v1"]
        @test_throws ArgumentError list(ctx, :Pod, "somepod")
    end

    @testset "patch bodies are typed per media type" begin
        # k8s documents one object schema for all five patch media types, which
        # is untrue of json-patch — its body is an array of RFC 6902 operations.
        # patch_k8s_spec.jq §6 corrects the document, and this is what the
        # correction has to look like by the time `update!` reads it.
        apps = R.GROUP_MODULES["apps/v1"]
        media = R.OP_BODIES[(apps, :patch, :Deployment, :namespaced)]
        @test length(media) == 5
        jsonpatch = media["application/json-patch+json"]
        merge = media["application/merge-patch+json"]
        @test jsonpatch <: AbstractVector
        @test !(merge <: AbstractVector)
        @test merge === media["application/strategic-merge-patch+json"]
        @test merge === media["application/apply-patch+yaml"]
        @test merge === media["application/apply-patch+cbor"]

        # a json-patch array decodes into the array body type…
        ops = [Dict{String,Any}("op" => "replace", "path" => "/spec/replicas", "value" => 2)]
        decoded = Runtime._decode(jsonpatch, ops, false)
        @test decoded isa jsonpatch
        @test length(decoded) == 1
        @test decoded[1].additional_properties["path"] == "/spec/replicas"
        # …a nested value survives (JuliaRun's taint patch shape)
        taint = [Dict{String,Any}("op" => "replace", "path" => "/spec/taints",
                                  "value" => [Dict("key" => "k", "effect" => "NoSchedule")])]
        @test Runtime._decode(jsonpatch, taint, false)[1].additional_properties["value"][1]["key"] == "k"
        # …and the object model still refuses one, which is the break this fixes
        @test_throws Runtime.DecodeError Runtime._decode(merge, ops, false)

        # a merge patch stays an object
        @test Runtime._decode(merge, Dict("spec" => Dict("replicas" => 2)), false) isa merge

        ctx = KuberContext()
        ctx.initialized = true
        ctx.modelapi[:Deployment] = apps
        e = try
            update!(ctx, :Deployment, "d", Dict("spec" => Dict()), "application/json")
        catch ex
            ex
        end
        @test e isa ArgumentError
        @test occursin("unsupported patch type", e.msg)
        # the message lists what the API does document, in a stable order
        @test occursin("application/apply-patch+cbor, application/apply-patch+yaml", e.msg)
    end

    @testset "module resolution" begin
        ctx = KuberContext()
        ctx.initialized = true                      # pretend discovery ran
        ctx.modelapi[:Pod] = R.GROUP_MODULES["v1"]
        @test Kuber._resolve_module(ctx, :Pod, nothing) === R.GROUP_MODULES["v1"]
        @test Kuber._resolve_module(ctx, :Pod, "apps/v1") === R.GROUP_MODULES["apps/v1"]
        @test_throws ArgumentError Kuber._resolve_module(ctx, :Pod, "batch/v1beta1")
        @test_throws ArgumentError Kuber._resolve_module(ctx, :Unknown, nothing)
    end

    @testset "watch frame decoding" begin
        frame = JSON.parse("""{"type": "ADDED", "object": {"kind": "Pod", "apiVersion": "v1",
            "metadata": {"name": "p1", "namespace": "default", "resourceVersion": "1234"},
            "spec": {"containers": [{"name": "c", "image": "busybox"}]}}}""")
        event = Kuber._to_event(frame)
        @test event isa KuberEvent
        @test event.type == "ADDED"
        @test event.object isa R.KIND_TYPES[("v1", "Pod")]
        @test event.object.metadata.name == "p1"
        # the generated field is lowercase
        @test Kuber._resource_version(event.object) == "1234"

        # an unknown kind is handed back raw rather than throwing
        unknown = Kuber._to_event(Dict("type" => "ADDED",
            "object" => Dict("kind" => "Widget", "apiVersion" => "example.com/v1")))
        @test unknown.type == "ADDED"
        @test unknown.object isa AbstractDict

        # an ERROR frame carrying an expired-resourceVersion Status: what k8s
        # actually answers instead of an HTTP 410
        expired = Kuber._to_event(JSON.parse("""{"type": "ERROR", "object": {"kind": "Status",
            "apiVersion": "v1", "status": "Failure", "message": "too old resource version",
            "reason": "Expired", "code": 410}}"""))
        @test expired.type == "ERROR"
        @test Kuber._status_code(expired.object) == 410
        @test Kuber._status_code(Dict("code" => 410)) == 410
        @test Kuber._status_code(Dict{String,Any}()) === nothing
    end

    @testset "resource version extraction" begin
        @test Kuber._resource_version(Dict("metadata" => Dict("resourceVersion" => "7"))) == "7"
        @test Kuber._resource_version(Dict("metadata" => Dict())) === nothing
        @test Kuber._resource_version(Dict{String,Any}()) === nothing
        list = kuber_obj("""{"kind": "PodList", "apiVersion": "v1",
            "metadata": {"resourceVersion": "99"}, "items": []}""")
        @test Kuber._resource_version(list) == "99"
        # ABSENT metadata must not throw
        @test Kuber._resource_version(kuber_obj("""{"kind":"Pod","apiVersion":"v1"}""")) === nothing
    end

    @testset "typed result from an untyped delete response" begin
        raw = JSON.parse("""{"kind": "Status", "apiVersion": "v1", "status": "Success", "code": 200}""")
        typed = Kuber._typed_result(raw)
        @test typed isa R.KIND_TYPES[("v1", "Status")]
        @test kuber_kind(typed) == "Status"
        # unknown kinds and non-objects pass through untouched
        @test Kuber._typed_result(Dict("kind" => "Widget", "apiVersion" => "x/v1")) isa AbstractDict
        @test Kuber._typed_result("plain text") == "plain text"
        @test Kuber._typed_result(nothing) === nothing
    end

    @testset "watch processor failure aborts the watch" begin
        # A `streamprocessor` that throws must abort the watch promptly and
        # propagate the error (Kuber #67). Before the fix the processor task died
        # silently while `@sync` kept waiting on the long-running watched task —
        # a deaf watch: events kept buffering with no error surfaced until the
        # server dropped the connection.
        ctx = KuberContext()      # only passed through to KuberWatchContext; no server needed
        producer = (watchctx) -> begin
            # mimic the watch pump: keep streaming until the stream is closed
            # under it (put! on a closed channel throws)
            i = 0
            while true
                put!(watchctx.stream, (i += 1))
                sleep(0.05)
            end
        end
        t0 = time()
        @test_throws Exception watch(ctx, producer) do stream
            take!(stream)
            error("processor failure")
        end
        # must fail fast — processor death closes the stream, which kills the
        # producer's next put! — not linger until the producer would have ended
        @test (time() - t0) < 10.0
    end
end
