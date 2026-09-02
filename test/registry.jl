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

    @testset "request bodies name a type per media type" begin
        # Since patch_k8s_spec.jq §6 a PATCH does not have one body type: four of
        # its media types take the `Patch` object model and json-patch takes the
        # `JSONPatch` array. The rule has to hold for every patchable kind in
        # every module, which is what this asserts — a document where it silently
        # did not apply would leave json-patch callers broken again.
        patchmedia = Set([
            "application/apply-patch+cbor", "application/apply-patch+yaml",
            "application/json-patch+json", "application/merge-patch+json",
            "application/strategic-merge-patch+json",
        ])
        npatch = 0
        for (key, media) in R.OP_BODIES
            mod, verb, kind, scope = key
            @test haskey(R.OPS, key)
            @test !isempty(media)
            for (m, T) in media
                @test m isa String
                @test T isa Type
            end
            if verb === :patch
                npatch += 1
                @test Set(keys(media)) == patchmedia
                jsonpatch = media["application/json-patch+json"]
                @test jsonpatch <: AbstractVector
                @test parentmodule(eltype(jsonpatch)) === mod
                # the other four stay the open-object Patch model
                @test media["application/merge-patch+json"] === media["application/apply-patch+yaml"]
                @test !(media["application/merge-patch+json"] <: AbstractVector)
            else
                @test collect(keys(media)) == ["application/json"]
            end
        end
        @test npatch > 0
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

    @testset "referenced schemas are one type, not a copy per use site" begin
        # The gate on patch rule §7. k8s wraps every property `$ref` in a
        # single-element `allOf` so it can hang a description beside it; read
        # literally that is a new schema, and the generator mints a type per use
        # site — `Pod.spec` became `…PodSpec2`, every kind got its own
        # `…Metadata`, and `PodList.items` its own element type, which is what
        # made `item isa kind_to_type(ctx, :Pod)` false (G18).
        #
        # Asserted as type *identity* rather than by counting types: a collapse
        # that produced an alias per use site would shrink the diff and still be
        # wrong.
        modelfield(T, f) = only(filter(t -> t !== Nothing && !(t <: Kuber.Runtime.Absent),
                                       Base.uniontypes(fieldtype(T, f))))

        for (gv, kind, spectype) in (("v1", "Pod", :IoK8sApiCoreV1PodSpec),
                                     ("v1", "Service", :IoK8sApiCoreV1ServiceSpec),
                                     ("apps/v1", "Deployment", :IoK8sApiAppsV1DeploymentSpec),
                                     ("batch/v1", "Job", :IoK8sApiBatchV1JobSpec))
            T = R.KIND_TYPES[(gv, kind)]
            mod = parentmodule(T)
            # the kind's own spec is the group's spec type, not a positional copy
            @test modelfield(T, :spec) === getfield(mod, spectype)
            # …and its metadata is the shared ObjectMeta of that module
            @test modelfield(T, :metadata) ===
                  getfield(mod, :IoK8sApimachineryPkgApisMetaV1ObjectMeta)
            # a list's items are the kind itself — the G18 assertion
            LT = R.KIND_TYPES[(gv, kind * "List")]
            @test eltype(modelfield(LT, :items)) === T
        end

        # nothing named after its position survives in any module
        for mod in values(R.GROUP_MODULES)
            @test isempty(filter(n -> occursin("ListItemsItem", String(n)), names(mod; all = true)))
        end
    end
end
