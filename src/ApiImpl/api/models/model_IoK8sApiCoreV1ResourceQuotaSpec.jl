# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.ResourceQuotaSpec
ResourceQuotaSpec defines the desired hard limits to enforce for Quota.

    IoK8sApiCoreV1ResourceQuotaSpec(;
        hard=nothing,
        scopeSelector=nothing,
        scopes=nothing,
    )

    - hard::Dict{String, String} : hard is the set of desired hard limits for each named resource. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/
    - scopeSelector::IoK8sApiCoreV1ScopeSelector
    - scopes::Vector{String} : A collection of filters that must match each object tracked by a quota. If not specified, the quota matches all objects.
"""
Base.@kwdef mutable struct IoK8sApiCoreV1ResourceQuotaSpec <: OpenAPI.APIModel
    hard::Union{Nothing, Dict{String, String}} = nothing
    scopeSelector = nothing # spec type: Union{ Nothing, IoK8sApiCoreV1ScopeSelector }
    scopes::Union{Nothing, Vector{String}} = nothing

    function IoK8sApiCoreV1ResourceQuotaSpec(hard, scopeSelector, scopes, )
        OpenAPI.validate_property(IoK8sApiCoreV1ResourceQuotaSpec, Symbol("hard"), hard)
        OpenAPI.validate_property(IoK8sApiCoreV1ResourceQuotaSpec, Symbol("scopeSelector"), scopeSelector)
        OpenAPI.validate_property(IoK8sApiCoreV1ResourceQuotaSpec, Symbol("scopes"), scopes)
        return new(hard, scopeSelector, scopes, )
    end
end # type IoK8sApiCoreV1ResourceQuotaSpec

const _property_types_IoK8sApiCoreV1ResourceQuotaSpec = Dict{Symbol,String}(Symbol("hard")=>"Dict{String, String}", Symbol("scopeSelector")=>"IoK8sApiCoreV1ScopeSelector", Symbol("scopes")=>"Vector{String}", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1ResourceQuotaSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1ResourceQuotaSpec[name]))}

function check_required(o::IoK8sApiCoreV1ResourceQuotaSpec)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1ResourceQuotaSpec }, name::Symbol, val)
end