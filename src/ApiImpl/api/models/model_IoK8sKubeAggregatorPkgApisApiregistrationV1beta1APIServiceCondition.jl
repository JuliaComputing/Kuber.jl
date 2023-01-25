# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.kube-aggregator.pkg.apis.apiregistration.v1beta1.APIServiceCondition
APIServiceCondition describes the state of an APIService at a particular point

    IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition(;
        lastTransitionTime=nothing,
        message=nothing,
        reason=nothing,
        status=nothing,
        type=nothing,
    )

    - lastTransitionTime::ZonedDateTime : Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
    - message::String : Human-readable message indicating details about last transition.
    - reason::String : Unique, one-word, CamelCase reason for the condition&#39;s last transition.
    - status::String : Status is the status of the condition. Can be True, False, Unknown.
    - type::String : Type is the type of the condition.
"""
Base.@kwdef mutable struct IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition <: OpenAPI.APIModel
    lastTransitionTime::Union{Nothing, ZonedDateTime} = nothing
    message::Union{Nothing, String} = nothing
    reason::Union{Nothing, String} = nothing
    status::Union{Nothing, String} = nothing
    type::Union{Nothing, String} = nothing

    function IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition(lastTransitionTime, message, reason, status, type, )
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition, Symbol("lastTransitionTime"), lastTransitionTime)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition, Symbol("message"), message)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition, Symbol("reason"), reason)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition, Symbol("status"), status)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition, Symbol("type"), type)
        return new(lastTransitionTime, message, reason, status, type, )
    end
end # type IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition

const _property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition = Dict{Symbol,String}(Symbol("lastTransitionTime")=>"ZonedDateTime", Symbol("message")=>"String", Symbol("reason")=>"String", Symbol("status")=>"String", Symbol("type")=>"String", )
OpenAPI.property_type(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition[name]))}

function check_required(o::IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition)
    o.status === nothing && (return false)
    o.type === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition }, name::Symbol, val)
    if name === Symbol("lastTransitionTime")
        OpenAPI.validate_param(name, "IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition", :format, val, "date-time")
    end
end