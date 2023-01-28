# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.authorization.v1beta1.SelfSubjectAccessReviewSpec
SelfSubjectAccessReviewSpec is a description of the access request.  Exactly one of ResourceAuthorizationAttributes and NonResourceAuthorizationAttributes must be set

    IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec(;
        nonResourceAttributes=nothing,
        resourceAttributes=nothing,
    )

    - nonResourceAttributes::IoK8sApiAuthorizationV1beta1NonResourceAttributes
    - resourceAttributes::IoK8sApiAuthorizationV1beta1ResourceAttributes
"""
Base.@kwdef mutable struct IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec <: OpenAPI.APIModel
    nonResourceAttributes = nothing # spec type: Union{ Nothing, IoK8sApiAuthorizationV1beta1NonResourceAttributes }
    resourceAttributes = nothing # spec type: Union{ Nothing, IoK8sApiAuthorizationV1beta1ResourceAttributes }

    function IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec(nonResourceAttributes, resourceAttributes, )
        OpenAPI.validate_property(IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec, Symbol("nonResourceAttributes"), nonResourceAttributes)
        OpenAPI.validate_property(IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec, Symbol("resourceAttributes"), resourceAttributes)
        return new(nonResourceAttributes, resourceAttributes, )
    end
end # type IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec

const _property_types_IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec = Dict{Symbol,String}(Symbol("nonResourceAttributes")=>"IoK8sApiAuthorizationV1beta1NonResourceAttributes", Symbol("resourceAttributes")=>"IoK8sApiAuthorizationV1beta1ResourceAttributes", )
OpenAPI.property_type(::Type{ IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec[name]))}

function check_required(o::IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec }, name::Symbol, val)
end
