# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy <: SwaggerModel

    function IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy

const _property_map_IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy }) = collect(keys(_property_map_IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy[property_name]

function check_required(o::IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisAppsV1beta1StatefulSetUpdateStrategy }, name::Symbol, val)
end