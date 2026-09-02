using Kuber
using Test

# The offline suites (Phase 1/2/3 gates of OpenAPIv1TrialBranchPlan.md §6) need
# no cluster and run first, so a broken registry or a broken verb layer is
# reported before anything touches the network.
include("registry.jl")
include("register.jl")
include("helpers.jl")
include("simpleapi.jl")

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

        # delete by object, reading kind and name off the model
        res = delete!(ctx, patched)
        @test kuber_kind(res) in ("Deployment", "Status")

        res = delete!(ctx, :Job, "hello-job$testid")
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

function test_versioned(ctx, testid)
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
