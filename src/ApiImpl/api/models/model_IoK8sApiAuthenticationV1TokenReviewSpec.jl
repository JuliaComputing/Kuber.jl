# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.authentication.v1.TokenReviewSpec
TokenReviewSpec is a description of the token authentication request.

    IoK8sApiAuthenticationV1TokenReviewSpec(;
        audiences=nothing,
        token=nothing,
    )

    - audiences::Vector{String} : Audiences is a list of the identifiers that the resource server presented with the token identifies as. Audience-aware token authenticators will verify that the token was intended for at least one of the audiences in this list. If no audiences are provided, the audience will default to the audience of the Kubernetes apiserver.
    - token::String : Token is the opaque bearer token.
"""
Base.@kwdef mutable struct IoK8sApiAuthenticationV1TokenReviewSpec <: OpenAPI.APIModel
    audiences::Union{Nothing, Vector{String}} = nothing
    token::Union{Nothing, String} = nothing

    function IoK8sApiAuthenticationV1TokenReviewSpec(audiences, token, )
        OpenAPI.validate_property(IoK8sApiAuthenticationV1TokenReviewSpec, Symbol("audiences"), audiences)
        OpenAPI.validate_property(IoK8sApiAuthenticationV1TokenReviewSpec, Symbol("token"), token)
        return new(audiences, token, )
    end
end # type IoK8sApiAuthenticationV1TokenReviewSpec

const _property_types_IoK8sApiAuthenticationV1TokenReviewSpec = Dict{Symbol,String}(Symbol("audiences")=>"Vector{String}", Symbol("token")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiAuthenticationV1TokenReviewSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthenticationV1TokenReviewSpec[name]))}

function check_required(o::IoK8sApiAuthenticationV1TokenReviewSpec)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAuthenticationV1TokenReviewSpec }, name::Symbol, val)
end
