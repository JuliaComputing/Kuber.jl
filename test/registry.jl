# Offline checks on the generated layer: no cluster needed.
#
# These are the Phase 1 gate of OpenAPIv1TrialBranchPlan.md §6 — the registry
# loads and every entry in it resolves. A failure here means the generation
# pipeline and the emitted tables have drifted apart, which is a regeneration
# problem, never something to patch by hand in src/ApiImpl/generated.
using Kuber, Test

const R = Kuber.ApiImpl

@testset "registry" begin
    @testset "tables agree" begin
        @test length(R.GROUP_MODULES) == length(R.MODULE_GVS)
        @test Set(values(R.GROUP_MODULES)) == Set(keys(R.MODULE_GVS))
        for (gv, mod) in R.GROUP_MODULES
            @test R.MODULE_GVS[mod] == gv
        end
        @test keys(R.OPS) == keys(R.OP_PARAMS)
    end

    @testset "every kind resolves to a type in a shipped module" begin
        for ((apiversion, kind), T) in R.KIND_TYPES
            @test T isa Type
            @test haskey(R.MODULE_GVS, parentmodule(T))
            @test haskey(R.GROUP_MODULES, apiversion)
        end
    end

    @testset "every op resolves to a function in its own module" begin
        for (key, f) in R.OPS
            mod, verb, kind, scope = key
            @test f isa Function
            @test parentmodule(f) === mod
            @test verb in (:get, :list, :create, :replace, :patch, :delete, :deletecollection)
            @test scope in (:namespaced, :cluster, :allns)
        end
    end

    @testset "no watch operations leak in" begin
        # Trap 8: the middle path does not patch the deprecated /watch/ paths,
        # so nothing may reference a watch* operationId. Watching is
        # `watch=true` on the list op plus an accept-scoped codec.
        @test !any(startswith(String(nameof(f)), "watch") for f in values(R.OPS))
    end

    @testset "positional params are path order, body last" begin
        for (key, params) in R.OP_PARAMS
            mod, verb, kind, scope = key
            if scope === :namespaced
                @test first(params) === :namespace
            else
                @test :namespace ∉ params
            end
            if :body in params
                @test last(params) === :body
                @test verb in (:create, :replace, :patch)
            end
            @test allunique(params)
        end
    end

    @testset "spot checks" begin
        core = R.GROUP_MODULES["v1"]
        apps = R.GROUP_MODULES["apps/v1"]
        @test R.KIND_TYPES[("v1", "Pod")] === core.IoK8sApiCoreV1Pod
        @test R.KIND_TYPES[("v1", "PodList")] === core.IoK8sApiCoreV1PodList
        @test R.KIND_TYPES[("apps/v1", "Deployment")] === apps.IoK8sApiAppsV1Deployment
        @test R.OPS[(core, :list, :Pod, :namespaced)] === core.listcorev1namespacedpod
        @test R.OPS[(core, :list, :Pod, :allns)] === core.listcorev1podforallnamespaces
        @test R.OPS[(core, :get, :Pod, :namespaced)] === core.readcorev1namespacedpod
        @test R.OP_PARAMS[(core, :get, :Pod, :namespaced)] == [:namespace, :name]
        # cluster-scoped resources take the name alone
        @test R.OP_PARAMS[(core, :get, :Namespace, :cluster)] == [:name]
        # subresources get a synthetic kind off the parent resource's path, which
        # is how :PodLog (§5.4) reaches the table through the generic path
        @test R.OPS[(core, :get, :PodLog, :namespaced)] === core.readcorev1namespacedpodlog
        @test R.OPS[(core, :get, :PodStatus, :namespaced)] === core.readcorev1namespacedpodstatus
        # two shipped versions of one kind — why OPS is keyed by module
        @test R.OPS[(R.GROUP_MODULES["autoscaling/v1"], :list, :HorizontalPodAutoscaler, :allns)] !==
              R.OPS[(R.GROUP_MODULES["autoscaling/v2"], :list, :HorizontalPodAutoscaler, :allns)]
    end
end
