# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1PodList <: SwaggerModel

    function IoK8sKubernetesPkgApiV1PodList(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1PodList

const _property_map_IoK8sKubernetesPkgApiV1PodList = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1PodList = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1PodList }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1PodList))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1PodList }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1PodList[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1PodList }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1PodList[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1PodList)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1PodList }, name::Symbol, val)
end