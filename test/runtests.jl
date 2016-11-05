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

set_server("http://localhost:8001/")
set_ns("default")

const nginx_pod = K"""{
    "kind": "Pod",
    "apiVersion": "v1",
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
}"""

const nginx_service = K"""{
    "kind": "Service",
    "apiVersion": "v1",
    "metadata": {
        "name": "nginx-service",
        "namespace": "default",
        "labels": {"name": "nginx-service"}
    },
    "spec": {
        "ports": [{"port": 80}],
        "selector": {"name": "nginx-pod"}
    }
}"""

const nginx_rc = K"""{
    "kind": "ReplicationController",
    "apiVersion": "v1",
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
}"""

const nginx_rc_service = K"""{
    "kind": "Service",
    "apiVersion": "v1",
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
}"""


println("List component status")
get(ComponentStatus)

println("Status of single component")
get(ComponentStatus, "scheduler")

println("List all endpoints")
get(Endpoints)

println("List all namespaces")
get(Namespace)

println("List pods in default namespace")
get(Pod)

set_ns("kube-system")
println("List pods in system namespace")
get(Pod)

println("List pods templates in system namespace")
get(PodTemplate)
set_ns("default")

println("List pods templates in default namespace")
get(PodTemplate)

println("List replication controllers")
get(ReplicationController)

println("Create nginx pod")
put!(nginx_pod)

println("Create nginx service")
put!(nginx_service)

println("Delete nginx service")
delete!(Service, "nginx-service")

println("Delete nginx pod")
delete!(Pod, "nginx")
