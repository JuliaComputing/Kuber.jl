# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec <: SwaggerModel

    function IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec

const _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec }) = collect(keys(_property_map_IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec[property_name]

function check_required(o::IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IngressSpec }, name::Symbol, val)
end