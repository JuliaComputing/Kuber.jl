# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.extensions.v1beta1.IDRange
IDRange provides a min/max of an allowed range of IDs. Deprecated: use IDRange from policy API Group instead.

    IoK8sApiExtensionsV1beta1IDRange(;
        max=nothing,
        min=nothing,
    )

    - max::Int64 : max is the end of the range, inclusive.
    - min::Int64 : min is the start of the range, inclusive.
"""
Base.@kwdef mutable struct IoK8sApiExtensionsV1beta1IDRange <: OpenAPI.APIModel
    max::Union{Nothing, Int64} = nothing
    min::Union{Nothing, Int64} = nothing

    function IoK8sApiExtensionsV1beta1IDRange(max, min, )
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1IDRange, Symbol("max"), max)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1IDRange, Symbol("min"), min)
        return new(max, min, )
    end
end # type IoK8sApiExtensionsV1beta1IDRange

const _property_types_IoK8sApiExtensionsV1beta1IDRange = Dict{Symbol,String}(Symbol("max")=>"Int64", Symbol("min")=>"Int64", )
OpenAPI.property_type(::Type{ IoK8sApiExtensionsV1beta1IDRange }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1IDRange[name]))}

function check_required(o::IoK8sApiExtensionsV1beta1IDRange)
    o.max === nothing && (return false)
    o.min === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiExtensionsV1beta1IDRange }, name::Symbol, val)
    if name === Symbol("max")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1IDRange", :format, val, "int64")
    end
    if name === Symbol("min")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1IDRange", :format, val, "int64")
    end
end
