using Kuber
using JSON
using Base64
using Test

# The offline suites (Phase 1/2/3 gates of OpenAPIv1TrialBranchPlan.md §6) need
# no cluster and run first, so a broken registry or a broken verb layer is
# reported before anything touches the network.
include("registry.jl")
include("register.jl")
include("helpers.jl")
include("simpleapi.jl")
# Retries drive a fake apiserver that always fails, so they are offline too.
include("retries.jl")

# Watch recovery runs against a fake apiserver, so it is offline too. It waits on
# real timing (a first event that has to compile the whole decode path, then
# several re-establishments), which costs about half a minute, and it covers the
# watch acceptance criteria nothing else does — stop, re-watch, truncation,
# expiry, backoff. On by default; set KUBER_SKIP_WATCH_RECOVERY=1 to skip it.
if get(ENV, "KUBER_SKIP_WATCH_RECOVERY", "0") == "1"
    @warn "skipping test/watch_recovery.jl (KUBER_SKIP_WATCH_RECOVERY=1)"
else
    include("watch_recovery.jl")
end

# The rest is an integration suite: it creates and deletes real objects against a
# live API server. Point it at a `kubectl proxy` (CI uses kind + kubectl proxy;
# local runs used k3s v1.35.4 on port 8801).
const SERVER = get(ENV, "KUBER_TEST_SERVER", "http://localhost:8001")

const REGISTRY = Kuber.ApiImpl

function server_reachable(server)
    try
        ctx = KuberContext()
        set_server(ctx, server)
        Kuber._discovery_get(ctx, "/api"; max_tries = 1)
        return true
    catch
        return false
    end
end

function init_context(override = nothing, verbose = true)
    ctx = KuberContext()
    set_server(ctx, SERVER)
    set_ns(ctx, "default")
    set_retries(ctx; count = 3, all_apis = false)
    Kuber.set_api_versions!(ctx; override = override, verbose = verbose)
    ctx
end

function test_request_options(ctx)
    # Timeouts moved from the 0.2.x client's mutable `timeout[]` to HTTP.jl 2.x
    # request options on the context, so there is no DEFAULT_TIMEOUT_SECS to
    # compare against: unset means "no deadline".
    @test Kuber.get_timeout(ctx) === nothing

    Kuber.with_timeout(ctx, 10) do ctx
        @test Kuber.get_timeout(ctx) == 10
    end
    @test Kuber.get_timeout(ctx) === nothing

    wctx = Kuber.KuberWatchContext(ctx, Channel{Any}(1))
    @test Kuber.get_timeout(wctx) === nothing
    Kuber.with_timeout(wctx, 10) do wctx
        @test Kuber.get_timeout(wctx) == 10
        # a watch never carries an overall deadline, but keeps the other options
        @test !haskey(Kuber._call_options(wctx; watch = true), :request_timeout)
    end
    @test Kuber.get_timeout(wctx) === nothing

    # a live call still works with a deadline set
    Kuber.with_timeout(ctx, 30) do ctx
        @test Kuber.kuber_kind(get(ctx, :Namespace, "default")) == "Namespace"
    end
end

function list_cluster_components(ctx)
    @testset "List component status" begin
        res = get(ctx, :ComponentStatus)
        @test isa(res, Kuber.kind_to_type(ctx, :ComponentStatusList))
    end

    @testset "Status of single component" begin
        res = get(ctx, :ComponentStatus, "scheduler")
        @test isa(res, Kuber.kind_to_type(ctx, :ComponentStatus))
    end

    @testset "List all endpoints" begin
        res = get(ctx, :Endpoints)
        @test isa(res, Kuber.kind_to_type(ctx, :EndpointsList))
    end

    @testset "List all namespaces" begin
        res = get(ctx, :Namespace)
        @test isa(res, Kuber.kind_to_type(ctx, :NamespaceList))
    end

    nothing
end

function list_namespace_objects(ctx)
    @testset "List pods in default namespace" begin
        res = get(ctx, :Pod)
        @test isa(res, Kuber.kind_to_type(ctx, :PodList))
    end

    @testset "List in system namespace" begin
        set_ns(ctx, "kube-system")
        res = get(ctx, :Pod)
        @test isa(res, Kuber.kind_to_type(ctx, :PodList))

        res = get(ctx, :PodTemplate)
        @test isa(res, Kuber.kind_to_type(ctx, :PodTemplateList))
    end

    @testset "List in default namespace" begin
        set_ns(ctx, "default")
        res = get(ctx, :PodTemplate)
        @test isa(res, Kuber.kind_to_type(ctx, :PodTemplateList))

        res = get(ctx, :ReplicationController)
        @test isa(res, Kuber.kind_to_type(ctx, :ReplicationControllerList))
    end

    @testset "List across all namespaces" begin
        res = get(ctx, :Pod; namespace = "*")
        @test isa(res, Kuber.kind_to_type(ctx, :PodList))
    end

    nothing
end

function create_versioned_models(ctx)
    # The old version of this test used batch/v1beta1 and batch/v2alpha1
    # CronJobs; both were removed from Kubernetes long before 1.35, and batch
    # now serves v1 alone. autoscaling is the group that still offers one kind
    # in two served versions, so it is what exercises versioned typing.
    hpa_v1 = kuber_obj("""{
        "kind": "HorizontalPodAutoscaler",
        "apiVersion": "autoscaling/v1",
        "metadata": {"name": "hello"},
        "spec": {
            "scaleTargetRef": {"kind": "Deployment", "name": "hello"},
            "maxReplicas": 2
        }
    }""")
    @test isa(hpa_v1, REGISTRY.KIND_TYPES[("autoscaling/v1", "HorizontalPodAutoscaler")])

    hpa_v2 = kuber_obj("""{
        "kind": "HorizontalPodAutoscaler",
        "apiVersion": "autoscaling/v2",
        "metadata": {"name": "hello"},
        "spec": {
            "scaleTargetRef": {"kind": "Deployment", "name": "hello"},
            "maxReplicas": 2
        }
    }""")
    @test isa(hpa_v2, REGISTRY.KIND_TYPES[("autoscaling/v2", "HorizontalPodAutoscaler")])
    @test typeof(hpa_v1) !== typeof(hpa_v2)

    # a kind this build does not ship is a clean lookup miss
    @test_throws KeyError kuber_obj("""{"kind": "CronJob", "apiVersion": "batch/v1beta1"}""")
end

