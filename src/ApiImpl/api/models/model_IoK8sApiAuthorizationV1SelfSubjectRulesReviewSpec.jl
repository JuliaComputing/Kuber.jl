# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.authorization.v1.SelfSubjectRulesReviewSpec

    IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec(;
        namespace=nothing,
    )

    - namespace::String : Namespace to evaluate rules for. Required.
"""
Base.@kwdef mutable struct IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec <: OpenAPI.APIModel
    namespace::Union{Nothing, String} = nothing

    function IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec(namespace, )
        OpenAPI.validate_property(IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec, Symbol("namespace"), namespace)
        return new(namespace, )
    end
end # type IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec

const _property_types_IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec = Dict{Symbol,String}(Symbol("namespace")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec[name]))}

function check_required(o::IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec }, name::Symbol, val)
end
