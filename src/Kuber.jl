module Kuber

include("api/Kubernetes.jl")
using .Kubernetes
using JSON
using Swagger

import Base: convert
import Swagger: SwaggerModel

convert{T<:SwaggerModel}(T, json::String) = convert(T, JSON.parse(json))

function list_status_component(api)
    res = listCoreV1ComponentStatus(api)
    isset_field(res, "items") || return
    for item in get_field(res, "items")
        println(get_field(get_field(item, "metadata"), "name"), ": ", get_field(get_field(item, "conditions")[1], "type"))
    end
end

function status_component(api, compname)
    item = readCoreV1ComponentStatus(api, compname)
    println(get_field(get_field(item, "metadata"), "name"), ": ", get_field(get_field(item, "conditions")[1], "type"))
end

function list_endpoints(api)
    res = listCoreV1EndpointsForAllNamespaces(api)
    isset_field(res, "items") || return
    for item in get_field(res, "items")
        metadata = get_field(item, "metadata")
        name = get_field(metadata, "namespace") * "/" * get_field(metadata, "name")
        addresses = ""
        ports = ""
        subsets = get_field(item, "subsets")
        for subset in subsets
            for addr in get_field(subset, "addresses")
                addresses = addresses * " " * get_field(addr, "ip")
            end
            for port in get_field(subset, "ports")
                ports = ports * " " * string(get_field(port, "port"))
            end
        end
        println(name, " addresses(", addresses, ") ports(", ports, ")")
    end
end

function list_namespaces(api)
    res = listCoreV1Namespace(api)
    isset_field(res, "items") || return
    for item in get_field(res, "items")
        metadata = get_field(item, "metadata")
        name = get_field(metadata, "name")
        println(name)
    end
end

function list_pods(api; namespace="default")
    res = listCoreV1NamespacedPod(api, namespace)
    isset_field(res, "items") || return
    for item in get_field(res, "items")
        metadata = get_field(item, "metadata")
        name = get_field(metadata, "namespace") * "/" * get_field(metadata, "name")
        println(name)
    end
end

function list_pod_templates(api; namespace="default")
    res = listCoreV1NamespacedPodTemplate(api, namespace)
    #isset_field(res, "items") || return
    #for item in get_field(res, "items")
    #    metadata = get_field(item, "metadata")
    #    name = get_field(metadata, "namespace") * "/" * get_field(metadata, "name")
    #    println(io, name)
    #end
end

function list_rcs(api; namespace="default")
    api = listCoreV1NamespacedReplicationController(api, namespace)
end

function list_services(api; namespace="default")
    res = listCoreV1NamespacedService(api, namespace)
end

function create_namespace(api, namespace)
    obj = convert(V1Namespace, namespace)
    res = createCoreV1Namespace(api, obj)
end

function create_pod(api, pod; namespace="default")
    obj = convert(V1Pod, pod)
    res = createCoreV1NamespacedPod(api, namespace, obj)
end

function create_pod_template(api, template; namespace="default")
    obj = convert(V1PodTemplate, template)
    res = createCoreV1NamespacedPodTemplate(api, namespace, obj)
end

function create_rc(api, rc; namespace="default")
    obj = convert(V1ReplicationController, rc)
    res = createCoreV1NamespacedReplicationController(api, namespace, obj)
end

function create_service(api, service; namespace="default")
    obj = convert(V1Service, rc)
    res = createCoreV1NamespacedService(api, namespace, obj)
end

function delete_namespace(api, namespace, options="{}")
    opts = convert(V1DeleteOptions, options)
    res = deleteCoreV1Namespace(api, namespace, opts)
end

function delete_pod(api, pod; namespace="default", options="{}")
    opts = convert(V1DeleteOptions, options)
    res = deleteCoreV1NamespacedPod(api, pod, namespace, opts)
end

function delete_pod_template(api, template; namespace="default", options="{}")
    opts = convert(V1DeleteOptions, options)
    res = deleteCoreV1NamespacedPodTemplate(api, template, namespace, opts)
end

function delete_rc(api, rc; namespace="default", options="{}")
    opts = convert(V1DeleteOptions, options)
    res = deleteCoreV1NamespacedReplicationController(api, rc, namespace, opts)
end

function delete_service(api, service; namespace="default", options="{}")
    opts = convert(V1DeleteOptions, options)
    res = deleteCoreV1NamespacedService(api, service, namespace, opts)
end

end # module
