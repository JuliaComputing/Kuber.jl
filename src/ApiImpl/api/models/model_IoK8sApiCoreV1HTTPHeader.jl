# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.HTTPHeader
HTTPHeader describes a custom header to be used in HTTP probes

    IoK8sApiCoreV1HTTPHeader(;
        name=nothing,
        value=nothing,
    )

    - name::String : The header field name
    - value::String : The header field value
"""
Base.@kwdef mutable struct IoK8sApiCoreV1HTTPHeader <: OpenAPI.APIModel
    name::Union{Nothing, String} = nothing
    value::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1HTTPHeader(name, value, )
        OpenAPI.validate_property(IoK8sApiCoreV1HTTPHeader, Symbol("name"), name)
        OpenAPI.validate_property(IoK8sApiCoreV1HTTPHeader, Symbol("value"), value)
        return new(name, value, )
    end
end # type IoK8sApiCoreV1HTTPHeader

const _property_types_IoK8sApiCoreV1HTTPHeader = Dict{Symbol,String}(Symbol("name")=>"String", Symbol("value")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1HTTPHeader }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1HTTPHeader[name]))}

function check_required(o::IoK8sApiCoreV1HTTPHeader)
    o.name === nothing && (return false)
    o.value === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1HTTPHeader }, name::Symbol, val)
end
