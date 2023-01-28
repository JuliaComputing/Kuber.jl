# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.autoscaling.v2beta2.MetricIdentifier
MetricIdentifier defines the name and optionally selector for a metric

    IoK8sApiAutoscalingV2beta2MetricIdentifier(;
        name=nothing,
        selector=nothing,
    )

    - name::String : name is the name of the given metric
    - selector::IoK8sApimachineryPkgApisMetaV1LabelSelector
"""
Base.@kwdef mutable struct IoK8sApiAutoscalingV2beta2MetricIdentifier <: OpenAPI.APIModel
    name::Union{Nothing, String} = nothing
    selector = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector }

    function IoK8sApiAutoscalingV2beta2MetricIdentifier(name, selector, )
        OpenAPI.validate_property(IoK8sApiAutoscalingV2beta2MetricIdentifier, Symbol("name"), name)
        OpenAPI.validate_property(IoK8sApiAutoscalingV2beta2MetricIdentifier, Symbol("selector"), selector)
        return new(name, selector, )
    end
end # type IoK8sApiAutoscalingV2beta2MetricIdentifier

const _property_types_IoK8sApiAutoscalingV2beta2MetricIdentifier = Dict{Symbol,String}(Symbol("name")=>"String", Symbol("selector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", )
OpenAPI.property_type(::Type{ IoK8sApiAutoscalingV2beta2MetricIdentifier }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAutoscalingV2beta2MetricIdentifier[name]))}

function check_required(o::IoK8sApiAutoscalingV2beta2MetricIdentifier)
    o.name === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAutoscalingV2beta2MetricIdentifier }, name::Symbol, val)
end
