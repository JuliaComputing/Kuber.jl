The Julia package Kuber.jl makes Kubernetes clusters easy to use and plug in to from Julia code.

In this article, we shall launch a Kubernetes cluster on Azure and use it from Julia. Kuber.jl can also be used with Kubernetes clusters created by other mechanisms. In the command samples displayed in this article, those decorated with the `$` prefix indicate a command run in a shell, and those with the `julia>` prefix are run in the Julia REPL.

## Kubernetes Cluster using Azure AKS

[Azure Kubernetes Service (AKS)](https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes) makes it simple to deploy a managed Kubernetes cluster in Azure. AKS reduces the complexity and operational overhead of managing Kubernetes by offloading much of that responsibility to Azure. As a hosted Kubernetes service, Azure handles critical tasks like health monitoring and maintenance for you. We use the [Azure CLI utility](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest) from a unix shell to create the cluster.

Start by deciding on the cluster name and region to launch it in.

```
$ RESOURCE_GROUP=akstest
$ LOCATION=eastus
$ CLUSTERNAME="${RESOURCE_GROUP}cluster"
```

Create a Resource Group to hold our AKS instance
```
$ az group create --name $RESOURCE_GROUP --location $LOCATION
{
  "id": "/subscriptions/b509b56d-725d-4625-a5d3-ae68c72f15b9/resourceGroups/akstest",
  "location": "eastus",
  "managedBy": null,
  "name": "akstest",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null
}
```

Use the `az aks create` command to launch the cluster. We start only one node for this example, and use the defaults for most other options.
```
$ az aks create --resource-group $RESOURCE_GROUP --name $CLUSTERNAME --node-count 1 --enable-addons monitoring --generate-ssh-keys
{
  ...
  "location": "eastus",
  "name": "akstestcluster",
  "networkProfile": {
    "dnsServiceIp": "10.0.0.10",
    "dockerBridgeCidr": "172.17.0.1/16",
    "networkPlugin": "kubenet",
    "networkPolicy": null,
    "podCidr": "10.244.0.0/16",
    "serviceCidr": "10.0.0.0/16"
  },
  ...
}
```

To make it easy for us to connect to it from our local machine, fetch the cluster credentials and start a `kubectl proxy` process.
```
$ az aks install-cli
$ az aks get-credentials --resource-group $RESOURCE_GROUP --name $CLUSTERNAME
$ kubectl proxy
Starting to serve on 127.0.0.1:8001
```

## Connecting to the Kubernetes Cluster

We shall now try and explore the cluster using Kuber.jl. First, add the package and load it on to the Julia REPL.

```
julia> using Pkg

julia> Pkg.add("Kuber")

julia> using Kuber
```

A cluster connection is represented by a `KuberContext` instance. A context encapsulates the TCP connection to the cluster, and connection options. By default, Kuber.jl attempts to connect to a local port opened through `kubectl proxy`. If you followed all the steps in the previous section to start the Azure AKS cluster, you would have already done that.

```
julia> ctx = KuberContext()
Kubernetes namespace default at http://localhost:8001
```

Kubernets has multiple API sets and revisions thereof. We need to set the appropriate API versions to interact with our server. The `set_api_versions!` call detects the API versions supported and preferred by the server. They are stored in the context object to be used in subsequent communitcation.

