# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend <: SwaggerModel

    function IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend

const _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend }) = collect(keys(_property_map_IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend[property_name]

function check_required(o::IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IngressBackend }, name::Symbol, val)
end
