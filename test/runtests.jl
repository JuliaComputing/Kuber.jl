using Kuber
using Base.Test
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

ctx = KuberContext()
set_server(ctx, "http://localhost:8001")
set_ns(ctx, "default")
Kuber.set_api_versions!(ctx)

const nginx_pod = kuber_obj(ctx, """{
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
@test isa(nginx_pod, Kuber.kind_to_type(ctx, "Pod"))

const nginx_service = kuber_obj(ctx, """{
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
@test isa(nginx_service, Kuber.kind_to_type(ctx, "Service"))

const nginx_rc = kuber_obj(ctx, """{
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
@test isa(nginx_rc, Kuber.kind_to_type(ctx, "ReplicationController"))

const nginx_rc_service = kuber_obj(ctx, """{
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
@test isa(nginx_rc_service, Kuber.kind_to_type(ctx, "Service"))


println("List component status")
res = get(ctx, :ComponentStatus)
@test isa(res, Kuber.kind_to_type(ctx, :ComponentStatusList))

println("Status of single component")
res = get(ctx, :ComponentStatus, "scheduler")
@test isa(res, Kuber.kind_to_type(ctx, :ComponentStatus))

println("List all endpoints")
res = get(ctx, :Endpoints)
@test isa(res, Kuber.kind_to_type(ctx, :EndpointsList))

println("List all namespaces")
res = get(ctx, :Namespace)
@test isa(res, Kuber.kind_to_type(ctx, :NamespaceList))

println("List pods in default namespace")
res = get(ctx, :Pod)
@test isa(res, Kuber.kind_to_type(ctx, :PodList))

set_ns(ctx, "kube-system")
println("List pods in system namespace")
res = get(ctx, :Pod)
@test isa(res, Kuber.kind_to_type(ctx, :PodList))

println("List pods templates in system namespace")
res = get(ctx, :PodTemplate)
@test isa(res, Kuber.kind_to_type(ctx, :PodTemplateList))

set_ns(ctx, "default")
println("List pods templates in default namespace")
res = get(ctx, :PodTemplate)
@test isa(res, Kuber.kind_to_type(ctx, :PodTemplateList))

println("List replication controllers")
res = get(ctx, :ReplicationController)
@test isa(res, Kuber.kind_to_type(ctx, :ReplicationControllerList))

println("Create nginx pod")
res = put!(ctx, nginx_pod)
@test isa(res, Kuber.kind_to_type(ctx, :Pod))

println("Create nginx service")
res = put!(ctx, nginx_service)
@test isa(res, Kuber.kind_to_type(ctx, :Service))

println("Delete nginx service")
res = delete!(ctx, :Service, "nginx-service")
@test isa(res, Kuber.kind_to_type(ctx, :Status))

println("Delete nginx pod")
res = delete!(ctx, :Pod, "nginx-pod")
@test isa(res, Kuber.kind_to_type(ctx, :Pod))