function create_delete_job(ctx, testid)
    nginx_pod = kuber_obj("""{
        "kind": "Pod",
        "metadata":{
            "name": "nginx-pod$testid",
            "namespace": "default",
            "labels": {
                "name": "nginx-pod$testid"
            }
        },
        "spec": {
            "containers": [{
                "name": "nginx$testid",
                "image": "nginx",
                "ports": [{"containerPort": 80}],
                "resources": {
                    "limits": {
                        "memory": "128Mi",
                        "cpu": "500m"
                    }
                }
            }]
        }
    }""")

    nginx_service = kuber_obj("""{
        "kind": "Service",
        "metadata": {
            "name": "nginx-service$testid",
            "namespace": "default",
            "labels": {"name": "nginx-service$testid"}
        },
        "spec": {
            "ports": [{"port": 80}],
            "selector": {"name": "nginx-pod$testid"}
        }
    }""")

    nginx_rc = kuber_obj("""{
        "kind": "ReplicationController",
        "metadata": {
            "name": "nginx-rc$testid",
            "labels": {
                "name": "nginx-rc$testid"
            }
        },
        "spec": {
            "replicas": 3,
            "selector": {
                "name": "nginx-pod$testid"
            },
            "template": {
                "metadata":{
                    "name": "nginx-pod$testid",
                    "namespace": "default",
                    "labels": {
                        "name": "nginx-pod$testid"
                    }
                },
                "spec": {
                    "containers": [{
                        "name": "nginx$testid",
                        "image": "nginx",
                        "ports": [{"containerPort": 80}],
                        "resources": {
                            "limits": {
                                "memory": "64Mi",
                                "cpu": "100m"
                            }
                        }
                    }]
                }
            }
        }
    }""")

    job = kuber_obj("""{
        "kind": "Job",
        "apiVersion": "batch/v1",
        "metadata": {"name": "hello-job$testid"},
        "spec": {
            "template": {
                "spec": {
                    "containers": [{
                        "name": "hello$testid",
                        "image": "busybox",
                        "args": ["/bin/sh", "-c", "date"]
                    }],
                    "restartPolicy": "Never"
                }
            }
        }
    }""")

    deployment = kuber_obj("""{
        "kind": "Deployment",
        "apiVersion": "apps/v1",
        "metadata": {"name": "hello-dep$testid"},
        "spec": {
            "replicas": 1,
            "selector": {"matchLabels": {"name": "hello-dep$testid"}},
            "template": {
                "metadata": {"labels": {"name": "hello-dep$testid"}},
                "spec": {
                    "containers": [{
                        "name": "busybox$testid",
                        "image": "busybox",
                        "args": ["sleep", "3600"]
                    }]
                }
            }
        }
    }""")

    @testset "Kind to Type" begin
        @test isa(nginx_pod, Kuber.kind_to_type(ctx, "Pod"))
        @test isa(nginx_service, Kuber.kind_to_type(ctx, "Service"))
        @test isa(nginx_rc, Kuber.kind_to_type(ctx, "ReplicationController"))
        @test isa(job, Kuber.kind_to_type(ctx, "Job"))
        @test isa(deployment, Kuber.kind_to_type(ctx, "Deployment"))
    end

    @testset "Create nginx pod" begin
        res = put!(ctx, nginx_pod)
        @test isa(res, Kuber.kind_to_type(ctx, :Pod))
    end

    @testset "Create nginx service" begin
        res = put!(ctx, nginx_service)
        @test isa(res, Kuber.kind_to_type(ctx, :Service))
    end

    @testset "Create/patch/delete a Job and a Deployment" begin
        res = put!(ctx, job)
        @test kuber_kind(res) == "Job"

        res = put!(ctx, deployment)
        @test kuber_kind(res) == "Deployment"
        @test Kuber._field(res.spec.replicas) == 1

        patched = update!(ctx, :Deployment, "hello-dep$testid",
                          Dict("spec" => Dict("replicas" => 2)), "application/merge-patch+json")
        @test Kuber._field(patched.spec.replicas) == 2

        # a patch media type k8s does not document is rejected before the call
        @test_throws ArgumentError update!(ctx, :Deployment, "hello-dep$testid",
                                          Dict("spec" => Dict()), "application/json")

        # A JSON patch is an ARRAY of RFC 6902 operations, not an object — the
        # shape every json-patch caller in JuliaRun and JobLoops uses, and the
        # one k8s's own document gets wrong (patch_k8s_spec.jq §6).
        patched = update!(ctx, :Deployment, "hello-dep$testid",
                          [Dict{String,Any}("op" => "replace", "path" => "/spec/replicas", "value" => 3)],
                          "application/json-patch+json")
        @test Kuber._field(patched.spec.replicas) == 3

        # Two operations in one document, as julia_parallel_scale sends for a
        # Job, and with an object as the value, as taint_update_patch does. The
        # `add` names /metadata/labels rather than a key inside it: this
        # deployment has no labels, and RFC 6902 `add` needs its parent to exist
        # — a nested path is a 422 from the apiserver.
        patched = update!(ctx, :Deployment, "hello-dep$testid", [
                Dict{String,Any}("op" => "replace", "path" => "/spec/replicas", "value" => 1),
                Dict{String,Any}("op" => "add", "path" => "/metadata/labels",
                                 "value" => Dict("patched" => "yes")),
            ], "application/json-patch+json")
        @test Kuber._field(patched.spec.replicas) == 1
        @test Kuber.kuber_props(patched.metadata.labels)["patched"] == "yes"

        # a patch handed over as JSON text, which the 0.2.x client accepted
        patched = update!(ctx, :Deployment, "hello-dep$testid",
                          """{"metadata": {"labels": {"via": "text"}}}""",
                          "application/merge-patch+json")
        @test Kuber.kuber_props(patched.metadata.labels)["via"] == "text"

        # a strategic merge patch, k8s's own default and the third body shape
        patched = update!(ctx, :Deployment, "hello-dep$testid",
                          Dict("metadata" => Dict("labels" => Dict("strategic" => "yes"))),
                          "application/strategic-merge-patch+json")
        @test Kuber.kuber_props(patched.metadata.labels)["strategic"] == "yes"

        # …and a typed model as the patch body (JuliaRun patches Secrets this way)
        secret = kuber_obj("""{"kind": "Secret", "apiVersion": "v1",
            "metadata": {"name": "patch-secret$testid", "namespace": "default"},
            "data": {"a": "$(Base64.base64encode("one"))"}}""")
        @test kuber_kind(put!(ctx, secret)) == "Secret"
        updated = kuber_obj("""{"kind": "Secret", "apiVersion": "v1",
            "metadata": {"name": "patch-secret$testid", "namespace": "default"},
            "data": {"a": "$(Base64.base64encode("two"))"}}""")
        patchedsecret = update!(ctx, :Secret, "patch-secret$testid", updated,
                                "application/merge-patch+json")
        # secret data is `format: byte`, which the runtime decodes for us: what
        # comes back is the plaintext as bytes, NOT the base64 text the 0.2.x
        # client handed over (G12a)
        @test Kuber.kuber_props(patchedsecret.data)["a"] isa Vector{UInt8}
        @test String(copy(Kuber.kuber_props(patchedsecret.data)["a"])) == "two"
        @test kuber_kind(delete!(ctx, :Secret, "patch-secret$testid")) in ("Secret", "Status")

        # delete by object, reading kind and name off the model
        res = delete!(ctx, patched)
        @test kuber_kind(res) in ("Deployment", "Status")

        # `propagation_policy` matters here: without it the apiserver orphans
        # the Job's pods, so every run of this suite leaves a Completed pod
        # behind in `default`. CI never notices — a fresh kind cluster each
        # time — but a local cluster accumulates them, and they are not inert:
        # `list(ctx, :Pod)` is dominated by per-item response validation, so a
        # namespace with 35 stale pods made that call 116 ms instead of 9 ms
        # while re-measuring OpenAPIv1TrialResults.md §2.
        res = delete!(ctx, :Job, "hello-job$testid"; propagation_policy = "Background")
        @test kuber_kind(res) in ("Job", "Status")
    end

    @testset "Delete nginx service" begin
        res = delete!(ctx, :Service, "nginx-service$testid")
        # delete operations can return either the deleted object or a status
        # object (https://github.com/kubernetes-client/csharp/issues/44). The two
        # are types from different group modules, so compare the kind, not the
        # type: this build has one Status type per group module.
        @test kuber_kind(res) in ("Service", "Status")
    end

    @testset "Delete nginx pod" begin
        res = delete!(ctx, :Pod, "nginx-pod$testid")
        @test kuber_kind(res) in ("Pod", "Status")
    end

    nothing
end

function test_not_found(ctx)
    @testset "Missing object raises KuberException" begin
        err = try
            get(ctx, :Pod, "no-such-pod-here")
            nothing
        catch e
            e
        end
        @test err isa KuberException
        @test err.code == 404
        @test kuber_kind(err.status) == "Status"
        @test occursin("not found", err.message)
    end
end

"""
    ensure_absent(ctx, kind, name; namespace=nothing)

Delete an object if it is there, and wait until it is gone.

The live testsets create and delete in the same block with no `finally`, so a
failure anywhere in the middle leaves objects behind — and the *next* run then
fails at `put!` with a 409 before reaching whatever actually broke, which hides
the real error behind a stale one. Against `kind` in CI this never shows up,
because the cluster is new every time; locally it turns one failure into two
confusing runs.
"""
function ensure_absent(ctx, kind::Symbol, name::String; namespace = nothing, timeout = 90.0)
    nskwargs = namespace === nothing ? NamedTuple() : (; namespace = namespace)
    isgone(e) = e isa Kuber.KuberException && e.code == 404
    try
        # Background propagation for the same reason the Job delete below uses
        # it: cleaning up a controller without taking its pods leaves debris
        # that a later run then measures or trips over.
        delete!(ctx, kind, name; propagation_policy = "Background", nskwargs...)
    catch e
        isgone(e) && return nothing
        rethrow()
    end
    deadline = time() + timeout
    while time() < deadline
        try
            get(ctx, kind, name; nskwargs...)
        catch e
            isgone(e) && return nothing
            rethrow()
        end
        sleep(0.5)
    end
    error("$kind/$name is still present $(timeout)s after being deleted")
