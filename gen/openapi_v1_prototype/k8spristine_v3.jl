using Test, JSON
include("K8sCoreV1.jl")   # PRISTINE spec — no patches
using .K8sCoreV1
const K = K8sCoreV1

@testset "pristine spec + fd4558c leniency vs live cluster" begin
    @testset "strict client still rejects (expected)" begin
        strict = K.Client("http://127.0.0.1:8801"; require_credentials=false)
        @test_throws K.SchemaValidationError K.listcorev1podforallnamespaces(; client=strict, limit=Int64(20))
    end

    @testset "tolerant client decodes pods (null Time -> nothing)" begin
        tolerant = K.Client("http://127.0.0.1:8801"; require_credentials=false, validate_responses=false)
        pods = K.listcorev1podforallnamespaces(; client=tolerant, limit=Int64(50))
        @test pods isa K.IoK8sApiCoreV1PodList
        conds = [c for p in pods.items if !(p.status isa K.Absent) && !(p.status.conditions isa K.Absent) for c in p.status.conditions]
        nulls = count(c -> c.lastprobetime === nothing, conds)
        println("    pods=", length(pods.items), " conditions=", length(conds), " null lastProbeTime=", nulls)
        @test nulls > 0
    end

    @testset "watch codec: parameterized key vs real k8s content-type" begin
        # k8s replies plain application/json, so the parameterized registration should NOT fire
        c1 = K.Client("http://127.0.0.1:8801"; require_credentials=false, validate_responses=false)
        K.codec!(c1, "application/json;stream=watch"; decode=(bytes, media) -> (:codec_fired, JSON.parse(String(bytes))))
        cms = K.listcorev1namespacedconfigmap("default"; client=c1)
        events = Channel{Any}(16)
        K.listcorev1namespacedconfigmap("default"; client=c1, watch=true,
            resourceversion=cms.metadata.resourceversion, stream_to=events)
        run(`kubectl delete configmap v3-watch-test -n default --ignore-not-found`)
        run(`kubectl create configmap v3-watch-test --from-literal=k=v -n default`)
        timedwait(() -> isready(events) || !isopen(events), 15.0)
        r1 = try take!(events) catch e; e end
        fired = r1 isa Tuple && r1[1] === :codec_fired
        println("    parameterized codec fired on real k8s: ", fired, " (got ", typeof(r1), ")")
        close(events)

        # NEW at 1ff9ba8: same shared client, parameterized codec + accept= -> fires
        events_a = Channel{Any}(16)
        K.listcorev1namespacedconfigmap("default"; client=c1, watch=true,
            resourceversion=cms.metadata.resourceversion,
            accept="application/json;stream=watch", stream_to=events_a)
        run(`kubectl delete configmap v3-watch-test -n default --ignore-not-found`)
        run(`kubectl create configmap v3-watch-test --from-literal=k=v -n default`)
        @test timedwait(() -> isready(events_a), 15.0) == :ok
        ra = take!(events_a)
        println("    accept-scoped codec fired on shared client: ", ra isa Tuple && ra[1] === :codec_fired)
        @test ra isa Tuple && ra[1] === :codec_fired
        ev = ra[2]
        @test ev["type"] in ("ADDED","MODIFIED","DELETED")
        @test ev["object"]["metadata"]["name"] == "v3-watch-test"
        close(events_a)

        # ... and buffered calls on that same client are untouched by the codec
        cms_again = K.listcorev1namespacedconfigmap("default"; client=c1)
        @test cms_again isa K.IoK8sApiCoreV1ConfigMapList

        # plain-json codec on a DEDICATED watch client: should fire
        c2 = K.Client("http://127.0.0.1:8801"; require_credentials=false, validate_responses=false)
        K.codec!(c2, "application/json"; decode=(bytes, media) -> JSON.parse(String(bytes)))
        events2 = Channel{Any}(16)
        K.listcorev1namespacedconfigmap("default"; client=c2, watch=true,
            resourceversion=cms.metadata.resourceversion, stream_to=events2)
        @test timedwait(() -> isready(events2), 15.0) == :ok
        e = take!(events2)
        println("    plain-json codec item: ", typeof(e), " type=", get(e, "type", nothing), " name=", get(get(e, "object", Dict()), "metadata", Dict())["name"])
        @test e isa AbstractDict && e["type"] in ("ADDED","MODIFIED","DELETED")
        @test e["object"]["metadata"]["name"] == "v3-watch-test"
        close(events2)
        run(`kubectl delete configmap v3-watch-test -n default --ignore-not-found`)
    end
end
println("PRISTINE V3 DONE")
