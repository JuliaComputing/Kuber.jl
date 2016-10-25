# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.

type V1alpha1ClusterRoleBinding <: SwaggerModel
    metadata::Nullable{ V1ObjectMeta } # metadata
    roleRef::Nullable{ V1alpha1RoleRef } # roleRef
    subjects::Nullable{ Vector{V1alpha1Subject} } # subjects

    function V1alpha1ClusterRoleBinding(;metadata=nothing, roleRef=nothing, subjects=nothing)
        o = new()
        set_field!(o, :metadata, metadata)
        set_field!(o, :roleRef, roleRef)
        set_field!(o, :subjects, subjects)
        o
    end
end # type V1alpha1ClusterRoleBinding

const _name_map_V1alpha1ClusterRoleBinding = Dict{String,Symbol}(["metadata"=>:metadata, "roleRef"=>:roleRef, "subjects"=>:subjects])
Swagger.name_map(::Type{ V1alpha1ClusterRoleBinding }) = _name_map_V1alpha1ClusterRoleBinding

function check_required(o::V1alpha1ClusterRoleBinding)
    isnull(o.roleRef) && (return false)
    isnull(o.subjects) && (return false)
    true
end

function validate_field(o::V1alpha1ClusterRoleBinding, name::Symbol, val)
end