end

"""
    reset_test_objects(ctx, testid)

Clear anything a previous interrupted run left behind, so a rerun reports the
failure it actually hits.
"""
function reset_test_objects(ctx, testid)
    ensure_absent(ctx, :Pod, "nginx-pod$testid")
    ensure_absent(ctx, :Service, "nginx-service$testid")
    ensure_absent(ctx, :Job, "hello-job$testid")
    ensure_absent(ctx, :Deployment, "hello-dep$testid")
    ensure_absent(ctx, :Secret, "patch-secret$testid")
    ensure_absent(ctx, :Namespace, "kuber-dict-test$testid")   # cascades
    # G6's kinds. The PersistentVolume is cluster-scoped, so a leftover one
    # collides with the next run just as a namespaced object would; the claim
    # goes first, since a bound PV waits on pv-protection.
    ensure_absent(ctx, :ReplicaSet, "kuber-rs$testid")
    ensure_absent(ctx, :DaemonSet, "kuber-ds$testid")
    ensure_absent(ctx, :CronJob, "kuber-cj$testid")
    ensure_absent(ctx, :RoleBinding, "kuber-rb$testid")
    ensure_absent(ctx, :NetworkPolicy, "kuber-np$testid")
    ensure_absent(ctx, :PersistentVolumeClaim, "kuber-pvc$testid")
    ensure_absent(ctx, :PersistentVolume, "kuber-pv$testid")
    ensure_absent(ctx, :ConfigMap, "kuber-shapes$testid")
    ensure_absent(ctx, :Pod, "kuber-res$testid")
    ensure_absent(ctx, :Secret, "kuber-secret$testid")
end

function test_versioned(ctx, testid)
    reset_test_objects(ctx, testid)
    @testset "List Objects" begin
        list_cluster_components(ctx)
        list_namespace_objects(ctx)
    end

    @testset "Versioned Models" begin
        create_versioned_models(ctx)
    end

    @testset "Not Found" begin
        test_not_found(ctx)
    end

    # start a watch on pods
    lck = ReentrantLock()
    events = Any[]
    @async begin
        watch(ctx, list, :Pod) do stream
            for event in stream
                lock(lck) do
                    push!(events, event)
                end
            end
        end
    end

    @testset "Create/Delete Objects" begin
        create_delete_job(ctx, testid)
    end

    @testset "Create/Delete from dicts" begin
        create_delete_from_dicts(ctx, testid)
    end

    @testset "More kinds" begin
        create_delete_more_kinds(ctx, testid)
    end

    @testset "Data shapes" begin
        data_shapes(ctx, testid)
    end

    @testset "Secret round trip" begin
        secret_round_trip(ctx, testid)
    end

    @testset "Cluster-scoped writes" begin
        cluster_scoped_writes(ctx, testid)
    end

    @testset "Selector-scoped watch across namespaces" begin
        watch_selector_all_namespaces(ctx, testid)
    end

    @testset "Watch Events" begin
        timedwait(30.0; pollint = 1.0) do
            lock(lck) do
                any(isa(event, KuberEvent) && (event.type == "DELETED") for event in events)
            end
        end
        lock(lck) do
            @test !isempty(events)
            # the event protocol is unchanged: the initial typed List result
            # first, then events — except that events are Kuber's own KuberEvent
            # instead of the generated WatchEvent, so `event.type` still reads
            # naturally (the generated field is `type_`), and `event.object` is
            # already the typed model. `kuber_obj(ctx, event.object)` is no
            # longer needed, though it still accepts a dict for compatibility.
            @test any(isa(event, KuberEvent) for event in events)
            @test any(isa(event, Kuber.kind_to_type(ctx, :PodList)) for event in events)
            for event in events
                @test isa(event, Union{KuberEvent,Kuber.kind_to_type(ctx, :PodList)})
                if isa(event, KuberEvent)
                    @test event.type in ("ADDED", "MODIFIED", "DELETED", "BOOKMARK")
                    @test kuber_kind(event.object) == "Pod"
                    @test isa(event.object, Kuber.kind_to_type(ctx, :Pod))
                end
            end
        end
    end
end

"""
    create_delete_from_dicts(ctx, testid)

`put!(ctx, O::Symbol, dict)` — the form most production writes go through, and
the one the rest of this suite never used (G13 in OpenAPIv1ConsumerGaps.md).

Modelled on `services/JobLoops/src/hot_standby.jl`: a namespace from a
hand-built `Dict`, then a deployment from `JSON.parse` output — which is not a
`Dict` at all on JSON.jl 1.x, and is what a rendered template actually produces.
Between them the two cases cover both dictionary shapes a caller can arrive
with.
"""
function create_delete_from_dicts(ctx, testid)
    ns = "kuber-dict-test$testid"

    # hot_standby.jl:521-525, verbatim in shape
    namespace_yaml = Dict(
        "apiVersion" => "v1",
        "kind" => "Namespace",
        "metadata" => Dict("name" => ns),
    )
    created_ns = put!(ctx, :Namespace, namespace_yaml)
    @test kuber_kind(created_ns) == "Namespace"
    @test created_ns.metadata.name == ns
    # the dict form resolves the same type the typed form would
    @test isa(created_ns, Kuber.kind_to_type(ctx, :Namespace))

    deployment_spec = JSON.parse("""{
        "apiVersion": "apps/v1",
        "kind": "Deployment",
        "metadata": {"name": "dict-deploy$testid", "labels": {"app": "dict-deploy$testid"}},
        "spec": {
            "replicas": 1,
            "selector": {"matchLabels": {"app": "dict-deploy$testid"}},
            "template": {
                "metadata": {"labels": {"app": "dict-deploy$testid"}},
                "spec": {"containers": [{
                    "name": "nginx",
                    "image": "nginx",
                    "ports": [{"containerPort": 80}],
                    "resources": {"limits": {"memory": "128Mi", "cpu": "500m"}}
                }]}
            }
        }
    }""")
    # …and on JSON.jl 1.x that is a JSON.Object, not a Dict at all. This is why
    # `put!`'s dict method is typed `v::AbstractDict` and not master's
    # `Dict{String,Any}`: with the narrower signature a parsed template would
    # miss this method entirely and fall through to the untyped one.
    @test deployment_spec isa AbstractDict
    @test !(deployment_spec isa Dict)

    created = put!(ctx, :Deployment, deployment_spec; namespace = ns)
    @test kuber_kind(created) == "Deployment"
    @test created.metadata.name == "dict-deploy$testid"
    @test created.metadata.namespace == ns
    @test created.spec.replicas == 1
    # nested arrays and maps survived the round trip through the model
    container = created.spec.template.spec.containers[1]
    @test container.image == "nginx"
    @test Kuber.kuber_props(container.resources.limits)["cpu"].value == "500m"
    # the apiVersion came off the dict, not off discovery
    @test isa(created, REGISTRY.KIND_TYPES[("apps/v1", "Deployment")])

    # a dict with no "kind" is completed from the symbol (simpleapi.jl's merge)
    kindless = Dict{String,Any}(
        "apiVersion" => "v1",
        "metadata" => Dict{String,Any}("name" => "dict-cm$testid"),
        "data" => Dict{String,Any}("greeting" => "hello"),
    )
    cm = put!(ctx, :ConfigMap, kindless; namespace = ns)
    @test kuber_kind(cm) == "ConfigMap"
    @test Kuber.kuber_props(cm.data)["greeting"] == "hello"
    @test !haskey(kindless, "kind")          # the caller's dict is left alone

    @test kuber_kind(delete!(ctx, :ConfigMap, "dict-cm$testid"; namespace = ns)) in ("ConfigMap", "Status")
    @test kuber_kind(delete!(ctx, :Deployment, "dict-deploy$testid"; namespace = ns)) in ("Deployment", "Status")
    @test kuber_kind(delete!(ctx, :Namespace, ns)) in ("Namespace", "Status")
