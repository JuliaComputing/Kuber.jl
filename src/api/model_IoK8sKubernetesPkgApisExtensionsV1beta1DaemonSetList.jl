# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList <: SwaggerModel

    function IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList

const _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList }) = collect(keys(_property_map_IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList[property_name]

function check_required(o::IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetList }, name::Symbol, val)
end