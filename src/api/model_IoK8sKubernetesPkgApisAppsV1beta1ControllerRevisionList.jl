# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList <: SwaggerModel

    function IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList

const _property_map_IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList }) = collect(keys(_property_map_IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList[property_name]

function check_required(o::IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisAppsV1beta1ControllerRevisionList }, name::Symbol, val)
end
