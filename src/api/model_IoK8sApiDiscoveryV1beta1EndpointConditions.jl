# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiDiscoveryV1beta1EndpointConditions <: SwaggerModel
    ready::Any # spec type: Union{ Nothing, Bool } # spec name: ready

    function IoK8sApiDiscoveryV1beta1EndpointConditions(;ready=nothing)
        o = new()
        validate_property(IoK8sApiDiscoveryV1beta1EndpointConditions, Symbol("ready"), ready)
        setfield!(o, Symbol("ready"), ready)
        o
    end
end # type IoK8sApiDiscoveryV1beta1EndpointConditions

const _property_map_IoK8sApiDiscoveryV1beta1EndpointConditions = Dict{Symbol,Symbol}(Symbol("ready")=>Symbol("ready"))
const _property_types_IoK8sApiDiscoveryV1beta1EndpointConditions = Dict{Symbol,String}(Symbol("ready")=>"Bool")
Base.propertynames(::Type{ IoK8sApiDiscoveryV1beta1EndpointConditions }) = collect(keys(_property_map_IoK8sApiDiscoveryV1beta1EndpointConditions))
Swagger.property_type(::Type{ IoK8sApiDiscoveryV1beta1EndpointConditions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiDiscoveryV1beta1EndpointConditions[name]))}
Swagger.field_name(::Type{ IoK8sApiDiscoveryV1beta1EndpointConditions }, property_name::Symbol) =  _property_map_IoK8sApiDiscoveryV1beta1EndpointConditions[property_name]

function check_required(o::IoK8sApiDiscoveryV1beta1EndpointConditions)
    true
end

function validate_property(::Type{ IoK8sApiDiscoveryV1beta1EndpointConditions }, name::Symbol, val)
end
