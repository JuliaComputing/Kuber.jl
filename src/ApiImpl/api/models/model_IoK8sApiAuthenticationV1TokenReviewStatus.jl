# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.authentication.v1.TokenReviewStatus
TokenReviewStatus is the result of the token authentication request.

    IoK8sApiAuthenticationV1TokenReviewStatus(;
        audiences=nothing,
        authenticated=nothing,
        error=nothing,
        user=nothing,
    )

    - audiences::Vector{String} : Audiences are audience identifiers chosen by the authenticator that are compatible with both the TokenReview and token. An identifier is any identifier in the intersection of the TokenReviewSpec audiences and the token&#39;s audiences. A client of the TokenReview API that sets the spec.audiences field should validate that a compatible audience identifier is returned in the status.audiences field to ensure that the TokenReview server is audience aware. If a TokenReview returns an empty status.audience field where status.authenticated is \&quot;true\&quot;, the token is valid against the audience of the Kubernetes API server.
    - authenticated::Bool : Authenticated indicates that the token was associated with a known user.
    - error::String : Error indicates that the token couldn&#39;t be checked
    - user::IoK8sApiAuthenticationV1UserInfo
"""
Base.@kwdef mutable struct IoK8sApiAuthenticationV1TokenReviewStatus <: OpenAPI.APIModel
    audiences::Union{Nothing, Vector{String}} = nothing
    authenticated::Union{Nothing, Bool} = nothing
    error::Union{Nothing, String} = nothing
    user = nothing # spec type: Union{ Nothing, IoK8sApiAuthenticationV1UserInfo }

    function IoK8sApiAuthenticationV1TokenReviewStatus(audiences, authenticated, error, user, )
        OpenAPI.validate_property(IoK8sApiAuthenticationV1TokenReviewStatus, Symbol("audiences"), audiences)
        OpenAPI.validate_property(IoK8sApiAuthenticationV1TokenReviewStatus, Symbol("authenticated"), authenticated)
        OpenAPI.validate_property(IoK8sApiAuthenticationV1TokenReviewStatus, Symbol("error"), error)
        OpenAPI.validate_property(IoK8sApiAuthenticationV1TokenReviewStatus, Symbol("user"), user)
        return new(audiences, authenticated, error, user, )
    end
end # type IoK8sApiAuthenticationV1TokenReviewStatus

const _property_types_IoK8sApiAuthenticationV1TokenReviewStatus = Dict{Symbol,String}(Symbol("audiences")=>"Vector{String}", Symbol("authenticated")=>"Bool", Symbol("error")=>"String", Symbol("user")=>"IoK8sApiAuthenticationV1UserInfo", )
OpenAPI.property_type(::Type{ IoK8sApiAuthenticationV1TokenReviewStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthenticationV1TokenReviewStatus[name]))}

function check_required(o::IoK8sApiAuthenticationV1TokenReviewStatus)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAuthenticationV1TokenReviewStatus }, name::Symbol, val)
end
