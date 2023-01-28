# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.ResourceQuotaList
ResourceQuotaList is a list of ResourceQuota items.

    IoK8sApiCoreV1ResourceQuotaList(;
        apiVersion=nothing,
        items=nothing,
        kind=nothing,
        metadata=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - items::Vector{IoK8sApiCoreV1ResourceQuota} : Items is a list of ResourceQuota objects. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ListMeta
"""
Base.@kwdef mutable struct IoK8sApiCoreV1ResourceQuotaList <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    items::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1ResourceQuota} }
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ListMeta }

    function IoK8sApiCoreV1ResourceQuotaList(apiVersion, items, kind, metadata, )
        OpenAPI.validate_property(IoK8sApiCoreV1ResourceQuotaList, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiCoreV1ResourceQuotaList, Symbol("items"), items)
        OpenAPI.validate_property(IoK8sApiCoreV1ResourceQuotaList, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiCoreV1ResourceQuotaList, Symbol("metadata"), metadata)
        return new(apiVersion, items, kind, metadata, )
    end
end # type IoK8sApiCoreV1ResourceQuotaList

const _property_types_IoK8sApiCoreV1ResourceQuotaList = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("items")=>"Vector{IoK8sApiCoreV1ResourceQuota}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ListMeta", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1ResourceQuotaList }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1ResourceQuotaList[name]))}

function check_required(o::IoK8sApiCoreV1ResourceQuotaList)
    o.items === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1ResourceQuotaList }, name::Symbol, val)
end