end

"""
    data_shapes(ctx, testid)

The shapes consumers actually read off a live result — G9, G10 and G11 in
OpenAPIv1ConsumerGaps.md.

One ConfigMap carries all three: it has labels, annotations and data, no
controller writes to it, and creating it makes the ConfigMap list non-empty,
which a list-shape assertion needs to mean anything.
"""
function data_shapes(ctx, testid)
    name = "kuber-shapes$testid"
    configmap = kuber_obj("""{
        "kind": "ConfigMap",
        "apiVersion": "v1",
        "metadata": {
            "name": "$name",
            "namespace": "default",
            "labels": {"name": "$name", "version": "7"},
            "annotations": {"kuber.test/note": "round trip", "kuber.test/seq": "1"}
        },
        "data": {"greeting": "hello"}
    }""")

    @testset "labels and annotations round trip (G9)" begin
        created = put!(ctx, configmap)
        @test kuber_kind(created) == "ConfigMap"
        fetched = get(ctx, :ConfigMap, name)

        labels = Kuber.kuber_props(fetched.metadata.labels)
        @test labels["name"] == name
        # `labels["version"]` is exactly what JobLoops' networkpolicy.jl:114
        # does to decide whether a policy needs updating
        @test labels["version"] == "7"
        annotations = Kuber.kuber_props(fetched.metadata.annotations)
        @test annotations["kuber.test/note"] == "round trip"
        @test annotations["kuber.test/seq"] == "1"
        @test Kuber.kuber_props(fetched.data)["greeting"] == "hello"

        # …and the reason kuber_props is needed at all: a k8s string map is an
        # open struct, not a dictionary, so the 0.2.x `labels["version"]` is a
        # MethodError rather than a wrong answer. This is the single assertion
        # that would have caught the networkpolicy.jl read.
        raw = Kuber._field(fetched.metadata.labels)
        @test !(raw isa AbstractDict)
        @test_throws MethodError raw["version"]
    end

    @testset "list shape (G11)" begin
        listed = list(ctx, :ConfigMap)
        # the guard JuliaRun's provisioning.jl:111 puts around every list result
        @test hasproperty(listed, :items)
        items = listed.items
        @test items isa Vector
        @test !isempty(items)
        @test any(i -> Kuber._field(i.metadata.name) == name, items)

        # A list item IS the standalone type, as it was on master. It briefly
        # was not: k8s wraps the element `$ref` in an `allOf` so it can hang a
        # description beside it, and read literally that is a new schema, so the
        # generator minted a `…ListItemsItem` per list kind. Patch rule §7
        # collapses the wrapper. G18.
        standalone = Kuber.kind_to_type(ctx, :ConfigMap)
        @test eltype(items) === standalone
        @test all(i -> i isa standalone, items)
        # …but k8s does not populate `kind` on list items, so the object form of
        # `delete!` still cannot take one. That half was never a regression —
        # master read the same absent field — and rule §7 does not change it.
        @test Kuber.kuber_kind(items[1]) == ""
        err = try
            delete!(ctx, items[1])
            nothing
        catch e
            e
        end
        @test err isa ArgumentError

        # _resource_version is unit-tested on synthetic dicts and objects; this
        # is it against a real list, and against the field it reads
        rv = Kuber._resource_version(listed)
        @test rv isa String
        @test !isempty(rv)
        @test rv == Kuber._field(listed.metadata.resourceversion)
        # per-item resource versions are what K8sReflector:12 keys its store on
        @test all(i -> Kuber._resource_version(i) isa String, items)
    end

    @testset "resource_version on a non-watch read (G10)" begin
        rv = Kuber._resource_version(list(ctx, :ConfigMap))
        # the generated spelling is a real query parameter on list operations:
        # "0" means "any version you have cached", which every server can serve
        cached = list(ctx, :ConfigMap; resourceversion = "0")
        @test kuber_kind(cached) == "ConfigMapList"

        rvnum = tryparse(Int, rv)
        if rvnum === nothing
            @warn "SKIPPING the resource_version comparison: $SERVER reports a non-numeric resourceVersion ($rv)"
        else
            # A version the cluster has never reached. Asking for it through the
            # generated spelling reaches the server, which waits for it briefly
            # and then gives up — proof the parameter is on the wire.
            huge = string(rvnum + 1_000_000_000)
            err = try
                list(ctx, :ConfigMap; resourceversion = huge, max_tries = 1)
                nothing
            catch e
                e
            end
            @test err isa KuberException
            @test err.code in (410, 504)

            # The documented spelling now behaves identically — `list` forwards
            # it to the operation on the non-watch path (G17). It used to be
            # swallowed by the named parameter and consulted only when watching,
            # so the same impossible version succeeded.
            err = try
                list(ctx, :ConfigMap; resource_version = huge, max_tries = 1)
                nothing
            catch e
                e
            end
            @test err isa KuberException
            @test err.code in (410, 504)

            # and the ordinary "not older than" read, which is what a consumer
            # actually passes: a version the cluster has certainly reached
            fresh = list(ctx, :ConfigMap; resource_version = rv, max_tries = 1)
            @test kuber_kind(fresh) == "ConfigMapList"
            @test Kuber._resource_version(fresh) !== nothing
            # "0" is the cheap cached read
            @test kuber_kind(list(ctx, :ConfigMap; resource_version = "0")) == "ConfigMapList"

            # The single-object read behaves the same way now. k8s does not
            # declare resourceVersion on read operations even though the
            # apiserver honours it, so patch rule §8 declares it — this
            # assertion is what proves the rule reached the wire.
            err = try
                get(ctx, :ConfigMap, name; resource_version = huge, max_tries = 1)
                nothing
            catch e
                e
            end
            @test err isa KuberException
            @test err.code in (410, 504)

            # …and the reads a consumer actually makes
            one = get(ctx, :ConfigMap, name; resource_version = "0", max_tries = 1)
            @test kuber_kind(one) == "ConfigMap"
            @test Kuber._field(one.metadata.name) == name
            # K8sReflector.jl:136-141's shape: re-read not older than a version
            # it already saw
            seen = Kuber._resource_version(one)
            again = get(ctx, :ConfigMap, name; resource_version = seen, max_tries = 1)
            @test Kuber._resource_version(again) == seen
        end
    end

    @testset "resource limits and requests are open structs (G12)" begin
        # `resources.limits["cpu"]` is what every consumer wrote against 0.2.x
        # and what `clustermgmt.jl:281-285` still writes. Both maps are open
        # structs now, so both need kuber_props — and `requests` matters more
        # than `limits`, because `container_resource` prefers it.
        #
        # A nodeSelector no node carries keeps the pod Pending, which is all
        # this needs: the spec comes back on the create response.
        podname = "kuber-res$testid"
        pod = kuber_obj("""{
            "kind": "Pod",
            "apiVersion": "v1",
            "metadata": {"name": "$podname", "namespace": "default"},
            "spec": {
                "nodeSelector": {"kuber-test/no-such-node": "true"},
                "containers": [{
                    "name": "busybox$testid",
                    "image": "busybox",
                    "args": ["sleep", "3600"],
                    "resources": {
                        "limits": {"cpu": "500m", "memory": "128Mi"},
                        "requests": {"cpu": "250m", "memory": "64Mi"}
                    }
                }]
            }
        }""")
        created = put!(ctx, pod)
        resources = Kuber._field(created.spec.containers[1].resources)
        @test resources !== nothing

        limits = Kuber.kuber_props(resources.limits)
        requests = Kuber.kuber_props(resources.requests)
        @test limits["cpu"].value == "500m"
        @test limits["memory"].value == "128Mi"
        @test requests["cpu"].value == "250m"
        @test requests["memory"].value == "64Mi"
        # Quantity is still a struct with a single `value`, so JuliaRun's
        # `string(cpu.value)` (api.jl:1841) survives structurally — only the
        # type identity differs, which is C1's problem
        @test fieldnames(typeof(limits["cpu"])) == (:value,)
        @test limits["cpu"].value isa Union{Float64,String}

        # …and the reason kuber_props is needed: neither map is a dictionary, so
        # the 0.2.x `in keys(res)` / `res["cpu"]` pair is a MethodError, not a
        # wrong answer. This is the shape of the clustermgmt.jl:281-285 break.
        raw = Kuber._field(resources.requests)
        @test !(raw isa AbstractDict)
        @test_throws MethodError keys(raw)
        @test_throws MethodError raw["cpu"]

        # After patch rule §7 `resources` is the shared ResourceRequirements
        # rather than a per-container positional copy, so its maps are one type
        # across every kind that embeds a pod template.
        @test typeof(resources) === REGISTRY.GROUP_MODULES["v1"].IoK8sApiCoreV1ResourceRequirements

        @test kuber_kind(delete!(ctx, :Pod, podname)) in ("Pod", "Status")
    end

    @test kuber_kind(delete!(ctx, :ConfigMap, name)) in ("ConfigMap", "Status")
    nothing
