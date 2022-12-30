# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.ReplicationControllerCondition
ReplicationControllerCondition describes the state of a replication controller at a certain point.

    IoK8sApiCoreV1ReplicationControllerCondition(;
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
    - type::String : Type of replication controller condition.
"""
Base.@kwdef mutable struct IoK8sApiCoreV1ReplicationControllerCondition <: OpenAPI.APIModel
    lastTransitionTime::Union{Nothing, ZonedDateTime} = nothing
    message::Union{Nothing, String} = nothing
    reason::Union{Nothing, String} = nothing
    status::Union{Nothing, String} = nothing
    type::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1ReplicationControllerCondition(lastTransitionTime, message, reason, status, type, )
        OpenAPI.validate_property(IoK8sApiCoreV1ReplicationControllerCondition, Symbol("lastTransitionTime"), lastTransitionTime)
        OpenAPI.validate_property(IoK8sApiCoreV1ReplicationControllerCondition, Symbol("message"), message)
        OpenAPI.validate_property(IoK8sApiCoreV1ReplicationControllerCondition, Symbol("reason"), reason)
        OpenAPI.validate_property(IoK8sApiCoreV1ReplicationControllerCondition, Symbol("status"), status)
        OpenAPI.validate_property(IoK8sApiCoreV1ReplicationControllerCondition, Symbol("type"), type)
        return new(lastTransitionTime, message, reason, status, type, )
    end
end # type IoK8sApiCoreV1ReplicationControllerCondition

const _property_types_IoK8sApiCoreV1ReplicationControllerCondition = Dict{Symbol,String}(Symbol("lastTransitionTime")=>"ZonedDateTime", Symbol("message")=>"String", Symbol("reason")=>"String", Symbol("status")=>"String", Symbol("type")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1ReplicationControllerCondition }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1ReplicationControllerCondition[name]))}

function check_required(o::IoK8sApiCoreV1ReplicationControllerCondition)
    o.status === nothing && (return false)
    o.type === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1ReplicationControllerCondition }, name::Symbol, val)
    if name === Symbol("lastTransitionTime")
        OpenAPI.validate_param(name, "IoK8sApiCoreV1ReplicationControllerCondition", :format, val, "date-time")
    end
end
