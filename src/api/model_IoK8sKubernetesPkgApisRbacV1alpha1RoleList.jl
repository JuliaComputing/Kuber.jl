# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisRbacV1alpha1RoleList <: SwaggerModel

    function IoK8sKubernetesPkgApisRbacV1alpha1RoleList(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisRbacV1alpha1RoleList

const _property_map_IoK8sKubernetesPkgApisRbacV1alpha1RoleList = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisRbacV1alpha1RoleList = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisRbacV1alpha1RoleList }) = collect(keys(_property_map_IoK8sKubernetesPkgApisRbacV1alpha1RoleList))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisRbacV1alpha1RoleList }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisRbacV1alpha1RoleList[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisRbacV1alpha1RoleList }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisRbacV1alpha1RoleList[property_name]

function check_required(o::IoK8sKubernetesPkgApisRbacV1alpha1RoleList)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisRbacV1alpha1RoleList }, name::Symbol, val)
end
