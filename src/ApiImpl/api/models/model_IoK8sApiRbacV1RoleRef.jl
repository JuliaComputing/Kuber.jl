# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.rbac.v1.RoleRef
RoleRef contains information that points to the role being used

    IoK8sApiRbacV1RoleRef(;
        apiGroup=nothing,
        kind=nothing,
        name=nothing,
    )

    - apiGroup::String : APIGroup is the group for the resource being referenced
    - kind::String : Kind is the type of resource being referenced
    - name::String : Name is the name of resource being referenced
"""
Base.@kwdef mutable struct IoK8sApiRbacV1RoleRef <: OpenAPI.APIModel
    apiGroup::Union{Nothing, String} = nothing
    kind::Union{Nothing, String} = nothing
    name::Union{Nothing, String} = nothing

    function IoK8sApiRbacV1RoleRef(apiGroup, kind, name, )
        OpenAPI.validate_property(IoK8sApiRbacV1RoleRef, Symbol("apiGroup"), apiGroup)
        OpenAPI.validate_property(IoK8sApiRbacV1RoleRef, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiRbacV1RoleRef, Symbol("name"), name)
        return new(apiGroup, kind, name, )
    end
end # type IoK8sApiRbacV1RoleRef

const _property_types_IoK8sApiRbacV1RoleRef = Dict{Symbol,String}(Symbol("apiGroup")=>"String", Symbol("kind")=>"String", Symbol("name")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiRbacV1RoleRef }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiRbacV1RoleRef[name]))}

function check_required(o::IoK8sApiRbacV1RoleRef)
    o.apiGroup === nothing && (return false)
    o.kind === nothing && (return false)
    o.name === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiRbacV1RoleRef }, name::Symbol, val)
end
