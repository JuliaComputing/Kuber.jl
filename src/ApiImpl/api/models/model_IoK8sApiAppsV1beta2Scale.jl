# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.apps.v1beta2.Scale
Scale represents a scaling request for a resource.

    IoK8sApiAppsV1beta2Scale(;
        apiVersion=nothing,
        kind=nothing,
        metadata=nothing,
        spec=nothing,
        status=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta
    - spec::IoK8sApiAppsV1beta2ScaleSpec
    - status::IoK8sApiAppsV1beta2ScaleStatus
"""
Base.@kwdef mutable struct IoK8sApiAppsV1beta2Scale <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta }
    spec = nothing # spec type: Union{ Nothing, IoK8sApiAppsV1beta2ScaleSpec }
    status = nothing # spec type: Union{ Nothing, IoK8sApiAppsV1beta2ScaleStatus }

    function IoK8sApiAppsV1beta2Scale(apiVersion, kind, metadata, spec, status, )
        OpenAPI.validate_property(IoK8sApiAppsV1beta2Scale, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2Scale, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2Scale, Symbol("metadata"), metadata)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2Scale, Symbol("spec"), spec)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2Scale, Symbol("status"), status)
        return new(apiVersion, kind, metadata, spec, status, )
    end
end # type IoK8sApiAppsV1beta2Scale

const _property_types_IoK8sApiAppsV1beta2Scale = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiAppsV1beta2ScaleSpec", Symbol("status")=>"IoK8sApiAppsV1beta2ScaleStatus", )
OpenAPI.property_type(::Type{ IoK8sApiAppsV1beta2Scale }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1beta2Scale[name]))}

function check_required(o::IoK8sApiAppsV1beta2Scale)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAppsV1beta2Scale }, name::Symbol, val)
end