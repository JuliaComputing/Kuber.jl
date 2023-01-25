# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.auditregistration.v1alpha1.WebhookThrottleConfig
WebhookThrottleConfig holds the configuration for throttling events

    IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig(;
        burst=nothing,
        qps=nothing,
    )

    - burst::Int64 : ThrottleBurst is the maximum number of events sent at the same moment default 15 QPS
    - qps::Int64 : ThrottleQPS maximum number of batches per second default 10 QPS
"""
Base.@kwdef mutable struct IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig <: OpenAPI.APIModel
    burst::Union{Nothing, Int64} = nothing
    qps::Union{Nothing, Int64} = nothing

    function IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig(burst, qps, )
        OpenAPI.validate_property(IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig, Symbol("burst"), burst)
        OpenAPI.validate_property(IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig, Symbol("qps"), qps)
        return new(burst, qps, )
    end
end # type IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig

const _property_types_IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig = Dict{Symbol,String}(Symbol("burst")=>"Int64", Symbol("qps")=>"Int64", )
OpenAPI.property_type(::Type{ IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig[name]))}

function check_required(o::IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig }, name::Symbol, val)
    if name === Symbol("burst")
        OpenAPI.validate_param(name, "IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig", :format, val, "int64")
    end
    if name === Symbol("qps")
        OpenAPI.validate_param(name, "IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig", :format, val, "int64")
    end
end