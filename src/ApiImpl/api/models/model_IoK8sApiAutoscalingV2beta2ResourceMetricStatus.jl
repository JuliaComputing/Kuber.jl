# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.autoscaling.v2beta2.ResourceMetricStatus
ResourceMetricStatus indicates the current value of a resource metric known to Kubernetes, as specified in requests and limits, describing each pod in the current scale target (e.g. CPU or memory).  Such metrics are built in to Kubernetes, and have special scaling options on top of those available to normal per-pod metrics using the \&quot;pods\&quot; source.

    IoK8sApiAutoscalingV2beta2ResourceMetricStatus(;
        current=nothing,
        name=nothing,
    )

    - current::IoK8sApiAutoscalingV2beta2MetricValueStatus
    - name::String : Name is the name of the resource in question.
"""
Base.@kwdef mutable struct IoK8sApiAutoscalingV2beta2ResourceMetricStatus <: OpenAPI.APIModel
    current = nothing # spec type: Union{ Nothing, IoK8sApiAutoscalingV2beta2MetricValueStatus }
    name::Union{Nothing, String} = nothing

    function IoK8sApiAutoscalingV2beta2ResourceMetricStatus(current, name, )
        OpenAPI.validate_property(IoK8sApiAutoscalingV2beta2ResourceMetricStatus, Symbol("current"), current)
        OpenAPI.validate_property(IoK8sApiAutoscalingV2beta2ResourceMetricStatus, Symbol("name"), name)
        return new(current, name, )
    end
end # type IoK8sApiAutoscalingV2beta2ResourceMetricStatus

const _property_types_IoK8sApiAutoscalingV2beta2ResourceMetricStatus = Dict{Symbol,String}(Symbol("current")=>"IoK8sApiAutoscalingV2beta2MetricValueStatus", Symbol("name")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiAutoscalingV2beta2ResourceMetricStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAutoscalingV2beta2ResourceMetricStatus[name]))}

function check_required(o::IoK8sApiAutoscalingV2beta2ResourceMetricStatus)
    o.current === nothing && (return false)
    o.name === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAutoscalingV2beta2ResourceMetricStatus }, name::Symbol, val)
end
