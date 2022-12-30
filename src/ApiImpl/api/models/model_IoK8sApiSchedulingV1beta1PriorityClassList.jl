# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.scheduling.v1beta1.PriorityClassList
PriorityClassList is a collection of priority classes.

    IoK8sApiSchedulingV1beta1PriorityClassList(;
        apiVersion=nothing,
        items=nothing,
        kind=nothing,
        metadata=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - items::Vector{IoK8sApiSchedulingV1beta1PriorityClass} : items is the list of PriorityClasses
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ListMeta
"""
Base.@kwdef mutable struct IoK8sApiSchedulingV1beta1PriorityClassList <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    items::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiSchedulingV1beta1PriorityClass} }
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ListMeta }

    function IoK8sApiSchedulingV1beta1PriorityClassList(apiVersion, items, kind, metadata, )
        OpenAPI.validate_property(IoK8sApiSchedulingV1beta1PriorityClassList, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiSchedulingV1beta1PriorityClassList, Symbol("items"), items)
        OpenAPI.validate_property(IoK8sApiSchedulingV1beta1PriorityClassList, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiSchedulingV1beta1PriorityClassList, Symbol("metadata"), metadata)
        return new(apiVersion, items, kind, metadata, )
    end
end # type IoK8sApiSchedulingV1beta1PriorityClassList

const _property_types_IoK8sApiSchedulingV1beta1PriorityClassList = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("items")=>"Vector{IoK8sApiSchedulingV1beta1PriorityClass}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ListMeta", )
OpenAPI.property_type(::Type{ IoK8sApiSchedulingV1beta1PriorityClassList }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiSchedulingV1beta1PriorityClassList[name]))}

function check_required(o::IoK8sApiSchedulingV1beta1PriorityClassList)
    o.items === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiSchedulingV1beta1PriorityClassList }, name::Symbol, val)
end
