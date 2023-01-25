# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.networking.v1.NetworkPolicyPeer
NetworkPolicyPeer describes a peer to allow traffic from. Only certain combinations of fields are allowed

    IoK8sApiNetworkingV1NetworkPolicyPeer(;
        ipBlock=nothing,
        namespaceSelector=nothing,
        podSelector=nothing,
    )

    - ipBlock::IoK8sApiNetworkingV1IPBlock
    - namespaceSelector::IoK8sApimachineryPkgApisMetaV1LabelSelector
    - podSelector::IoK8sApimachineryPkgApisMetaV1LabelSelector
"""
Base.@kwdef mutable struct IoK8sApiNetworkingV1NetworkPolicyPeer <: OpenAPI.APIModel
    ipBlock = nothing # spec type: Union{ Nothing, IoK8sApiNetworkingV1IPBlock }
    namespaceSelector = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector }
    podSelector = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector }

    function IoK8sApiNetworkingV1NetworkPolicyPeer(ipBlock, namespaceSelector, podSelector, )
        OpenAPI.validate_property(IoK8sApiNetworkingV1NetworkPolicyPeer, Symbol("ipBlock"), ipBlock)
        OpenAPI.validate_property(IoK8sApiNetworkingV1NetworkPolicyPeer, Symbol("namespaceSelector"), namespaceSelector)
        OpenAPI.validate_property(IoK8sApiNetworkingV1NetworkPolicyPeer, Symbol("podSelector"), podSelector)
        return new(ipBlock, namespaceSelector, podSelector, )
    end
end # type IoK8sApiNetworkingV1NetworkPolicyPeer

const _property_types_IoK8sApiNetworkingV1NetworkPolicyPeer = Dict{Symbol,String}(Symbol("ipBlock")=>"IoK8sApiNetworkingV1IPBlock", Symbol("namespaceSelector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("podSelector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", )
OpenAPI.property_type(::Type{ IoK8sApiNetworkingV1NetworkPolicyPeer }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiNetworkingV1NetworkPolicyPeer[name]))}

function check_required(o::IoK8sApiNetworkingV1NetworkPolicyPeer)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiNetworkingV1NetworkPolicyPeer }, name::Symbol, val)
end