```
julia> Kuber.set_api_versions!(ctx; verbose=true)
┌ Info: Core versions
│   supported = "v1"
└   preferred = "v1"
┌ Info: apiregistration.k8s.io (Apiregistration) versions
│   supported = "v1beta1"
└   preferred = "v1beta1"
┌ Info: extensions (Extensions) versions
│   supported = "v1beta1"
└   preferred = "v1beta1"
┌ Info: apps (Apps) versions
│   supported = "v1, v1beta2, v1beta1"
└   preferred = "v1"
┌ Info: events.k8s.io (Events) versions
│   supported = "v1beta1"
└   preferred = "v1beta1"
┌ Info: authentication.k8s.io (Authentication) versions
│   supported = "v1, v1beta1"
└   preferred = "v1"
┌ Info: authorization.k8s.io (Authorization) versions
│   supported = "v1, v1beta1"
└   preferred = "v1"
┌ Info: autoscaling (Autoscaling) versions
│   supported = "v1, v2beta1"
└   preferred = "v1"
┌ Info: batch (Batch) versions
│   supported = "v1, v1beta1"
└   preferred = "v1"
┌ Info: certificates.k8s.io (Certificates) versions
│   supported = "v1beta1"
└   preferred = "v1beta1"
┌ Info: networking.k8s.io (Networking) versions
│   supported = "v1"
└   preferred = "v1"
┌ Info: policy (Policy) versions
│   supported = "v1beta1"
└   preferred = "v1beta1"
┌ Info: rbac.authorization.k8s.io (RbacAuthorization) versions
│   supported = "v1, v1beta1"
└   preferred = "v1"
┌ Info: storage.k8s.io (Storage) versions
│   supported = "v1, v1beta1"
└   preferred = "v1"
┌ Info: admissionregistration.k8s.io (Admissionregistration) versions
│   supported = "v1beta1, v1alpha1"
└   preferred = "v1beta1"
┌ Info: apiextensions.k8s.io (Apiextensions) versions
│   supported = "v1beta1"
└   preferred = "v1beta1"
```

Things in the cluster are identified by entities. Kubernetes `Pod`, `Job`, `Service` are all examples of entities. APIs are verbs that act on those entities. There are only a handful of APIs we need to remember in Kuber.jl to interact with all of them:
- `get`: list or fetch entities
- `put!`: create entities
- `update!`: update existing entities
- `delete!`: delete existing entities

Now that we have set up our connection properly, let's explore what we have in our cluster. Kubernetes publishes the status of its components, and we can take a look at it to see if everything is fine. We can use Kuber.jl APIs for that. To do that we use the `get` API to fetch the `ComponentStatus` entity.

```
julia> result = get(ctx, :ComponentStatus);

julia> typeof(result)
Kuber.Kubernetes.IoK8sApiCoreV1ComponentStatusList
```

Note that we got back a Julia type `Kuber.Kubernetes.IoK8sApiCoreV1ComponentStatusList`. It represents a list of `ComponentStatus` entities that we asked for. It has been resolved to match the specific to the version of API we used - `CoreV1` in this case. We can display the entity in JSON form in the REPL, by simply `show`ing it.

```
julia> result
{
  "apiVersion": "v1",
  "items": [
    {
      "conditions": [
        {
          "message": "{\"health\": \"true\"}",
          "status": "True",
          "type": "Healthy"
        }
      ],
      "metadata": {
        "name": "etcd-0",
        "selfLink": "/api/v1/componentstatuses/etcd-0"
      }
    }
    ...
  ],
  "kind": "ComponentStatusList",
  "metadata": {
    "selfLink": "/api/v1/componentstatuses"
  }
}
```

Or we can access it like a regular Julia type and look at individual fields:
```
julia> for item in result.items
           println(item.metadata.name, " ", item.conditions[1]._type, " => ", item.conditions[1].status)
       end
controller-manager Healthy => False
scheduler Healthy => False
etcd-0 Healthy => True
```

Notice that APIs that fetch a list, have the entities in a field named `item`, and entities have thier name in the `metadata.name` field. We can list the namespaces available in the cluster, and now we can do it succintly as:

```
julia> collect(item.metadata.name for item in (get(ctx, :Namespace)).items)
3-element Array{String,1}:
 "default"    
 "kube-public"
 "kube-system"
```

And similarly a list of pods:

```
julia> collect(item.metadata.name for item in (get(ctx, :Pod)).items)
0-element Array{Any,1}
```

We do not have any pods in the default namespace yet, because we have not started any! But we must have some system pods running in the "kube-system" namespace. We can switch namespaces and look into the "kube-system" namespace:

