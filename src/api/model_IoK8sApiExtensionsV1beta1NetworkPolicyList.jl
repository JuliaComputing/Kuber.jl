# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""DEPRECATED 1.9 - This group version of NetworkPolicyList is deprecated by networking/v1/NetworkPolicyList. Network Policy List is a list of NetworkPolicy objects.

    IoK8sApiExtensionsV1beta1NetworkPolicyList(;
        apiVersion=nothing,
        items=nothing,
        kind=nothing,
        metadata=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - items::Vector{IoK8sApiExtensionsV1beta1NetworkPolicy} : Items is a list of schema objects.
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ListMeta : Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
"""
mutable struct IoK8sApiExtensionsV1beta1NetworkPolicyList <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    items::Any # spec type: Union{ Nothing, Vector{IoK8sApiExtensionsV1beta1NetworkPolicy} } # spec name: items
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ListMeta } # spec name: metadata

    function IoK8sApiExtensionsV1beta1NetworkPolicyList(;apiVersion=nothing, items=nothing, kind=nothing, metadata=nothing)
        o = new()
        validate_property(IoK8sApiExtensionsV1beta1NetworkPolicyList, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiExtensionsV1beta1NetworkPolicyList, Symbol("items"), items)
        setfield!(o, Symbol("items"), items)
        validate_property(IoK8sApiExtensionsV1beta1NetworkPolicyList, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiExtensionsV1beta1NetworkPolicyList, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        o
    end
end # type IoK8sApiExtensionsV1beta1NetworkPolicyList

const _property_map_IoK8sApiExtensionsV1beta1NetworkPolicyList = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("items")=>Symbol("items"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"))
const _property_types_IoK8sApiExtensionsV1beta1NetworkPolicyList = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("items")=>"Vector{IoK8sApiExtensionsV1beta1NetworkPolicy}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ListMeta")
Base.propertynames(::Type{ IoK8sApiExtensionsV1beta1NetworkPolicyList }) = collect(keys(_property_map_IoK8sApiExtensionsV1beta1NetworkPolicyList))
Swagger.property_type(::Type{ IoK8sApiExtensionsV1beta1NetworkPolicyList }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1NetworkPolicyList[name]))}
Swagger.field_name(::Type{ IoK8sApiExtensionsV1beta1NetworkPolicyList }, property_name::Symbol) =  _property_map_IoK8sApiExtensionsV1beta1NetworkPolicyList[property_name]

function check_required(o::IoK8sApiExtensionsV1beta1NetworkPolicyList)
    (getproperty(o, Symbol("items")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiExtensionsV1beta1NetworkPolicyList }, name::Symbol, val)
end
