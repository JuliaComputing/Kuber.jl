# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1ServiceList <: SwaggerModel

    function IoK8sKubernetesPkgApiV1ServiceList(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1ServiceList

const _property_map_IoK8sKubernetesPkgApiV1ServiceList = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1ServiceList = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1ServiceList }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1ServiceList))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1ServiceList }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1ServiceList[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1ServiceList }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1ServiceList[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1ServiceList)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1ServiceList }, name::Symbol, val)
end