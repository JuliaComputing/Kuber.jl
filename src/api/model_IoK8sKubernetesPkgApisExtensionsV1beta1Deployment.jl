# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisExtensionsV1beta1Deployment <: SwaggerModel

    function IoK8sKubernetesPkgApisExtensionsV1beta1Deployment(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisExtensionsV1beta1Deployment

const _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1Deployment = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisExtensionsV1beta1Deployment = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1Deployment }) = collect(keys(_property_map_IoK8sKubernetesPkgApisExtensionsV1beta1Deployment))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1Deployment }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisExtensionsV1beta1Deployment[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1Deployment }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1Deployment[property_name]

function check_required(o::IoK8sKubernetesPkgApisExtensionsV1beta1Deployment)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1Deployment }, name::Symbol, val)
end