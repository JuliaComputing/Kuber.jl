using Kuber
using Test

#On GCE:
#- Bring up a Kubernetes cluster: https://cloud.google.com/container-engine/docs/clusters/operations
#    - `gcloud container clusters create cluster1 --num-nodes=2 --zone=us-central1-a --machine-type=n1-standard-1 --image-type=container_vm`
#    - Note: set image-type to container_vm as the v1.4.0 Google container vm does not have glusterfs client. See: https://groups.google.com/forum/#!topic/kubernetes-users/USCSQ9TZThY
#- Enable access to the cluster:
#    - Get kubernetes credentials: `gcloud container clusters get-credentials cluster1 --zone us-central1-a`
#    - See credentials: `gcloud container clusters describe cluster-1 --zone us-central1-a`
# - Start kubectl in proxy mode
#    - run `kubectl proxy`

function init_context(override=nothing, verbose=true)
    ctx = KuberContext()
    set_server(ctx, "http://localhost:8001")
    set_ns(ctx, "default")
    Kuber.set_api_versions!(ctx; override=override, verbose=verbose)
    ctx
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

    nothing
end

function create_versioned_models(ctx)
    cron_batchv1beta1 = kuber_obj(ctx, """{
        "kind": "CronJob",
        "apiVersion": "batch/v1beta1",
        "metadata": {
            "name": "hello"
        },
        "spec": {
            "schedule": "*/1 * * * *",
            "jobTemplate": {
                "spec": {
                    "template": {
                        "spec": {
                            "containers": [{
                                "name": "hello",
                                "image": "busybox",
                                "args": ["/bin/sh", "-c", "date"]
                            }],
                            "restartPolicy": "OnFailure"
                        }
                    }
                }
            }
        }
    }""")
    @test isa(cron_batchv1beta1, Kuber.Kubernetes.IoK8sApiBatchV1beta1CronJob)

    cron_batchv2alpha1 = kuber_obj(ctx, """{
        "kind": "CronJob",
        "apiVersion": "batch/v2alpha1",
        "metadata": {
            "name": "hello"
        },
        "spec": {
            "schedule": "*/1 * * * *",
            "jobTemplate": {
                "spec": {
                    "template": {
                        "spec": {
                            "containers": [{
                                "name": "hello",
                                "image": "busybox",
                                "args": ["/bin/sh", "-c", "date"]
                            }],
                            "restartPolicy": "OnFailure"
                        }
                    }
                }
            }
        }
    }""")
    @test isa(cron_batchv2alpha1, Kuber.Kubernetes.IoK8sApiBatchV2alpha1CronJob)
end

function create_delete_job(ctx, testid)
    nginx_pod = kuber_obj(ctx, """{
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

    nginx_service = kuber_obj(ctx, """{
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

    nginx_rc = kuber_obj(ctx, """{
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

    nginx_rc_service = kuber_obj(ctx, """{
        "kind": "Service",
        "metadata": {
            "name": "nginx-rc-service$testid",
            "namespace": "default",
            "labels": {"name": "nginx-rc-service$testid"}
        },
        "spec": {
            "type": "LoadBalancer",
            "ports": [
                {"port": 80, "name": "http"}
            ],
            "selector": {"name": "nginx-pod$testid"}
        }
    }""")

    @testset "Kind to Type" begin
        @test isa(nginx_pod, Kuber.kind_to_type(ctx, "Pod"))
        @test isa(nginx_service, Kuber.kind_to_type(ctx, "Service"))
        @test isa(nginx_rc, Kuber.kind_to_type(ctx, "ReplicationController"))
        @test isa(nginx_rc_service, Kuber.kind_to_type(ctx, "Service"))
    end

    @testset "Create nginx pod" begin
        res = put!(ctx, nginx_pod)
        @test isa(res, Kuber.kind_to_type(ctx, :Pod))
    end

    @testset "Create nginx service" begin
        res = put!(ctx, nginx_service)
        @test isa(res, Kuber.kind_to_type(ctx, :Service))
    end

    @testset "Delete nginx service" begin
        res = delete!(ctx, :Service, "nginx-service$testid")
        @test isa(res, Kuber.kind_to_type(ctx, :Status))
    end

    @testset "Delete nginx pod" begin
        res = delete!(ctx, :Pod, "nginx-pod$testid")
        @test isa(res, Kuber.kind_to_type(ctx, :Pod))
    end

    nothing
end

function test_versioned(ctx, testid)
    @testset "List Objects" begin
        list_cluster_components(ctx)
        list_namespace_objects(ctx)
    end

    @testset "Versioned Models" begin
        create_versioned_models(ctx)
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
        timedwait(10.0; pollint=1.0) do
            lock(lck) do
                any(isa(event, Kuber.Typedefs.MetaV1.WatchEvent) && (event.type == "DELETED") for event in events)
            end
        end
        lock(lck) do
            @test !isempty(events)
            for event in events
                @test isa(event, Union{Kuber.Typedefs.MetaV1.WatchEvent,Kuber.Typedefs.CoreV1.PodList})
            end
        end
    end
end

function test_all()
    ctx = init_context()
    @testset "Kuber Tests" begin
        @testset "Server Preferred API Versions" begin
            test_versioned(ctx, "1")
        end

        @testset "Overridden API Versions" begin
            @test ctx.apis[:Apiregistration][1].api == Kuber.Kubernetes.ApiregistrationV1Api
            @test ctx.apis[:Apps][1].api == Kuber.Kubernetes.AppsV1Api

            ctx2 = init_context(("apiregistration.k8s.io"=>"v1beta1", "apps"=>"v1beta2"), false)
            @test ctx2.apis[:Apiregistration][1].api == Kuber.Kubernetes.ApiregistrationV1beta1Api
            @test ctx2.apis[:Apps][1].api == Kuber.Kubernetes.AppsV1beta2Api

            test_versioned(ctx2, "2")
        end
    end
end

#if !parse(Bool, get(ENV, "CI", "false"))
    test_all()
#end