end

"""
    model_fieldtype(T, field) -> Type

The model type behind a generated field, with `Absent` and `Nothing` stripped
off its union. Lets a test build a nested model without naming the generated
type — the names are an implementation detail of the pipeline, and
`kind_to_type` deliberately exists so tests do not spell them.
"""
function model_fieldtype(T::Type, field::Symbol)
    ts = Base.uniontypes(fieldtype(T, field))
    return only(filter(t -> t !== Nothing && !(t <: Kuber.Runtime.Absent), ts))
end

"""
    secret_round_trip(ctx, testid)

`format: byte` out and back, and `stringData` — G7.

`JuliaRun/src/kubernetes/api.jl:203-248` builds Secrets whose `data` values are
raw `Vector{UInt8}`: `_as_binary_secret` base64-*decodes* anything that looks
base64 before handing it over, so what reaches Kuber is always bytes. The 0.2.x
client base64-encoded them onto the wire because the field is `format: byte`,
and the 1.0 runtime does the same in both directions — so those call sites
survive the port on their values. What changed is the container: `data` is an
open struct now, not a `Dict`, so `Secret(; data=bindata)` has to become
`Secret(; data=SecretData(additional_properties=bindata))`.
"""
function secret_round_trip(ctx, testid)
    name = "kuber-secret$testid"
    SecretT = Kuber.kind_to_type(ctx, :Secret)
    DataT = model_fieldtype(SecretT, :data)
    StringDataT = model_fieldtype(SecretT, :stringdata)
    MetaT = model_fieldtype(SecretT, :metadata)

    # deliberately not valid UTF-8, so a round trip that "works" by treating the
    # value as text cannot pass this
    binary = UInt8[0x00, 0xff, 0xfe, 0x01, 0x80]
    token = Vector{UInt8}(codeunits("s3cr3t-$testid"))

    secret = SecretT(;
        apiversion = "v1",
        kind = "Secret",
        type_ = "Opaque",
        metadata = MetaT(; name = name, namespace = "default"),
        data = DataT(; additional_properties = Dict("token" => token, "binary" => binary)),
        stringdata = StringDataT(; additional_properties = Dict("plain" => "hello-$testid")),
    )

    created = put!(ctx, secret)
    @test kuber_kind(created) == "Secret"

    fetched = get(ctx, :Secret, name)
    data = Kuber.kuber_props(fetched.data)
    # byte-identical both ways, including the bytes no encoding-by-accident
    # would survive
    @test data["token"] == token
    @test data["binary"] == binary
    @test data["token"] isa Vector{UInt8}
    # …so this is how a consumer reads one now. `String(base64decode(v))` — the
    # 0.2.x idiom — decodes a second time and yields rubbish rather than an
    # error, which is the G12a trap.
    @test String(copy(data["token"])) == "s3cr3t-$testid"

    # stringData is write-only: the apiserver folds it into data and never
    # returns it, so a consumer that writes it must not expect to read it back
    @test data["plain"] == Vector{UInt8}(codeunits("hello-$testid"))
    @test Kuber._field(fetched.stringdata, nothing) === nothing

    # JuliaRun's update_secret shape: a whole typed Secret as a merge patch,
    # carrying raw bytes again
    rotated = Vector{UInt8}(codeunits("rotated-$testid"))
    patch = SecretT(;
        apiversion = "v1",
        kind = "Secret",
        metadata = MetaT(; name = name),
        data = DataT(; additional_properties = Dict("token" => rotated)),
    )
    patched = update!(ctx, :Secret, name, patch, "application/merge-patch+json")
    patcheddata = Kuber.kuber_props(patched.data)
    @test patcheddata["token"] == rotated
    # A merge patch (RFC 7386) merges the map key by key rather than replacing
    # it, so keys the patch does not mention survive — only an explicit null
    # removes one. Pinned because the opposite is the natural guess, and it is
    # the difference between rotating one key and dropping every other secret in
    # the object.
    @test patcheddata["binary"] == binary
    @test sort!(collect(keys(patcheddata))) == ["binary", "plain", "token"]

    @test kuber_kind(delete!(ctx, :Secret, name)) in ("Secret", "Status")
    nothing
end

"""
    cluster_scoped_writes(ctx, testid)

Writing to a cluster-scoped kind — G8.

The Namespace half is already covered by `create_delete_from_dicts` (G13) and
the PersistentVolume half by `create_delete_more_kinds` (G6), both
create/delete. What was left is Node, and Node is different in kind: **no
consumer creates one.** The monorepo's `set_node_label`, `set_node_cordon` and
`taint_update_patch` all *patch* an existing node. Creating a Node object
through the API is possible, but it would test an operation nobody performs and
leave a kubelet-less NotReady node on the cluster for metrics-server and the
scheduler to trip over, so this patches a real node and puts it back.

The patches are the two consumer shapes: a merge patch carrying a label
(`set_node_label`) and a json-patch whose value is a nested array of dicts
(`taint_update_patch`). The taint uses `PreferNoSchedule` rather than
`NoSchedule`, and nothing here cordons: the rest of the live suite schedules
pods on the same node.
"""
function cluster_scoped_writes(ctx, testid)
    nodes = list(ctx, :Node)
    @test kuber_kind(nodes) == "NodeList"
    @test !isempty(nodes.items)
    nodename = Kuber._field(nodes.items[1].metadata.name)

    # cluster-scoped resolution: ctx.namespace is "default", and the read still
    # goes to /api/v1/nodes/<name> because the :namespaced lookup falls through
    node = get(ctx, :Node, nodename)
    @test kuber_kind(node) == "Node"
    @test isa(node, Kuber.kind_to_type(ctx, :Node))

    labelkey = "kuber-test.juliahub.com/g8"
    # set_node_label's shape: a merge patch on metadata.labels
    labelled = update!(ctx, :Node, nodename,
                       Dict("metadata" => Dict("labels" => Dict(labelkey => testid))),
                       "application/merge-patch+json")
    @test Kuber.kuber_props(labelled.metadata.labels)[labelkey] == testid

    # …and removing it again: in a merge patch an explicit null deletes the key,
    # which is the only way to remove one (G7 covers the other half of RFC 7386,
    # that unmentioned keys survive)
    unlabelled = update!(ctx, :Node, nodename,
                         Dict("metadata" => Dict("labels" => Dict(labelkey => nothing))),
                         "application/merge-patch+json")
    @test !haskey(Kuber.kuber_props(unlabelled.metadata.labels), labelkey)

    # taint_update_patch's shape: a json-patch whose value is an array of dicts.
    # Append rather than replace so the node's existing taints are untouched —
    # a control-plane node has one, and dropping it would be a live change to
    # the cluster rather than a test.
    original = Kuber._field(Kuber._field(node.spec).taints, nothing)
    taint = Dict{String,Any}("key" => "kuber-test.juliahub.com/g8",
                             "value" => testid,
                             "effect" => "PreferNoSchedule")
    addop, removeop = if original === nothing
        (Dict{String,Any}("op" => "add", "path" => "/spec/taints", "value" => [taint]),
         Dict{String,Any}("op" => "remove", "path" => "/spec/taints"))
    else
        (Dict{String,Any}("op" => "add", "path" => "/spec/taints/-", "value" => taint),
         Dict{String,Any}("op" => "remove", "path" => "/spec/taints/$(length(original))"))
    end

    tainted = update!(ctx, :Node, nodename, [addop], "application/json-patch+json")
    taints = Kuber._field(tainted.spec.taints, [])
    @test any(t -> Kuber._field(t.key) == "kuber-test.juliahub.com/g8", taints)
    @test length(taints) == (original === nothing ? 1 : length(original) + 1)

    restored = update!(ctx, :Node, nodename, [removeop], "application/json-patch+json")
    remaining = Kuber._field(restored.spec.taints, [])
    @test !any(t -> Kuber._field(t.key) == "kuber-test.juliahub.com/g8", remaining)
    @test length(remaining) == (original === nothing ? 0 : length(original))

    nothing
