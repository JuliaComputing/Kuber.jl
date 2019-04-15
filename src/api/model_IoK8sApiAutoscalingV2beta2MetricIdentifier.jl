# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiAutoscalingV2beta2MetricIdentifier <: SwaggerModel
    name::Any # spec type: Union{ Nothing, String } # spec name: name
    selector::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector } # spec name: selector

    function IoK8sApiAutoscalingV2beta2MetricIdentifier(;name=nothing, selector=nothing)
        o = new()
        validate_property(IoK8sApiAutoscalingV2beta2MetricIdentifier, Symbol("name"), name)
        setfield!(o, Symbol("name"), name)
        validate_property(IoK8sApiAutoscalingV2beta2MetricIdentifier, Symbol("selector"), selector)
        setfield!(o, Symbol("selector"), selector)
        o
    end
end # type IoK8sApiAutoscalingV2beta2MetricIdentifier

const _property_map_IoK8sApiAutoscalingV2beta2MetricIdentifier = Dict{Symbol,Symbol}(Symbol("name")=>Symbol("name"), Symbol("selector")=>Symbol("selector"))
const _property_types_IoK8sApiAutoscalingV2beta2MetricIdentifier = Dict{Symbol,String}(Symbol("name")=>"String", Symbol("selector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector")
Base.propertynames(::Type{ IoK8sApiAutoscalingV2beta2MetricIdentifier }) = collect(keys(_property_map_IoK8sApiAutoscalingV2beta2MetricIdentifier))
Swagger.property_type(::Type{ IoK8sApiAutoscalingV2beta2MetricIdentifier }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiAutoscalingV2beta2MetricIdentifier[name]))}
Swagger.field_name(::Type{ IoK8sApiAutoscalingV2beta2MetricIdentifier }, property_name::Symbol) =  _property_map_IoK8sApiAutoscalingV2beta2MetricIdentifier[property_name]

function check_required(o::IoK8sApiAutoscalingV2beta2MetricIdentifier)
    (getproperty(o, Symbol("name")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAutoscalingV2beta2MetricIdentifier }, name::Symbol, val)
end