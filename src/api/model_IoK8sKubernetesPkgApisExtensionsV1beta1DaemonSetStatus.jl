# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus <: SwaggerModel

    function IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus

const _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus }) = collect(keys(_property_map_IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus[property_name]

function check_required(o::IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1DaemonSetStatus }, name::Symbol, val)
end