end

status_of(obj) = Kuber._field(obj.status, nothing)

"""
    get_when(cond, ctx, kind, name; namespace=nothing) -> model

`get` in a poll loop until `cond(object)` holds.

Several of the kinds in `create_delete_more_kinds` are only interesting once
their controller has written a status: a `get` issued immediately after `put!`
decodes an empty status block and so checks almost none of the kind's schema,
which is the whole point of G6.
"""
function get_when(cond, ctx, kind::Symbol, name::String; namespace = nothing, timeout = 60.0)
    nskwargs = namespace === nothing ? NamedTuple() : (; namespace = namespace)
    obj = nothing
    ok = timedwait(timeout; pollint = 0.5) do
        obj = get(ctx, kind, name; nskwargs...)
        cond(obj)
    end
    ok === :ok || error("$kind/$name did not reach the expected state in $(timeout)s")
    return obj
end

"""
    create_delete_more_kinds(ctx, testid)

The kinds consumers write that the rest of the live suite never submits — G6 in
OpenAPIv1ConsumerGaps.md.

Strict response validation checks every kind's schemas independently, and two of
the six patch rules were found by submitting a kind for the first time, so an
untested kind is an unchecked set of schemas rather than merely an untested code
path. Each kind here is therefore taken through all four decode paths that have
distinct schemas: create, a `get` once the controller has filled in a status,
a `list` (a separate `…List` schema — and an empty one would check nothing), and
delete (object-or-`Status`).

The objects are shaped after the real consumer templates, not invented:
ReplicaSet and DaemonSet from `JuliaRun/src/kubernetes/templates/`, CronJob from
`templates/julia/cronjob/cronjob.jl`, RoleBinding from
`src/kubernetes/provisioning.jl:110-136`, NetworkPolicy after JobLoops'.

Nothing here schedules a workload — `replicas: 0`, a `nodeSelector` no node
carries, `suspend: true` — which keeps the run cheap and, incidentally, keeps
the concurrent `:Pod` watch's event assertions clean.

Two of the fixtures are deliberately declawed relative to the templates they
copy. The RoleBinding names a Role that does not exist instead of JuliaRun's
`ClusterRole/admin`: RBAC permits a dangling `roleRef`, so the schema is
identical and the privilege grant is not. The NetworkPolicy selects on a label
no pod carries rather than the empty selector, which would be deny-all-ingress
for the namespace — inert under kind's CNI, but not under an enforcing one.
"""
function create_delete_more_kinds(ctx, testid)
    replicaset = kuber_obj("""{
        "kind": "ReplicaSet",
        "apiVersion": "apps/v1",
        "metadata": {"name": "kuber-rs$testid", "labels": {"name": "kuber-rs$testid"}},
        "spec": {
            "replicas": 0,
            "selector": {"matchLabels": {"name": "kuber-rs$testid"}},
            "template": {
                "metadata": {"labels": {"name": "kuber-rs$testid"}},
                "spec": {"containers": [{
                    "name": "busybox$testid",
                    "image": "busybox",
                    "args": ["sleep", "3600"]
                }]}
            }
        }
    }""")

    daemonset = kuber_obj("""{
        "kind": "DaemonSet",
        "apiVersion": "apps/v1",
        "metadata": {"name": "kuber-ds$testid", "labels": {"name": "kuber-ds$testid"}},
        "spec": {
            "selector": {"matchLabels": {"name": "kuber-ds$testid"}},
            "template": {
                "metadata": {"labels": {"name": "kuber-ds$testid"}},
                "spec": {
                    "nodeSelector": {"kuber-test/no-such-node": "true"},
                    "containers": [{
                        "name": "busybox$testid",
                        "image": "busybox",
                        "args": ["sleep", "3600"]
                    }]
                }
            }
        }
    }""")

    cronjob = kuber_obj("""{
        "kind": "CronJob",
        "apiVersion": "batch/v1",
        "metadata": {"name": "kuber-cj$testid", "labels": {"name": "kuber-cj$testid"}},
        "spec": {
            "schedule": "0 0 31 2 *",
            "concurrencyPolicy": "Forbid",
            "suspend": true,
            "startingDeadlineSeconds": 60,
            "jobTemplate": {
                "spec": {
                    "template": {
                        "metadata": {"labels": {"name": "kuber-cj$testid"}},
                        "spec": {
                            "restartPolicy": "Never",
                            "containers": [{
                                "name": "busybox$testid",
                                "image": "busybox",
                                "args": ["/bin/sh", "-c", "date"]
                            }]
                        }
                    }
                }
            }
        }
    }""")

    rolebinding = kuber_obj("""{
        "kind": "RoleBinding",
        "apiVersion": "rbac.authorization.k8s.io/v1",
        "metadata": {
            "name": "kuber-rb$testid",
            "namespace": "default",
            "labels": {"name": "kuber-rb$testid"}
        },
        "roleRef": {
            "apiGroup": "rbac.authorization.k8s.io",
            "kind": "Role",
            "name": "kuber-test-role$testid"
        },
        "subjects": [{"kind": "ServiceAccount", "name": "default", "namespace": "default"}]
    }""")

    networkpolicy = kuber_obj("""{
        "kind": "NetworkPolicy",
        "apiVersion": "networking.k8s.io/v1",
        "metadata": {
            "name": "kuber-np$testid",
            "namespace": "default",
            "labels": {"name": "kuber-np$testid", "version": "1"}
        },
        "spec": {
            "podSelector": {"matchLabels": {"kuber-test-np": "$testid"}},
            "policyTypes": ["Ingress"],
            "ingress": [{
                "from": [{"podSelector": {"matchLabels": {"kuber-test-np": "$testid"}}}],
                "ports": [{"protocol": "TCP", "port": 80}]
            }]
        }
    }""")

    # A PV and a PVC that can never bind to each other: they name different
    # storage classes. A bound PV would sit in Terminating behind pv-protection
    # until the claim was gone, which makes cleanup order matter; this way it
    # does not. Retain for the same reason.
    persistentvolume = kuber_obj("""{
        "kind": "PersistentVolume",
        "apiVersion": "v1",
        "metadata": {"name": "kuber-pv$testid", "labels": {"name": "kuber-pv$testid"}},
        "spec": {
            "capacity": {"storage": "16Mi"},
            "accessModes": ["ReadWriteOnce"],
            "persistentVolumeReclaimPolicy": "Retain",
            "storageClassName": "kuber-test-pv$testid",
            "hostPath": {"path": "/tmp/kuber-test-pv$testid"}
        }
    }""")

    persistentvolumeclaim = kuber_obj("""{
        "kind": "PersistentVolumeClaim",
        "apiVersion": "v1",
        "metadata": {"name": "kuber-pvc$testid", "namespace": "default"},
        "spec": {
            "accessModes": ["ReadWriteOnce"],
            "storageClassName": "kuber-test-pvc$testid",
            "resources": {"requests": {"storage": "16Mi"}}
        }
    }""")

    @testset "ReplicaSet" begin
        created = put!(ctx, replicaset)
        @test kuber_kind(created) == "ReplicaSet"
        @test Kuber._field(created.spec.replicas) == 0
        # status is written by the controller, so it is empty on the create
        # response and only complete on a later read. Generated field names are
        # the lowercased JSON names — `observedgeneration`, not
        # `observedGeneration` and not `observed_generation`.
        fetched = get_when(ctx, :ReplicaSet, "kuber-rs$testid") do rs
            s = status_of(rs)
            s !== nothing && Kuber._field(s.observedgeneration, 0) > 0
        end
        @test Kuber._field(fetched.status.replicas) == 0
        listed = list(ctx, :ReplicaSet)
        @test kuber_kind(listed) == "ReplicaSetList"
        @test any(i -> Kuber._field(i.metadata.name) == "kuber-rs$testid", listed.items)
        @test kuber_kind(delete!(ctx, :ReplicaSet, "kuber-rs$testid")) in ("ReplicaSet", "Status")
    end

    @testset "DaemonSet" begin
        created = put!(ctx, daemonset)
        @test kuber_kind(created) == "DaemonSet"
        # no node carries the selector, so the controller settles on wanting none
        fetched = get_when(ctx, :DaemonSet, "kuber-ds$testid") do ds
            s = status_of(ds)
            s !== nothing && Kuber._field(s.observedgeneration, 0) > 0
        end
        # Read this as a decode assertion rather than a claim about the
        # controller: desirednumberscheduled is a required field of
        # DaemonSetStatus, and 0 is both its initial value and the right answer
        # for a selector no node matches, so a read that landed before the
        # controller evaluated anything would pass just as well.
        @test Kuber._field(fetched.status.desirednumberscheduled) == 0
        # `get` with a label selector and no name is how JuliaRun reads
        # DaemonSets (api.jl:993) and RoleBindings (provisioning.jl:110): it
        # resolves to the list operation and answers with a List, which the
        # caller then guards with `hasproperty(x, :items)`.
        selected = get(ctx, :DaemonSet; label_selector = sel("name", :in, "kuber-ds$testid"))
        @test kuber_kind(selected) == "DaemonSetList"
        @test length(selected.items) == 1
        @test Kuber._field(selected.items[1].metadata.name) == "kuber-ds$testid"
        @test kuber_kind(delete!(ctx, :DaemonSet, "kuber-ds$testid")) in ("DaemonSet", "Status")
    end

    @testset "CronJob" begin
        created = put!(ctx, cronjob)
        @test kuber_kind(created) == "CronJob"
        @test Kuber._field(created.spec.schedule) == "0 0 31 2 *"
        @test Kuber._field(created.spec.suspend) === true
        fetched = get(ctx, :CronJob, "kuber-cj$testid")
        @test Kuber._field(fetched.spec.concurrencypolicy) == "Forbid"
        @test Kuber._field(fetched.spec.startingdeadlineseconds) == 60
        listed = list(ctx, :CronJob)
        @test kuber_kind(listed) == "CronJobList"
        @test any(i -> Kuber._field(i.metadata.name) == "kuber-cj$testid", listed.items)
        @test kuber_kind(delete!(ctx, :CronJob, "kuber-cj$testid")) in ("CronJob", "Status")
    end

    @testset "RoleBinding" begin
        created = put!(ctx, rolebinding)
        @test kuber_kind(created) == "RoleBinding"
        # rbac.authorization.k8s.io is its own group module, and nothing else in
        # the live suite submits to it: this pins that discovery resolved it
        @test isa(created, REGISTRY.KIND_TYPES[("rbac.authorization.k8s.io/v1", "RoleBinding")])
        @test Kuber._field(created.roleref.name) == "kuber-test-role$testid"
        @test Kuber._field(created.subjects[1].kind) == "ServiceAccount"
        selected = get(ctx, :RoleBinding; label_selector = sel("name", :in, "kuber-rb$testid"))
        @test kuber_kind(selected) == "RoleBindingList"
        @test length(selected.items) == 1
        @test kuber_kind(delete!(ctx, :RoleBinding, "kuber-rb$testid")) in ("RoleBinding", "Status")
    end

    @testset "NetworkPolicy" begin
        created = put!(ctx, networkpolicy)
        @test kuber_kind(created) == "NetworkPolicy"
        @test isa(created, REGISTRY.KIND_TYPES[("networking.k8s.io/v1", "NetworkPolicy")])
        # the `version` label JobLoops compares to decide whether to update
        # (networkpolicy.jl:114) is an open struct now, so it needs kuber_props
        @test Kuber.kuber_props(created.metadata.labels)["version"] == "1"
        fetched = get(ctx, :NetworkPolicy, "kuber-np$testid")
        @test Kuber._field(fetched.spec.policytypes) == ["Ingress"]
        @test Kuber.kuber_props(fetched.spec.podselector.matchlabels)["kuber-test-np"] == testid
        listed = list(ctx, :NetworkPolicy)
        @test kuber_kind(listed) == "NetworkPolicyList"
        @test kuber_kind(delete!(ctx, :NetworkPolicy, "kuber-np$testid")) in ("NetworkPolicy", "Status")
    end

    @testset "PersistentVolume and PersistentVolumeClaim" begin
        created = put!(ctx, persistentvolume)
        @test kuber_kind(created) == "PersistentVolume"
        # cluster-scoped, so this also covers the OPS :cluster fallback for a
        # kind that is not Namespace
        @test Kuber.kuber_props(created.spec.capacity)["storage"].value == "16Mi"
        pv = get_when(ctx, :PersistentVolume, "kuber-pv$testid") do v
            s = status_of(v)
            s !== nothing && Kuber._field(s.phase, "") == "Available"
        end
        @test Kuber._field(pv.spec.persistentvolumereclaimpolicy) == "Retain"

        claim = put!(ctx, persistentvolumeclaim)
        @test kuber_kind(claim) == "PersistentVolumeClaim"
        # it names a storage class nothing provides, so it stays Pending — which
        # is all this needs: the point is the schema, not the binding
        pvc = get_when(ctx, :PersistentVolumeClaim, "kuber-pvc$testid") do c
            s = status_of(c)
            s !== nothing && Kuber._field(s.phase, "") == "Pending"
        end
        @test Kuber.kuber_props(pvc.spec.resources.requests)["storage"].value == "16Mi"

        listed = list(ctx, :PersistentVolumeClaim)
        @test kuber_kind(listed) == "PersistentVolumeClaimList"
        @test kuber_kind(delete!(ctx, :PersistentVolumeClaim, "kuber-pvc$testid")) in
              ("PersistentVolumeClaim", "Status")
        @test kuber_kind(delete!(ctx, :PersistentVolume, "kuber-pv$testid")) in
              ("PersistentVolume", "Status")
    end

    nothing
