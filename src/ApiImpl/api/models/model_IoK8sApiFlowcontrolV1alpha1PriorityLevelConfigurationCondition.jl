# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.flowcontrol.v1alpha1.PriorityLevelConfigurationCondition
PriorityLevelConfigurationCondition defines the condition of priority level.

    IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition(;
        lastTransitionTime=nothing,
        message=nothing,
        reason=nothing,
        status=nothing,
        type=nothing,
    )

    - lastTransitionTime::ZonedDateTime : Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
    - message::String : &#x60;message&#x60; is a human-readable message indicating details about last transition.
    - reason::String : &#x60;reason&#x60; is a unique, one-word, CamelCase reason for the condition&#39;s last transition.
    - status::String : &#x60;status&#x60; is the status of the condition. Can be True, False, Unknown. Required.
    - type::String : &#x60;type&#x60; is the type of the condition. Required.
"""
Base.@kwdef mutable struct IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition <: OpenAPI.APIModel
    lastTransitionTime::Union{Nothing, ZonedDateTime} = nothing
    message::Union{Nothing, String} = nothing
    reason::Union{Nothing, String} = nothing
    status::Union{Nothing, String} = nothing
    type::Union{Nothing, String} = nothing

    function IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition(lastTransitionTime, message, reason, status, type, )
        OpenAPI.validate_property(IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition, Symbol("lastTransitionTime"), lastTransitionTime)
        OpenAPI.validate_property(IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition, Symbol("message"), message)
        OpenAPI.validate_property(IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition, Symbol("reason"), reason)
        OpenAPI.validate_property(IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition, Symbol("status"), status)
        OpenAPI.validate_property(IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition, Symbol("type"), type)
        return new(lastTransitionTime, message, reason, status, type, )
    end
end # type IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition

const _property_types_IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition = Dict{Symbol,String}(Symbol("lastTransitionTime")=>"ZonedDateTime", Symbol("message")=>"String", Symbol("reason")=>"String", Symbol("status")=>"String", Symbol("type")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition[name]))}

function check_required(o::IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition }, name::Symbol, val)
    if name === Symbol("lastTransitionTime")
        OpenAPI.validate_param(name, "IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationCondition", :format, val, "date-time")
    end
end