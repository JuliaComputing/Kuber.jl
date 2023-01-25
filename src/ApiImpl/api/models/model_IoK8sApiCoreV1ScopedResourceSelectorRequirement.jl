# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.ScopedResourceSelectorRequirement
A scoped-resource selector requirement is a selector that contains values, a scope name, and an operator that relates the scope name and values.

    IoK8sApiCoreV1ScopedResourceSelectorRequirement(;
        operator=nothing,
        scopeName=nothing,
        values=nothing,
    )

    - operator::String : Represents a scope&#39;s relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist.
    - scopeName::String : The name of the scope that the selector applies to.
    - values::Vector{String} : An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.
"""
Base.@kwdef mutable struct IoK8sApiCoreV1ScopedResourceSelectorRequirement <: OpenAPI.APIModel
    operator::Union{Nothing, String} = nothing
    scopeName::Union{Nothing, String} = nothing
    values::Union{Nothing, Vector{String}} = nothing

    function IoK8sApiCoreV1ScopedResourceSelectorRequirement(operator, scopeName, values, )
        OpenAPI.validate_property(IoK8sApiCoreV1ScopedResourceSelectorRequirement, Symbol("operator"), operator)
        OpenAPI.validate_property(IoK8sApiCoreV1ScopedResourceSelectorRequirement, Symbol("scopeName"), scopeName)
        OpenAPI.validate_property(IoK8sApiCoreV1ScopedResourceSelectorRequirement, Symbol("values"), values)
        return new(operator, scopeName, values, )
    end
end # type IoK8sApiCoreV1ScopedResourceSelectorRequirement

const _property_types_IoK8sApiCoreV1ScopedResourceSelectorRequirement = Dict{Symbol,String}(Symbol("operator")=>"String", Symbol("scopeName")=>"String", Symbol("values")=>"Vector{String}", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1ScopedResourceSelectorRequirement }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1ScopedResourceSelectorRequirement[name]))}

function check_required(o::IoK8sApiCoreV1ScopedResourceSelectorRequirement)
    o.operator === nothing && (return false)
    o.scopeName === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1ScopedResourceSelectorRequirement }, name::Symbol, val)
end