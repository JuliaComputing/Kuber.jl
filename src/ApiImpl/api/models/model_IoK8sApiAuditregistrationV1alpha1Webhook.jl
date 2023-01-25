# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.auditregistration.v1alpha1.Webhook
Webhook holds the configuration of the webhook

    IoK8sApiAuditregistrationV1alpha1Webhook(;
        clientConfig=nothing,
        throttle=nothing,
    )

    - clientConfig::IoK8sApiAuditregistrationV1alpha1WebhookClientConfig
    - throttle::IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig
"""
Base.@kwdef mutable struct IoK8sApiAuditregistrationV1alpha1Webhook <: OpenAPI.APIModel
    clientConfig = nothing # spec type: Union{ Nothing, IoK8sApiAuditregistrationV1alpha1WebhookClientConfig }
    throttle = nothing # spec type: Union{ Nothing, IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig }

    function IoK8sApiAuditregistrationV1alpha1Webhook(clientConfig, throttle, )
        OpenAPI.validate_property(IoK8sApiAuditregistrationV1alpha1Webhook, Symbol("clientConfig"), clientConfig)
        OpenAPI.validate_property(IoK8sApiAuditregistrationV1alpha1Webhook, Symbol("throttle"), throttle)
        return new(clientConfig, throttle, )
    end
end # type IoK8sApiAuditregistrationV1alpha1Webhook

const _property_types_IoK8sApiAuditregistrationV1alpha1Webhook = Dict{Symbol,String}(Symbol("clientConfig")=>"IoK8sApiAuditregistrationV1alpha1WebhookClientConfig", Symbol("throttle")=>"IoK8sApiAuditregistrationV1alpha1WebhookThrottleConfig", )
OpenAPI.property_type(::Type{ IoK8sApiAuditregistrationV1alpha1Webhook }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuditregistrationV1alpha1Webhook[name]))}

function check_required(o::IoK8sApiAuditregistrationV1alpha1Webhook)
    o.clientConfig === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAuditregistrationV1alpha1Webhook }, name::Symbol, val)
end