end

"""
    labelled_pod(name, namespace, labels) -> model

A pod that exists to be selected, not to run.
"""
labelled_pod(name, namespace, labels) = kuber_obj("""{
    "kind": "Pod",
    "apiVersion": "v1",
    "metadata": {"name": "$name", "namespace": "$namespace", "labels": $(JSON.json(labels))},
    "spec": {"containers": [{"name": "busybox", "image": "busybox", "args": ["sleep", "3600"]}]}
}""")

"""
    watch_selector_all_namespaces(ctx, testid)

The shape `K8sReflector` actually watches with (G4): kind `:Pod`,
`namespace=nothing` — so scope resolution has to fall through `:cluster` to
`:allns` — and a `label_selector` built by Kuber's own `sel` helper, exactly as
`JobLoops/src/k8s_job_pod_monitoring.jl:66` builds it.

Both halves of the reflector's loop are covered: the initial `get` that fills its
store, and the watch that maintains it. The watch resumes from the list's
`resourceVersion`, which is what the reflector does and what removes the race
between establishing the watch and creating the object it should hear about.
"""
function watch_selector_all_namespaces(ctx, testid)
    ns = "kuber-g4$testid"
    marker = "g4-$testid"
    selector = sel("kuber-test", :in, marker)
    @test selector == "kuber-test in ($marker)"

    names = ["g4-here$testid", "g4-there$testid", "g4-other$testid", "g4-late$testid"]
    ensure_absent(ctx, :Pod, names[1]; namespace = "default")
    ensure_absent(ctx, :Namespace, ns)          # takes the rest with it
    put!(ctx, kuber_obj("""{"kind": "Namespace", "apiVersion": "v1",
                            "metadata": {"name": "$ns"}}"""))

    # One selected pod in each of two namespaces: a result carrying both is what
    # makes this an all-namespaces read rather than a lucky single-namespace one.
    # `namespace=` is not optional here — `put!` addresses the request with the
    # context's namespace and does not read `metadata.namespace` off the object,
    # so leaving it out is a 400 from the apiserver. `master` behaves the same
    # way, and does not even offer the keyword.
    put!(ctx, labelled_pod(names[1], "default", Dict("kuber-test" => marker)); namespace = "default")
    put!(ctx, labelled_pod(names[2], ns, Dict("kuber-test" => marker)); namespace = ns)

    res = get(ctx, :Pod; label_selector = selector, namespace = nothing)
    @test kuber_kind(res) == "PodList"
    found = Dict(Kuber._field(p.metadata.name) => Kuber._field(p.metadata.namespace) for p in res.items)
    @test Set(keys(found)) == Set(names[1:2])
    @test Set(values(found)) == Set(["default", ns])
    # the selector came back on the objects themselves
    @test all(Kuber.kuber_props(p.metadata.labels)["kuber-test"] == marker for p in res.items)

    rv = Kuber._resource_version(res)
    @test rv !== nothing

    events = Any[]
    lck = ReentrantLock()
    stream = Kuber.KuberEventStream(64)
    watcher = @async watch(ctx, :Pod, stream;
                           label_selector = selector, namespace = nothing, resource_version = rv)
    collector = @async for e in stream
        lock(lck) do
            push!(events, e)
        end
    end

    # created after the watch's resourceVersion, so both are events it must
    # decide about: the unselected one first, so seeing the selected one proves
    # the other was not merely late
    put!(ctx, labelled_pod(names[3], ns, Dict("kuber-test" => "someone-else")); namespace = ns)
    put!(ctx, labelled_pod(names[4], ns, Dict("kuber-test" => marker)); namespace = ns)

    sawlate() = lock(lck) do
        any(e -> e isa KuberEvent && Kuber._field(e.object.metadata.name) == names[4], events)
    end
    @test timedwait(sawlate, 60.0; pollint = 0.5) == :ok

    close(stream)
    @test timedwait(() -> istaskdone(watcher) && istaskdone(collector), 20.0) == :ok

    lock(lck) do
        @test !isempty(events)
        @test all(e -> e isa KuberEvent, events)          # no list frame: we resumed from rv
        seen = Set(Kuber._field(e.object.metadata.name) for e in events)
        @test names[4] in seen
        @test names[3] ∉ seen                             # the selector held on the stream
        @test all(Kuber.kuber_props(e.object.metadata.labels)["kuber-test"] == marker for e in events)
    end

    ensure_absent(ctx, :Pod, names[1]; namespace = "default")
    ensure_absent(ctx, :Namespace, ns)          # takes the pods inside it
