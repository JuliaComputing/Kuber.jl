# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""NetworkPolicy describes what network traffic is allowed for a set of Pods

    IoK8sApiNetworkingV1NetworkPolicy(;
        apiVersion=nothing,
        kind=nothing,
        metadata=nothing,
        spec=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta : Standard object&#39;s metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    - spec::IoK8sApiNetworkingV1NetworkPolicySpec : Specification of the desired behavior for this NetworkPolicy.
"""
mutable struct IoK8sApiNetworkingV1NetworkPolicy <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    spec::Any # spec type: Union{ Nothing, IoK8sApiNetworkingV1NetworkPolicySpec } # spec name: spec

    function IoK8sApiNetworkingV1NetworkPolicy(;apiVersion=nothing, kind=nothing, metadata=nothing, spec=nothing)
        o = new()
        validate_property(IoK8sApiNetworkingV1NetworkPolicy, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiNetworkingV1NetworkPolicy, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiNetworkingV1NetworkPolicy, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiNetworkingV1NetworkPolicy, Symbol("spec"), spec)
        setfield!(o, Symbol("spec"), spec)
        o
    end
end # type IoK8sApiNetworkingV1NetworkPolicy

const _property_map_IoK8sApiNetworkingV1NetworkPolicy = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("spec")=>Symbol("spec"))
const _property_types_IoK8sApiNetworkingV1NetworkPolicy = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiNetworkingV1NetworkPolicySpec")
Base.propertynames(::Type{ IoK8sApiNetworkingV1NetworkPolicy }) = collect(keys(_property_map_IoK8sApiNetworkingV1NetworkPolicy))
Swagger.property_type(::Type{ IoK8sApiNetworkingV1NetworkPolicy }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiNetworkingV1NetworkPolicy[name]))}
Swagger.field_name(::Type{ IoK8sApiNetworkingV1NetworkPolicy }, property_name::Symbol) =  _property_map_IoK8sApiNetworkingV1NetworkPolicy[property_name]

function check_required(o::IoK8sApiNetworkingV1NetworkPolicy)
    true
end

function validate_property(::Type{ IoK8sApiNetworkingV1NetworkPolicy }, name::Symbol, val)
end
