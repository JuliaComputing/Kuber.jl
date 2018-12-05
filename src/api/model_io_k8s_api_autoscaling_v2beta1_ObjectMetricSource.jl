# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.

mutable struct IoK8sApiAutoscalingV2beta1ObjectMetricSource <: SwaggerModel
    averageValue::Union{ Nothing, IoK8sApimachineryPkgApiResourceQuantity } # averageValue
    metricName::Union{ Nothing, String } # metricName
    selector::Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector } # selector
    target::Union{ Nothing, IoK8sApiAutoscalingV2beta1CrossVersionObjectReference } # target
    targetValue::Union{ Nothing, IoK8sApimachineryPkgApiResourceQuantity } # targetValue

    function IoK8sApiAutoscalingV2beta1ObjectMetricSource(;averageValue=nothing, metricName=nothing, selector=nothing, target=nothing, targetValue=nothing)
        o = new()
        set_field!(o, :averageValue, averageValue)
        set_field!(o, :metricName, metricName)
        set_field!(o, :selector, selector)
        set_field!(o, :target, target)
        set_field!(o, :targetValue, targetValue)
        o
    end
end # type IoK8sApiAutoscalingV2beta1ObjectMetricSource

const _name_map_IoK8sApiAutoscalingV2beta1ObjectMetricSource = Dict{String,Symbol}(["averageValue"=>:averageValue, "metricName"=>:metricName, "selector"=>:selector, "target"=>:target, "targetValue"=>:targetValue])
const _field_map_IoK8sApiAutoscalingV2beta1ObjectMetricSource = Dict{Symbol,String}([:averageValue=>"averageValue", :metricName=>"metricName", :selector=>"selector", :target=>"target", :targetValue=>"targetValue"])
Swagger.name_map(::Type{ IoK8sApiAutoscalingV2beta1ObjectMetricSource }) = _name_map_IoK8sApiAutoscalingV2beta1ObjectMetricSource
Swagger.field_map(::Type{ IoK8sApiAutoscalingV2beta1ObjectMetricSource }) = _field_map_IoK8sApiAutoscalingV2beta1ObjectMetricSource

function check_required(o::IoK8sApiAutoscalingV2beta1ObjectMetricSource)
    (o.metricName === nothing) && (return false)
    (o.target === nothing) && (return false)
    (o.targetValue === nothing) && (return false)
    true
end

function validate_field(o::IoK8sApiAutoscalingV2beta1ObjectMetricSource, name::Symbol, val)
end
