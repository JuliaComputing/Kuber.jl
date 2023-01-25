# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.networking.v1.NetworkPolicy
NetworkPolicy describes what network traffic is allowed for a set of Pods

    IoK8sApiNetworkingV1NetworkPolicy(;
        apiVersion=nothing,
        kind=nothing,
        metadata=nothing,
        spec=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta
    - spec::IoK8sApiNetworkingV1NetworkPolicySpec
"""
Base.@kwdef mutable struct IoK8sApiNetworkingV1NetworkPolicy <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta }
    spec = nothing # spec type: Union{ Nothing, IoK8sApiNetworkingV1NetworkPolicySpec }

    function IoK8sApiNetworkingV1NetworkPolicy(apiVersion, kind, metadata, spec, )
        OpenAPI.validate_property(IoK8sApiNetworkingV1NetworkPolicy, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiNetworkingV1NetworkPolicy, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiNetworkingV1NetworkPolicy, Symbol("metadata"), metadata)
        OpenAPI.validate_property(IoK8sApiNetworkingV1NetworkPolicy, Symbol("spec"), spec)
        return new(apiVersion, kind, metadata, spec, )
    end
end # type IoK8sApiNetworkingV1NetworkPolicy

const _property_types_IoK8sApiNetworkingV1NetworkPolicy = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiNetworkingV1NetworkPolicySpec", )
OpenAPI.property_type(::Type{ IoK8sApiNetworkingV1NetworkPolicy }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiNetworkingV1NetworkPolicy[name]))}

function check_required(o::IoK8sApiNetworkingV1NetworkPolicy)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiNetworkingV1NetworkPolicy }, name::Symbol, val)
end