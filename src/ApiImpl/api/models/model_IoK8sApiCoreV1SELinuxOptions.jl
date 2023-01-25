# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.SELinuxOptions
SELinuxOptions are the labels to be applied to the container

    IoK8sApiCoreV1SELinuxOptions(;
        level=nothing,
        role=nothing,
        type=nothing,
        user=nothing,
    )

    - level::String : Level is SELinux level label that applies to the container.
    - role::String : Role is a SELinux role label that applies to the container.
    - type::String : Type is a SELinux type label that applies to the container.
    - user::String : User is a SELinux user label that applies to the container.
"""
Base.@kwdef mutable struct IoK8sApiCoreV1SELinuxOptions <: OpenAPI.APIModel
    level::Union{Nothing, String} = nothing
    role::Union{Nothing, String} = nothing
    type::Union{Nothing, String} = nothing
    user::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1SELinuxOptions(level, role, type, user, )
        OpenAPI.validate_property(IoK8sApiCoreV1SELinuxOptions, Symbol("level"), level)
        OpenAPI.validate_property(IoK8sApiCoreV1SELinuxOptions, Symbol("role"), role)
        OpenAPI.validate_property(IoK8sApiCoreV1SELinuxOptions, Symbol("type"), type)
        OpenAPI.validate_property(IoK8sApiCoreV1SELinuxOptions, Symbol("user"), user)
        return new(level, role, type, user, )
    end
end # type IoK8sApiCoreV1SELinuxOptions

const _property_types_IoK8sApiCoreV1SELinuxOptions = Dict{Symbol,String}(Symbol("level")=>"String", Symbol("role")=>"String", Symbol("type")=>"String", Symbol("user")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1SELinuxOptions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1SELinuxOptions[name]))}

function check_required(o::IoK8sApiCoreV1SELinuxOptions)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1SELinuxOptions }, name::Symbol, val)
end