# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.extensions.v1beta1.ReplicaSetSpec
ReplicaSetSpec is the specification of a ReplicaSet.

    IoK8sApiExtensionsV1beta1ReplicaSetSpec(;
        minReadySeconds=nothing,
        replicas=nothing,
        selector=nothing,
        template=nothing,
    )

    - minReadySeconds::Int64 : Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
    - replicas::Int64 : Replicas is the number of desired replicas. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller
    - selector::IoK8sApimachineryPkgApisMetaV1LabelSelector
    - template::IoK8sApiCoreV1PodTemplateSpec
"""
Base.@kwdef mutable struct IoK8sApiExtensionsV1beta1ReplicaSetSpec <: OpenAPI.APIModel
    minReadySeconds::Union{Nothing, Int64} = nothing
    replicas::Union{Nothing, Int64} = nothing
    selector = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector }
    template = nothing # spec type: Union{ Nothing, IoK8sApiCoreV1PodTemplateSpec }

    function IoK8sApiExtensionsV1beta1ReplicaSetSpec(minReadySeconds, replicas, selector, template, )
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1ReplicaSetSpec, Symbol("minReadySeconds"), minReadySeconds)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1ReplicaSetSpec, Symbol("replicas"), replicas)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1ReplicaSetSpec, Symbol("selector"), selector)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1ReplicaSetSpec, Symbol("template"), template)
        return new(minReadySeconds, replicas, selector, template, )
    end
end # type IoK8sApiExtensionsV1beta1ReplicaSetSpec

const _property_types_IoK8sApiExtensionsV1beta1ReplicaSetSpec = Dict{Symbol,String}(Symbol("minReadySeconds")=>"Int64", Symbol("replicas")=>"Int64", Symbol("selector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("template")=>"IoK8sApiCoreV1PodTemplateSpec", )
OpenAPI.property_type(::Type{ IoK8sApiExtensionsV1beta1ReplicaSetSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1ReplicaSetSpec[name]))}

function check_required(o::IoK8sApiExtensionsV1beta1ReplicaSetSpec)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiExtensionsV1beta1ReplicaSetSpec }, name::Symbol, val)
    if name === Symbol("minReadySeconds")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1ReplicaSetSpec", :format, val, "int32")
    end
    if name === Symbol("replicas")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1ReplicaSetSpec", :format, val, "int32")
    end
end
