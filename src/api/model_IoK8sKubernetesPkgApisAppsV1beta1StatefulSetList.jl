# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList <: SwaggerModel

    function IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList

const _property_map_IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList }) = collect(keys(_property_map_IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList[property_name]

function check_required(o::IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisAppsV1beta1StatefulSetList }, name::Symbol, val)
end
