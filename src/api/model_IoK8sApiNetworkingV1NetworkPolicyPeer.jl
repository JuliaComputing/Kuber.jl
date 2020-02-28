# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiNetworkingV1NetworkPolicyPeer <: SwaggerModel
    ipBlock::Any # spec type: Union{ Nothing, IoK8sApiNetworkingV1IPBlock } # spec name: ipBlock
    namespaceSelector::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector } # spec name: namespaceSelector
    podSelector::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector } # spec name: podSelector

    function IoK8sApiNetworkingV1NetworkPolicyPeer(;ipBlock=nothing, namespaceSelector=nothing, podSelector=nothing)
        o = new()
        validate_property(IoK8sApiNetworkingV1NetworkPolicyPeer, Symbol("ipBlock"), ipBlock)
        setfield!(o, Symbol("ipBlock"), ipBlock)
        validate_property(IoK8sApiNetworkingV1NetworkPolicyPeer, Symbol("namespaceSelector"), namespaceSelector)
        setfield!(o, Symbol("namespaceSelector"), namespaceSelector)
        validate_property(IoK8sApiNetworkingV1NetworkPolicyPeer, Symbol("podSelector"), podSelector)
        setfield!(o, Symbol("podSelector"), podSelector)
        o
    end
end # type IoK8sApiNetworkingV1NetworkPolicyPeer

const _property_map_IoK8sApiNetworkingV1NetworkPolicyPeer = Dict{Symbol,Symbol}(Symbol("ipBlock")=>Symbol("ipBlock"), Symbol("namespaceSelector")=>Symbol("namespaceSelector"), Symbol("podSelector")=>Symbol("podSelector"))
const _property_types_IoK8sApiNetworkingV1NetworkPolicyPeer = Dict{Symbol,String}(Symbol("ipBlock")=>"IoK8sApiNetworkingV1IPBlock", Symbol("namespaceSelector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("podSelector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector")
Base.propertynames(::Type{ IoK8sApiNetworkingV1NetworkPolicyPeer }) = collect(keys(_property_map_IoK8sApiNetworkingV1NetworkPolicyPeer))
Swagger.property_type(::Type{ IoK8sApiNetworkingV1NetworkPolicyPeer }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiNetworkingV1NetworkPolicyPeer[name]))}
Swagger.field_name(::Type{ IoK8sApiNetworkingV1NetworkPolicyPeer }, property_name::Symbol) =  _property_map_IoK8sApiNetworkingV1NetworkPolicyPeer[property_name]

function check_required(o::IoK8sApiNetworkingV1NetworkPolicyPeer)
    true
end

function validate_property(::Type{ IoK8sApiNetworkingV1NetworkPolicyPeer }, name::Symbol, val)
end
