using Test
include("K8sCoreV1P.jl")
using .K8sCoreV1P
const K = K8sCoreV1P

# full validation ON — the point of the patched bake is that defaults now work
client = K.Client("http://127.0.0.1:8801"; require_credentials=false)

@testset "baked patched client vs live cluster" begin
    @testset "pod list decodes (nullable Time fix)" begin
        pods = K.listcorev1podforallnamespaces(; client, limit=Int64(50))
        @test pods isa K.IoK8sApiCoreV1PodList
        println("    pods: ", length(pods.items))
        conds = [c for p in pods.items if !(p.status isa K.Absent) && !(p.status.conditions isa K.Absent) for c in p.status.conditions]
        nulls = count(c -> c.lastprobetime === nothing, conds)
        println("    conditions: ", length(conds), " (", nulls, " with lastProbeTime=null)")
        @test !isempty(conds) && nulls > 0     # the previously-fatal nulls decode as `nothing`
    end

    @testset "watch decodes WatchEvent (schema patch)" begin
        cms = K.listcorev1namespacedconfigmap("default"; client)
        events = Channel{Any}(16)
        K.watchcorev1namespacedconfigmaplist("default"; client,
            resourceversion=cms.metadata.resourceversion, stream_to=events)
        run(`kubectl delete configmap baked-watch-test -n default --ignore-not-found`)
        run(`kubectl create configmap baked-watch-test --from-literal=k=v -n default`)
        wait_ok = timedwait(() -> isready(events) || !isopen(events), 20.0)
        println("    wait: ", wait_ok, " isready=", isready(events), " isopen=", isopen(events))
        e = take!(events)   # surfaces close-with-error if the stream failed
        println("    event: ", typeof(e).name.name, " type=", e.type_, " name=", e.object.additional_properties["metadata"]["name"])
        @test e isa K.IoK8sApimachineryPkgApisMetaV1WatchEvent
        @test e.type_ == "ADDED"
        @test e.object.additional_properties["metadata"]["name"] == "baked-watch-test"

        # a second live event on the same stream
        run(`kubectl delete configmap baked-watch-test -n default`)
        @test timedwait(() -> isready(events), 20.0) == :ok
        e2 = take!(events)
        println("    event: type=", e2.type_, " name=", e2.object.additional_properties["metadata"]["name"])
        @test e2.type_ == "DELETED"

        close(events)   # consumer-side cancel
        sleep(2)
        @test !isopen(events)
    end
end
println("BAKED DONE")
