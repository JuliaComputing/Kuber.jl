# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.authorization.v1.SubjectRulesReviewStatus
SubjectRulesReviewStatus contains the result of a rules check. This check can be incomplete depending on the set of authorizers the server is configured with and any errors experienced during evaluation. Because authorization rules are additive, if a rule appears in a list it&#39;s safe to assume the subject has that permission, even if that list is incomplete.

    IoK8sApiAuthorizationV1SubjectRulesReviewStatus(;
        evaluationError=nothing,
        incomplete=nothing,
        nonResourceRules=nothing,
        resourceRules=nothing,
    )

    - evaluationError::String : EvaluationError can appear in combination with Rules. It indicates an error occurred during rule evaluation, such as an authorizer that doesn&#39;t support rule evaluation, and that ResourceRules and/or NonResourceRules may be incomplete.
    - incomplete::Bool : Incomplete is true when the rules returned by this call are incomplete. This is most commonly encountered when an authorizer, such as an external authorizer, doesn&#39;t support rules evaluation.
    - nonResourceRules::Vector{IoK8sApiAuthorizationV1NonResourceRule} : NonResourceRules is the list of actions the subject is allowed to perform on non-resources. The list ordering isn&#39;t significant, may contain duplicates, and possibly be incomplete.
    - resourceRules::Vector{IoK8sApiAuthorizationV1ResourceRule} : ResourceRules is the list of actions the subject is allowed to perform on resources. The list ordering isn&#39;t significant, may contain duplicates, and possibly be incomplete.
"""
Base.@kwdef mutable struct IoK8sApiAuthorizationV1SubjectRulesReviewStatus <: OpenAPI.APIModel
    evaluationError::Union{Nothing, String} = nothing
    incomplete::Union{Nothing, Bool} = nothing
    nonResourceRules::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiAuthorizationV1NonResourceRule} }
    resourceRules::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiAuthorizationV1ResourceRule} }

    function IoK8sApiAuthorizationV1SubjectRulesReviewStatus(evaluationError, incomplete, nonResourceRules, resourceRules, )
        OpenAPI.validate_property(IoK8sApiAuthorizationV1SubjectRulesReviewStatus, Symbol("evaluationError"), evaluationError)
        OpenAPI.validate_property(IoK8sApiAuthorizationV1SubjectRulesReviewStatus, Symbol("incomplete"), incomplete)
        OpenAPI.validate_property(IoK8sApiAuthorizationV1SubjectRulesReviewStatus, Symbol("nonResourceRules"), nonResourceRules)
        OpenAPI.validate_property(IoK8sApiAuthorizationV1SubjectRulesReviewStatus, Symbol("resourceRules"), resourceRules)
        return new(evaluationError, incomplete, nonResourceRules, resourceRules, )
    end
end # type IoK8sApiAuthorizationV1SubjectRulesReviewStatus

const _property_types_IoK8sApiAuthorizationV1SubjectRulesReviewStatus = Dict{Symbol,String}(Symbol("evaluationError")=>"String", Symbol("incomplete")=>"Bool", Symbol("nonResourceRules")=>"Vector{IoK8sApiAuthorizationV1NonResourceRule}", Symbol("resourceRules")=>"Vector{IoK8sApiAuthorizationV1ResourceRule}", )
OpenAPI.property_type(::Type{ IoK8sApiAuthorizationV1SubjectRulesReviewStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthorizationV1SubjectRulesReviewStatus[name]))}

function check_required(o::IoK8sApiAuthorizationV1SubjectRulesReviewStatus)
    o.incomplete === nothing && (return false)
    o.nonResourceRules === nothing && (return false)
    o.resourceRules === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAuthorizationV1SubjectRulesReviewStatus }, name::Symbol, val)
end