end

"""
    test_metrics(ctx)

`metrics.k8s.io` is served by metrics-server, not the apiserver, so it is only
present on clusters that run it — k3s does by default, `kind` does not. Skipped
with a warning rather than failed when the group is absent: its presence says
nothing about whether the client is correct.

Everything here is a read, and each one is also a strict-validation check of a
document captured from a cluster rather than fetched from a release tag.
"""
function test_metrics(ctx)
    if !haskey(ctx.apis, :Metrics)
        @warn "SKIPPING the metrics tests: $SERVER does not serve metrics.k8s.io (no metrics-server)"
        return
    end
    @test ctx.apis[:Metrics][1] === REGISTRY.GROUP_MODULES["metrics.k8s.io/v1beta1"]
    @test ctx.modelapi[:NodeMetrics] === REGISTRY.GROUP_MODULES["metrics.k8s.io/v1beta1"]

    # NodeMetrics is cluster-scoped, so the default namespace has to fall back —
    # `get(ctx, :NodeMetrics)` is the idiom Metrics.md documents.
    nodes = get(ctx, :NodeMetrics)
    @test kuber_kind(nodes) == "NodeMetricsList"
    @test !isempty(nodes.items)
    node = nodes.items[1]
    name = Kuber._field(node.metadata.name)
    @test !isempty(name)
    # usage is a k8s string map of Quantity, so it is an open struct of wrappers
    usage = Kuber.kuber_props(node.usage)
    @test haskey(usage, "cpu") && haskey(usage, "memory")
    @test usage["cpu"].value isa String
    @test Kuber._field(node.window) !== nothing

    one = get(ctx, :NodeMetrics, name)
    @test kuber_kind(one) == "NodeMetrics"
    @test Kuber._field(one.metadata.name) == name

    # PodMetrics is namespaced, and also answers for all namespaces
    pods = list(ctx, :PodMetrics; namespace = "kube-system")
    @test kuber_kind(pods) == "PodMetricsList"
    if !isempty(pods.items)
        pod = pods.items[1]
        containers = Kuber._field(pod.containers, [])
        @test !isempty(containers)
        @test Kuber.kuber_props(containers[1].usage)["cpu"].value isa String
        podname = Kuber._field(pod.metadata.name)
        @test kuber_kind(get(ctx, :PodMetrics, podname; namespace = "kube-system")) == "PodMetrics"
    end
    @test kuber_kind(list(ctx, :PodMetrics; namespace = "*")) == "PodMetricsList"
end

function test_all()
    ctx = init_context()
    @testset "Kuber Tests" begin
        @testset "Server Preferred API Versions" begin
            test_versioned(ctx, "1")
        end

        @testset "Request Options" begin
            test_request_options(ctx)
        end

        @testset "Overridden API Versions" begin
            # apps and apiregistration.k8s.io each serve a single version now, so
            # the old apps=>v1beta2 / apiregistration=>v1beta1 overrides are not
            # expressible against a 1.35 server. autoscaling is: the server
            # prefers v2, and v1 is still served.
            @test ctx.apis[:Apiregistration][1] === REGISTRY.GROUP_MODULES["apiregistration.k8s.io/v1"]
            @test ctx.apis[:Apps][1] === REGISTRY.GROUP_MODULES["apps/v1"]
            @test ctx.apis[:Autoscaling][1] === REGISTRY.GROUP_MODULES["autoscaling/v2"]

            ctx2 = init_context(("autoscaling" => "v1",), false)
            @test ctx2.apis[:Autoscaling][1] === REGISTRY.GROUP_MODULES["autoscaling/v1"]
            @test ctx2.modelapi[:HorizontalPodAutoscaler] === REGISTRY.GROUP_MODULES["autoscaling/v1"]
            @test Kuber.kind_to_type(ctx2, :HorizontalPodAutoscaler) ===
                  REGISTRY.KIND_TYPES[("autoscaling/v1", "HorizontalPodAutoscaler")]

            test_versioned(ctx2, "2")
        end

        @testset "Metrics" begin
            test_metrics(ctx)
        end

        @testset "Misc" begin
            iob = IOBuffer()
            show(iob, ctx)
            str = String(take!(iob))
            @test str == "Kubernetes namespace default at $SERVER"
        end
    end
end

if server_reachable(SERVER)
    test_all()
else
    @warn """SKIPPING the live integration tests: no Kubernetes API server at $SERVER.
             Start one with `kubectl proxy --port=8001`, or point KUBER_TEST_SERVER elsewhere.
             The offline suites above still ran."""
end
