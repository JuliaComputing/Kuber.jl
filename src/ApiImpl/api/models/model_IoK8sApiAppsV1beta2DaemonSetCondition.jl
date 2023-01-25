# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.apps.v1beta2.DaemonSetCondition
DaemonSetCondition describes the state of a DaemonSet at a certain point.

    IoK8sApiAppsV1beta2DaemonSetCondition(;
        lastTransitionTime=nothing,
        message=nothing,
        reason=nothing,
        status=nothing,
        type=nothing,
    )

    - lastTransitionTime::ZonedDateTime : Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
    - message::String : A human readable message indicating details about the transition.
    - reason::String : The reason for the condition&#39;s last transition.
    - status::String : Status of the condition, one of True, False, Unknown.
    - type::String : Type of DaemonSet condition.
"""
Base.@kwdef mutable struct IoK8sApiAppsV1beta2DaemonSetCondition <: OpenAPI.APIModel
    lastTransitionTime::Union{Nothing, ZonedDateTime} = nothing
    message::Union{Nothing, String} = nothing
    reason::Union{Nothing, String} = nothing
    status::Union{Nothing, String} = nothing
    type::Union{Nothing, String} = nothing

    function IoK8sApiAppsV1beta2DaemonSetCondition(lastTransitionTime, message, reason, status, type, )
        OpenAPI.validate_property(IoK8sApiAppsV1beta2DaemonSetCondition, Symbol("lastTransitionTime"), lastTransitionTime)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2DaemonSetCondition, Symbol("message"), message)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2DaemonSetCondition, Symbol("reason"), reason)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2DaemonSetCondition, Symbol("status"), status)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2DaemonSetCondition, Symbol("type"), type)
        return new(lastTransitionTime, message, reason, status, type, )
    end
end # type IoK8sApiAppsV1beta2DaemonSetCondition

const _property_types_IoK8sApiAppsV1beta2DaemonSetCondition = Dict{Symbol,String}(Symbol("lastTransitionTime")=>"ZonedDateTime", Symbol("message")=>"String", Symbol("reason")=>"String", Symbol("status")=>"String", Symbol("type")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiAppsV1beta2DaemonSetCondition }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1beta2DaemonSetCondition[name]))}

function check_required(o::IoK8sApiAppsV1beta2DaemonSetCondition)
    o.status === nothing && (return false)
    o.type === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAppsV1beta2DaemonSetCondition }, name::Symbol, val)
    if name === Symbol("lastTransitionTime")
        OpenAPI.validate_param(name, "IoK8sApiAppsV1beta2DaemonSetCondition", :format, val, "date-time")
    end
end