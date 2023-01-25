# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.rbac.v1.ClusterRoleBinding
ClusterRoleBinding references a ClusterRole, but not contain it.  It can reference a ClusterRole in the global namespace, and adds who information via Subject.

    IoK8sApiRbacV1ClusterRoleBinding(;
        apiVersion=nothing,
        kind=nothing,
        metadata=nothing,
        roleRef=nothing,
        subjects=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta
    - roleRef::IoK8sApiRbacV1RoleRef
    - subjects::Vector{IoK8sApiRbacV1Subject} : Subjects holds references to the objects the role applies to.
"""
Base.@kwdef mutable struct IoK8sApiRbacV1ClusterRoleBinding <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta }
    roleRef = nothing # spec type: Union{ Nothing, IoK8sApiRbacV1RoleRef }
    subjects::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiRbacV1Subject} }

    function IoK8sApiRbacV1ClusterRoleBinding(apiVersion, kind, metadata, roleRef, subjects, )
        OpenAPI.validate_property(IoK8sApiRbacV1ClusterRoleBinding, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiRbacV1ClusterRoleBinding, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiRbacV1ClusterRoleBinding, Symbol("metadata"), metadata)
        OpenAPI.validate_property(IoK8sApiRbacV1ClusterRoleBinding, Symbol("roleRef"), roleRef)
        OpenAPI.validate_property(IoK8sApiRbacV1ClusterRoleBinding, Symbol("subjects"), subjects)
        return new(apiVersion, kind, metadata, roleRef, subjects, )
    end
end # type IoK8sApiRbacV1ClusterRoleBinding

const _property_types_IoK8sApiRbacV1ClusterRoleBinding = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("roleRef")=>"IoK8sApiRbacV1RoleRef", Symbol("subjects")=>"Vector{IoK8sApiRbacV1Subject}", )
OpenAPI.property_type(::Type{ IoK8sApiRbacV1ClusterRoleBinding }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiRbacV1ClusterRoleBinding[name]))}

function check_required(o::IoK8sApiRbacV1ClusterRoleBinding)
    o.roleRef === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiRbacV1ClusterRoleBinding }, name::Symbol, val)
end