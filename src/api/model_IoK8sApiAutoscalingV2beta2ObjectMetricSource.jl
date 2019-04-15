# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiAutoscalingV2beta2ObjectMetricSource <: SwaggerModel
    describedObject::Any # spec type: Union{ Nothing, IoK8sApiAutoscalingV2beta2CrossVersionObjectReference } # spec name: describedObject
    metric::Any # spec type: Union{ Nothing, IoK8sApiAutoscalingV2beta2MetricIdentifier } # spec name: metric
    target::Any # spec type: Union{ Nothing, IoK8sApiAutoscalingV2beta2MetricTarget } # spec name: target

    function IoK8sApiAutoscalingV2beta2ObjectMetricSource(;describedObject=nothing, metric=nothing, target=nothing)
        o = new()
        validate_property(IoK8sApiAutoscalingV2beta2ObjectMetricSource, Symbol("describedObject"), describedObject)
        setfield!(o, Symbol("describedObject"), describedObject)
        validate_property(IoK8sApiAutoscalingV2beta2ObjectMetricSource, Symbol("metric"), metric)
        setfield!(o, Symbol("metric"), metric)
        validate_property(IoK8sApiAutoscalingV2beta2ObjectMetricSource, Symbol("target"), target)
        setfield!(o, Symbol("target"), target)
        o
    end
end # type IoK8sApiAutoscalingV2beta2ObjectMetricSource

const _property_map_IoK8sApiAutoscalingV2beta2ObjectMetricSource = Dict{Symbol,Symbol}(Symbol("describedObject")=>Symbol("describedObject"), Symbol("metric")=>Symbol("metric"), Symbol("target")=>Symbol("target"))
const _property_types_IoK8sApiAutoscalingV2beta2ObjectMetricSource = Dict{Symbol,String}(Symbol("describedObject")=>"IoK8sApiAutoscalingV2beta2CrossVersionObjectReference", Symbol("metric")=>"IoK8sApiAutoscalingV2beta2MetricIdentifier", Symbol("target")=>"IoK8sApiAutoscalingV2beta2MetricTarget")
Base.propertynames(::Type{ IoK8sApiAutoscalingV2beta2ObjectMetricSource }) = collect(keys(_property_map_IoK8sApiAutoscalingV2beta2ObjectMetricSource))
Swagger.property_type(::Type{ IoK8sApiAutoscalingV2beta2ObjectMetricSource }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiAutoscalingV2beta2ObjectMetricSource[name]))}
Swagger.field_name(::Type{ IoK8sApiAutoscalingV2beta2ObjectMetricSource }, property_name::Symbol) =  _property_map_IoK8sApiAutoscalingV2beta2ObjectMetricSource[property_name]

function check_required(o::IoK8sApiAutoscalingV2beta2ObjectMetricSource)
    (getproperty(o, Symbol("describedObject")) === nothing) && (return false)
    (getproperty(o, Symbol("metric")) === nothing) && (return false)
    (getproperty(o, Symbol("target")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAutoscalingV2beta2ObjectMetricSource }, name::Symbol, val)
end
