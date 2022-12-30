# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.apps.v1beta2.ReplicaSetList
ReplicaSetList is a collection of ReplicaSets.

    IoK8sApiAppsV1beta2ReplicaSetList(;
        apiVersion=nothing,
        items=nothing,
        kind=nothing,
        metadata=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - items::Vector{IoK8sApiAppsV1beta2ReplicaSet} : List of ReplicaSets. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ListMeta
"""
Base.@kwdef mutable struct IoK8sApiAppsV1beta2ReplicaSetList <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    items::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiAppsV1beta2ReplicaSet} }
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ListMeta }

    function IoK8sApiAppsV1beta2ReplicaSetList(apiVersion, items, kind, metadata, )
        OpenAPI.validate_property(IoK8sApiAppsV1beta2ReplicaSetList, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2ReplicaSetList, Symbol("items"), items)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2ReplicaSetList, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2ReplicaSetList, Symbol("metadata"), metadata)
        return new(apiVersion, items, kind, metadata, )
    end
end # type IoK8sApiAppsV1beta2ReplicaSetList

const _property_types_IoK8sApiAppsV1beta2ReplicaSetList = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("items")=>"Vector{IoK8sApiAppsV1beta2ReplicaSet}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ListMeta", )
OpenAPI.property_type(::Type{ IoK8sApiAppsV1beta2ReplicaSetList }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1beta2ReplicaSetList[name]))}

function check_required(o::IoK8sApiAppsV1beta2ReplicaSetList)
    o.items === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAppsV1beta2ReplicaSetList }, name::Symbol, val)
end
