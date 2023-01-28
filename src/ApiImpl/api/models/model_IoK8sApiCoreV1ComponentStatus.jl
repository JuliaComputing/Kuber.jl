# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.ComponentStatus
ComponentStatus (and ComponentStatusList) holds the cluster validation info.

    IoK8sApiCoreV1ComponentStatus(;
        apiVersion=nothing,
        conditions=nothing,
        kind=nothing,
        metadata=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - conditions::Vector{IoK8sApiCoreV1ComponentCondition} : List of component conditions observed
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta
"""
Base.@kwdef mutable struct IoK8sApiCoreV1ComponentStatus <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    conditions::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1ComponentCondition} }
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta }

    function IoK8sApiCoreV1ComponentStatus(apiVersion, conditions, kind, metadata, )
        OpenAPI.validate_property(IoK8sApiCoreV1ComponentStatus, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiCoreV1ComponentStatus, Symbol("conditions"), conditions)
        OpenAPI.validate_property(IoK8sApiCoreV1ComponentStatus, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiCoreV1ComponentStatus, Symbol("metadata"), metadata)
        return new(apiVersion, conditions, kind, metadata, )
    end
end # type IoK8sApiCoreV1ComponentStatus

const _property_types_IoK8sApiCoreV1ComponentStatus = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("conditions")=>"Vector{IoK8sApiCoreV1ComponentCondition}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1ComponentStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1ComponentStatus[name]))}

function check_required(o::IoK8sApiCoreV1ComponentStatus)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1ComponentStatus }, name::Symbol, val)
end
