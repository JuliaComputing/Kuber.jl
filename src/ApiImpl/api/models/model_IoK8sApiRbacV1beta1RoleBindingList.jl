# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.rbac.v1beta1.RoleBindingList
RoleBindingList is a collection of RoleBindings Deprecated in v1.17 in favor of rbac.authorization.k8s.io/v1 RoleBindingList, and will no longer be served in v1.20.

    IoK8sApiRbacV1beta1RoleBindingList(;
        apiVersion=nothing,
        items=nothing,
        kind=nothing,
        metadata=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - items::Vector{IoK8sApiRbacV1beta1RoleBinding} : Items is a list of RoleBindings
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ListMeta
"""
Base.@kwdef mutable struct IoK8sApiRbacV1beta1RoleBindingList <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    items::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiRbacV1beta1RoleBinding} }
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ListMeta }

    function IoK8sApiRbacV1beta1RoleBindingList(apiVersion, items, kind, metadata, )
        OpenAPI.validate_property(IoK8sApiRbacV1beta1RoleBindingList, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiRbacV1beta1RoleBindingList, Symbol("items"), items)
        OpenAPI.validate_property(IoK8sApiRbacV1beta1RoleBindingList, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiRbacV1beta1RoleBindingList, Symbol("metadata"), metadata)
        return new(apiVersion, items, kind, metadata, )
    end
end # type IoK8sApiRbacV1beta1RoleBindingList

const _property_types_IoK8sApiRbacV1beta1RoleBindingList = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("items")=>"Vector{IoK8sApiRbacV1beta1RoleBinding}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ListMeta", )
OpenAPI.property_type(::Type{ IoK8sApiRbacV1beta1RoleBindingList }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiRbacV1beta1RoleBindingList[name]))}

function check_required(o::IoK8sApiRbacV1beta1RoleBindingList)
    o.items === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiRbacV1beta1RoleBindingList }, name::Symbol, val)
end
