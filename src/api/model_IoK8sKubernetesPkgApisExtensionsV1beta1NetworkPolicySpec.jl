# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec <: SwaggerModel

    function IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec

const _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec }) = collect(keys(_property_map_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec[property_name]

function check_required(o::IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1NetworkPolicySpec }, name::Symbol, val)
end
