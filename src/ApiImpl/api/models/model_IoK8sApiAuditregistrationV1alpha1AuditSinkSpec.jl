# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.auditregistration.v1alpha1.AuditSinkSpec
AuditSinkSpec holds the spec for the audit sink

    IoK8sApiAuditregistrationV1alpha1AuditSinkSpec(;
        policy=nothing,
        webhook=nothing,
    )

    - policy::IoK8sApiAuditregistrationV1alpha1Policy
    - webhook::IoK8sApiAuditregistrationV1alpha1Webhook
"""
Base.@kwdef mutable struct IoK8sApiAuditregistrationV1alpha1AuditSinkSpec <: OpenAPI.APIModel
    policy = nothing # spec type: Union{ Nothing, IoK8sApiAuditregistrationV1alpha1Policy }
    webhook = nothing # spec type: Union{ Nothing, IoK8sApiAuditregistrationV1alpha1Webhook }

    function IoK8sApiAuditregistrationV1alpha1AuditSinkSpec(policy, webhook, )
        OpenAPI.validate_property(IoK8sApiAuditregistrationV1alpha1AuditSinkSpec, Symbol("policy"), policy)
        OpenAPI.validate_property(IoK8sApiAuditregistrationV1alpha1AuditSinkSpec, Symbol("webhook"), webhook)
        return new(policy, webhook, )
    end
end # type IoK8sApiAuditregistrationV1alpha1AuditSinkSpec

const _property_types_IoK8sApiAuditregistrationV1alpha1AuditSinkSpec = Dict{Symbol,String}(Symbol("policy")=>"IoK8sApiAuditregistrationV1alpha1Policy", Symbol("webhook")=>"IoK8sApiAuditregistrationV1alpha1Webhook", )
OpenAPI.property_type(::Type{ IoK8sApiAuditregistrationV1alpha1AuditSinkSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuditregistrationV1alpha1AuditSinkSpec[name]))}

function check_required(o::IoK8sApiAuditregistrationV1alpha1AuditSinkSpec)
    o.policy === nothing && (return false)
    o.webhook === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAuditregistrationV1alpha1AuditSinkSpec }, name::Symbol, val)
end
