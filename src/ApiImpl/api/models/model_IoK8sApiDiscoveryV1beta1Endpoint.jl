# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.discovery.v1beta1.Endpoint
Endpoint represents a single logical \&quot;backend\&quot; implementing a service.

    IoK8sApiDiscoveryV1beta1Endpoint(;
        addresses=nothing,
        conditions=nothing,
        hostname=nothing,
        targetRef=nothing,
        topology=nothing,
    )

    - addresses::Vector{String} : addresses of this endpoint. The contents of this field are interpreted according to the corresponding EndpointSlice addressType field. Consumers must handle different types of addresses in the context of their own capabilities. This must contain at least one address but no more than 100.
    - conditions::IoK8sApiDiscoveryV1beta1EndpointConditions
    - hostname::String : hostname of this endpoint. This field may be used by consumers of endpoints to distinguish endpoints from each other (e.g. in DNS names). Multiple endpoints which use the same hostname should be considered fungible (e.g. multiple A values in DNS). Must pass DNS Label (RFC 1123) validation.
    - targetRef::IoK8sApiCoreV1ObjectReference
    - topology::Dict{String, String} : topology contains arbitrary topology information associated with the endpoint. These key/value pairs must conform with the label format. https://kubernetes.io/docs/concepts/overview/working-with-objects/labels Topology may include a maximum of 16 key/value pairs. This includes, but is not limited to the following well known keys: * kubernetes.io/hostname: the value indicates the hostname of the node   where the endpoint is located. This should match the corresponding   node label. * topology.kubernetes.io/zone: the value indicates the zone where the   endpoint is located. This should match the corresponding node label. * topology.kubernetes.io/region: the value indicates the region where the   endpoint is located. This should match the corresponding node label.
"""
Base.@kwdef mutable struct IoK8sApiDiscoveryV1beta1Endpoint <: OpenAPI.APIModel
    addresses::Union{Nothing, Vector{String}} = nothing
    conditions = nothing # spec type: Union{ Nothing, IoK8sApiDiscoveryV1beta1EndpointConditions }
    hostname::Union{Nothing, String} = nothing
    targetRef = nothing # spec type: Union{ Nothing, IoK8sApiCoreV1ObjectReference }
    topology::Union{Nothing, Dict{String, String}} = nothing

    function IoK8sApiDiscoveryV1beta1Endpoint(addresses, conditions, hostname, targetRef, topology, )
        OpenAPI.validate_property(IoK8sApiDiscoveryV1beta1Endpoint, Symbol("addresses"), addresses)
        OpenAPI.validate_property(IoK8sApiDiscoveryV1beta1Endpoint, Symbol("conditions"), conditions)
        OpenAPI.validate_property(IoK8sApiDiscoveryV1beta1Endpoint, Symbol("hostname"), hostname)
        OpenAPI.validate_property(IoK8sApiDiscoveryV1beta1Endpoint, Symbol("targetRef"), targetRef)
        OpenAPI.validate_property(IoK8sApiDiscoveryV1beta1Endpoint, Symbol("topology"), topology)
        return new(addresses, conditions, hostname, targetRef, topology, )
    end
end # type IoK8sApiDiscoveryV1beta1Endpoint

const _property_types_IoK8sApiDiscoveryV1beta1Endpoint = Dict{Symbol,String}(Symbol("addresses")=>"Vector{String}", Symbol("conditions")=>"IoK8sApiDiscoveryV1beta1EndpointConditions", Symbol("hostname")=>"String", Symbol("targetRef")=>"IoK8sApiCoreV1ObjectReference", Symbol("topology")=>"Dict{String, String}", )
OpenAPI.property_type(::Type{ IoK8sApiDiscoveryV1beta1Endpoint }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiDiscoveryV1beta1Endpoint[name]))}

function check_required(o::IoK8sApiDiscoveryV1beta1Endpoint)
    o.addresses === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiDiscoveryV1beta1Endpoint }, name::Symbol, val)
end
