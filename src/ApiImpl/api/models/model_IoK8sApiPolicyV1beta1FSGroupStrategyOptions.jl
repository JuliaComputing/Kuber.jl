# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.policy.v1beta1.FSGroupStrategyOptions
FSGroupStrategyOptions defines the strategy type and options used to create the strategy.

    IoK8sApiPolicyV1beta1FSGroupStrategyOptions(;
        ranges=nothing,
        rule=nothing,
    )

    - ranges::Vector{IoK8sApiPolicyV1beta1IDRange} : ranges are the allowed ranges of fs groups.  If you would like to force a single fs group then supply a single range with the same start and end. Required for MustRunAs.
    - rule::String : rule is the strategy that will dictate what FSGroup is used in the SecurityContext.
"""
Base.@kwdef mutable struct IoK8sApiPolicyV1beta1FSGroupStrategyOptions <: OpenAPI.APIModel
    ranges::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiPolicyV1beta1IDRange} }
    rule::Union{Nothing, String} = nothing

    function IoK8sApiPolicyV1beta1FSGroupStrategyOptions(ranges, rule, )
        OpenAPI.validate_property(IoK8sApiPolicyV1beta1FSGroupStrategyOptions, Symbol("ranges"), ranges)
        OpenAPI.validate_property(IoK8sApiPolicyV1beta1FSGroupStrategyOptions, Symbol("rule"), rule)
        return new(ranges, rule, )
    end
end # type IoK8sApiPolicyV1beta1FSGroupStrategyOptions

const _property_types_IoK8sApiPolicyV1beta1FSGroupStrategyOptions = Dict{Symbol,String}(Symbol("ranges")=>"Vector{IoK8sApiPolicyV1beta1IDRange}", Symbol("rule")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiPolicyV1beta1FSGroupStrategyOptions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiPolicyV1beta1FSGroupStrategyOptions[name]))}

function check_required(o::IoK8sApiPolicyV1beta1FSGroupStrategyOptions)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiPolicyV1beta1FSGroupStrategyOptions }, name::Symbol, val)
end