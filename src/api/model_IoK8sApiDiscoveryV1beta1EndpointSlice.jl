# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiDiscoveryV1beta1EndpointSlice <: SwaggerModel
    addressType::Any # spec type: Union{ Nothing, String } # spec name: addressType
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    endpoints::Any # spec type: Union{ Nothing, Vector{IoK8sApiDiscoveryV1beta1Endpoint} } # spec name: endpoints
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    ports::Any # spec type: Union{ Nothing, Vector{IoK8sApiDiscoveryV1beta1EndpointPort} } # spec name: ports

    function IoK8sApiDiscoveryV1beta1EndpointSlice(;addressType=nothing, apiVersion=nothing, endpoints=nothing, kind=nothing, metadata=nothing, ports=nothing)
        o = new()
        validate_property(IoK8sApiDiscoveryV1beta1EndpointSlice, Symbol("addressType"), addressType)
        setfield!(o, Symbol("addressType"), addressType)
        validate_property(IoK8sApiDiscoveryV1beta1EndpointSlice, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiDiscoveryV1beta1EndpointSlice, Symbol("endpoints"), endpoints)
        setfield!(o, Symbol("endpoints"), endpoints)
        validate_property(IoK8sApiDiscoveryV1beta1EndpointSlice, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiDiscoveryV1beta1EndpointSlice, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiDiscoveryV1beta1EndpointSlice, Symbol("ports"), ports)
        setfield!(o, Symbol("ports"), ports)
        o
    end
end # type IoK8sApiDiscoveryV1beta1EndpointSlice

const _property_map_IoK8sApiDiscoveryV1beta1EndpointSlice = Dict{Symbol,Symbol}(Symbol("addressType")=>Symbol("addressType"), Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("endpoints")=>Symbol("endpoints"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("ports")=>Symbol("ports"))
const _property_types_IoK8sApiDiscoveryV1beta1EndpointSlice = Dict{Symbol,String}(Symbol("addressType")=>"String", Symbol("apiVersion")=>"String", Symbol("endpoints")=>"Vector{IoK8sApiDiscoveryV1beta1Endpoint}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("ports")=>"Vector{IoK8sApiDiscoveryV1beta1EndpointPort}")
Base.propertynames(::Type{ IoK8sApiDiscoveryV1beta1EndpointSlice }) = collect(keys(_property_map_IoK8sApiDiscoveryV1beta1EndpointSlice))
Swagger.property_type(::Type{ IoK8sApiDiscoveryV1beta1EndpointSlice }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiDiscoveryV1beta1EndpointSlice[name]))}
Swagger.field_name(::Type{ IoK8sApiDiscoveryV1beta1EndpointSlice }, property_name::Symbol) =  _property_map_IoK8sApiDiscoveryV1beta1EndpointSlice[property_name]

function check_required(o::IoK8sApiDiscoveryV1beta1EndpointSlice)
    (getproperty(o, Symbol("addressType")) === nothing) && (return false)
    (getproperty(o, Symbol("endpoints")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiDiscoveryV1beta1EndpointSlice }, name::Symbol, val)
end
