# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy <: SwaggerModel

    function IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy

const _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy }) = collect(keys(_property_map_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy[property_name]

function check_required(o::IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicy }, name::Symbol, val)
end