```
julia> set_ns(ctx, "kube-system")

julia> collect(item.metadata.name for item in (get(ctx, :Pod)).items)
9-element Array{String,1}:
 "heapster-779db6bd48-pbclv"            
 "kube-dns-v20-b8ff799f7-fjtw9"         
 "kube-dns-v20-b8ff799f7-mhdkp"         
 "kube-proxy-fmzbz"                     
 "kube-svc-redirect-lkxzn"              
 "kubernetes-dashboard-7fbf669f58-7cf92"
 "omsagent-c6d7j"                       
 "omsagent-rs-7588f569b9-bs27t"         
 "tunnelfront-c66db54d9-hj2jm"          
```

There! Now let's get back to the default namespace and start something of our own. How about a nginx webserver that we can access over the internet? Kubernetes entities can be created from their JSON specification with the `kuber_obj` utility API provided with Kuber.jl.

```
julia> nginx_pod = kuber_obj(ctx, """{
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
                   "ports": [{"containerPort": 80}]
               }]
           }
       }""");

julia> typeof(nginx_pod)
Kuber.Kubernetes.IoK8sApiCoreV1Pod

julia> nginx_service = kuber_obj(ctx, """{
           "kind": "Service",
           "metadata": {
               "name": "nginx-service",
               "namespace": "default",
               "labels": {"name": "nginx-service"}
           },
           "spec": {
               "type": "LoadBalancer",
               "ports": [{"port": 80}],
               "selector": {"name": "nginx-pod"}
           }
       }""")

julia> typeof(nginx_service)
Kuber.Kubernetes.IoK8sApiCoreV1Service
```

To create the pod in the cluster, use the `put!` API. And we should see it when we list the pods.

```
julia> result = put!(ctx, nginx_pod);

julia> collect(item.metadata.name for item in get(ctx, :Pod).items)
1-element Array{String,1}:
 "nginx-pod"
```

We create the service, with an external LoadBalancer, to be able to access it from our browser:

```
julia> result = put!(ctx, nginx_service)
{
  "apiVersion": "v1",
  "kind": "Service",
  "metadata": {
    "creationTimestamp": "2018-12-07T06:24:26Z",
    "labels": {
      "name": "nginx-service"
    },
    "name": "nginx-service",
    "namespace": "default",
    "resourceVersion": "3172",
    "selfLink": "/api/v1/namespaces/default/services/nginx-service",
    "uid": "bf289d78-f9e8-11e8-abb2-cad68e0bf188"
  },
  "spec": {
    "clusterIP": "10.0.191.35",
    "externalTrafficPolicy": "Cluster",
    "ports": [
      {
        "nodePort": 32527,
        "port": 80,
        "protocol": "TCP",
        "targetPort": "80"
      }
    ],
    "selector": {
      "name": "nginx-pod"
    },
    "sessionAffinity": "None",
    "type": "LoadBalancer"
  },
  "status": {
    "loadBalancer": {}
  }
}
```

Note that the `loadBalancer` status field is empty. It takes a while to hook up a load balancer to our service. We need to wait for it to be able to access our webserver!

```
julia> while true
           println("waiting for loadbalancer to be configured...")
           sleep(30)
           status = get(ctx, :Service, "nginx-service").status
           if nothing !== status.loadBalancer.ingress && !isempty(status.loadBalancer.ingress)
               println(status.loadBalancer.ingress[1].ip)
               return
           end
       end
waiting for loadbalancer to be configured...
waiting for loadbalancer to be configured...
waiting for loadbalancer to be configured...
40.121.19.163
```

Our web server is up! And we can fetch a page from it.

```
shell> curl http://40.121.19.163/
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

## Cleaning up

Once we are done, we can delete the entities we created in the cluster with the `delete!` API.

```
julia> delete!(ctx, :Service, "nginx-service");
julia> delete!(ctx, :Pod, "nginx-pod");
```

To delete the Kubernetes cluster, we can delete the resource group itself, which would also terminate the cluster created under it.

```
$ az group delete --name $RESOURCE_GROUP --yes --no-wait
```
