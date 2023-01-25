# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.Binding
Binding ties one object to another; for example, a pod is bound to a node by a scheduler. Deprecated in 1.7, please use the bindings subresource of pods instead.

    IoK8sApiCoreV1Binding(;
        apiVersion=nothing,
        kind=nothing,
        metadata=nothing,
        target=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta
    - target::IoK8sApiCoreV1ObjectReference
"""
Base.@kwdef mutable struct IoK8sApiCoreV1Binding <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta }
    target = nothing # spec type: Union{ Nothing, IoK8sApiCoreV1ObjectReference }

    function IoK8sApiCoreV1Binding(apiVersion, kind, metadata, target, )
        OpenAPI.validate_property(IoK8sApiCoreV1Binding, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiCoreV1Binding, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiCoreV1Binding, Symbol("metadata"), metadata)
        OpenAPI.validate_property(IoK8sApiCoreV1Binding, Symbol("target"), target)
        return new(apiVersion, kind, metadata, target, )
    end
end # type IoK8sApiCoreV1Binding

const _property_types_IoK8sApiCoreV1Binding = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("target")=>"IoK8sApiCoreV1ObjectReference", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1Binding }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1Binding[name]))}

function check_required(o::IoK8sApiCoreV1Binding)
    o.target === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1Binding }, name::Symbol, val)
end