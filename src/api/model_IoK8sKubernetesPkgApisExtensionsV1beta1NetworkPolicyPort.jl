# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort <: SwaggerModel

    function IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort

const _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort }) = collect(keys(_property_map_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort[property_name]

function check_required(o::IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicyPort }, name::Symbol, val)
end