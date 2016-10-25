# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.

type V1alpha1RoleBindingList <: SwaggerModel
    items::Nullable{ Vector{V1alpha1RoleBinding} } # items
    metadata::Nullable{ UnversionedListMeta } # metadata

    function V1alpha1RoleBindingList(;items=nothing, metadata=nothing)
        o = new()
        set_field!(o, :items, items)
        set_field!(o, :metadata, metadata)
        o
    end
end # type V1alpha1RoleBindingList

const _name_map_V1alpha1RoleBindingList = Dict{String,Symbol}(["items"=>:items, "metadata"=>:metadata])
Swagger.name_map(::Type{ V1alpha1RoleBindingList }) = _name_map_V1alpha1RoleBindingList

function check_required(o::V1alpha1RoleBindingList)
    isnull(o.items) && (return false)
    true
end

function validate_field(o::V1alpha1RoleBindingList, name::Symbol, val)
end