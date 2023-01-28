# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.authorization.v1.NonResourceRule
NonResourceRule holds information that describes a rule for the non-resource

    IoK8sApiAuthorizationV1NonResourceRule(;
        nonResourceURLs=nothing,
        verbs=nothing,
    )

    - nonResourceURLs::Vector{String} : NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path.  \&quot;*\&quot; means all.
    - verbs::Vector{String} : Verb is a list of kubernetes non-resource API verbs, like: get, post, put, delete, patch, head, options.  \&quot;*\&quot; means all.
"""
Base.@kwdef mutable struct IoK8sApiAuthorizationV1NonResourceRule <: OpenAPI.APIModel
    nonResourceURLs::Union{Nothing, Vector{String}} = nothing
    verbs::Union{Nothing, Vector{String}} = nothing

    function IoK8sApiAuthorizationV1NonResourceRule(nonResourceURLs, verbs, )
        OpenAPI.validate_property(IoK8sApiAuthorizationV1NonResourceRule, Symbol("nonResourceURLs"), nonResourceURLs)
        OpenAPI.validate_property(IoK8sApiAuthorizationV1NonResourceRule, Symbol("verbs"), verbs)
        return new(nonResourceURLs, verbs, )
    end
end # type IoK8sApiAuthorizationV1NonResourceRule

const _property_types_IoK8sApiAuthorizationV1NonResourceRule = Dict{Symbol,String}(Symbol("nonResourceURLs")=>"Vector{String}", Symbol("verbs")=>"Vector{String}", )
OpenAPI.property_type(::Type{ IoK8sApiAuthorizationV1NonResourceRule }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthorizationV1NonResourceRule[name]))}

function check_required(o::IoK8sApiAuthorizationV1NonResourceRule)
    o.verbs === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAuthorizationV1NonResourceRule }, name::Symbol, val)
end
