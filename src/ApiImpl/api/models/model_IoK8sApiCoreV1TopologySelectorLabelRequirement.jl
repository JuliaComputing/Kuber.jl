# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.TopologySelectorLabelRequirement
A topology selector requirement is a selector that matches given label. This is an alpha feature and may change in the future.

    IoK8sApiCoreV1TopologySelectorLabelRequirement(;
        key=nothing,
        values=nothing,
    )

    - key::String : The label key that the selector applies to.
    - values::Vector{String} : An array of string values. One value must match the label to be selected. Each entry in Values is ORed.
"""
Base.@kwdef mutable struct IoK8sApiCoreV1TopologySelectorLabelRequirement <: OpenAPI.APIModel
    key::Union{Nothing, String} = nothing
    values::Union{Nothing, Vector{String}} = nothing

    function IoK8sApiCoreV1TopologySelectorLabelRequirement(key, values, )
        OpenAPI.validate_property(IoK8sApiCoreV1TopologySelectorLabelRequirement, Symbol("key"), key)
        OpenAPI.validate_property(IoK8sApiCoreV1TopologySelectorLabelRequirement, Symbol("values"), values)
        return new(key, values, )
    end
end # type IoK8sApiCoreV1TopologySelectorLabelRequirement

const _property_types_IoK8sApiCoreV1TopologySelectorLabelRequirement = Dict{Symbol,String}(Symbol("key")=>"String", Symbol("values")=>"Vector{String}", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1TopologySelectorLabelRequirement }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1TopologySelectorLabelRequirement[name]))}

function check_required(o::IoK8sApiCoreV1TopologySelectorLabelRequirement)
    o.key === nothing && (return false)
    o.values === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1TopologySelectorLabelRequirement }, name::Symbol, val)
end
