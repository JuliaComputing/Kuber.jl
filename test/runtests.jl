using Kuber
using Test
using Swagger

#On GCE:
#- Bring up a Kubernetes cluster: https://cloud.google.com/container-engine/docs/clusters/operations
#    - `gcloud container clusters create cluster1 --num-nodes=2 --zone=us-central1-a --machine-type=n1-standard-1 --image-type=container_vm`
#    - Note: set image-type to container_vm as the v1.4.0 Google container vm does not have glusterfs client. See: https://groups.google.com/forum/#!topic/kubernetes-users/USCSQ9TZThY
#- Enable access to the cluster:
#    - Get kubernetes credentials: `gcloud container clusters get-credentials cluster1 --zone us-central1-a`
#    - See credentials: `gcloud container clusters describe cluster-1 --zone us-central1-a`
# - Start kubectl in proxy mode
#    - run `kubectl proxy`

function init_context()
    ctx = KuberContext()
    set_server(ctx, "http://localhost:8001")
    set_ns(ctx, "default")
    Kuber.set_api_versions!(ctx)
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

function create_delete_job(ctx)
    nginx_pod = kuber_obj(ctx, """{
        "kind": "Pod",
        "metadata":{
            "name": "nginx-pod",
            "namespace": "default",
            "labels": {
                "name": "nginx-pod"
            }
        },
        "spec": {
            "containers": [{
                "name": "nginx",
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
            "name": "nginx-service",
            "namespace": "default",
            "labels": {"name": "nginx-service"}
        },
        "spec": {
            "ports": [{"port": 80}],
            "selector": {"name": "nginx-pod"}
        }
    }""")

    nginx_rc = kuber_obj(ctx, """{
        "kind": "ReplicationController",
        "metadata": {
            "name": "nginx-rc",
            "labels": {
                "name": "nginx-rc"
            }
        },
        "spec": {
            "replicas": 3,
            "selector": {
                "name": "nginx-pod"
            },
            "template": {
                "metadata":{
                    "name": "nginx-pod",
                    "namespace": "default",
                    "labels": {
                        "name": "nginx-pod"
                    }
                },
                "spec": {
                    "containers": [{
                        "name": "nginx",
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
            "name": "nginx-rc-service",
            "namespace": "default",
            "labels": {"name": "nginx-rc-service"}
        },
        "spec": {
            "type": "LoadBalancer",
            "ports": [
                {"port": 80, "name": "http"}
            ],
            "selector": {"name": "nginx-pod"}
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
        res = delete!(ctx, :Service, "nginx-service")
        @test isa(res, Kuber.kind_to_type(ctx, :Status))
    end

    @testset "Delete nginx pod" begin
        res = delete!(ctx, :Pod, "nginx-pod")
        @test isa(res, Kuber.kind_to_type(ctx, :Pod))
    end

    nothing
end

function test_all()
    ctx = init_context()

    @testset "Kuber Tests" begin
        @testset "List Objects" begin
            list_cluster_components(ctx)
            list_namespace_objects(ctx)
        end

        @testset "Versioned Models" begin
            create_versioned_models(ctx)
        end

        @testset "Create/Delete Objects" begin
            create_delete_job(ctx)
        end
    end
end

test_all()
