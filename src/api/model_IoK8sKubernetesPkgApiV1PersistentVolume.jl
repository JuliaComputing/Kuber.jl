# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1PersistentVolume <: SwaggerModel

    function IoK8sKubernetesPkgApiV1PersistentVolume(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1PersistentVolume

const _property_map_IoK8sKubernetesPkgApiV1PersistentVolume = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1PersistentVolume = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1PersistentVolume }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1PersistentVolume))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1PersistentVolume }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1PersistentVolume[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1PersistentVolume }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1PersistentVolume[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1PersistentVolume)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1PersistentVolume }, name::Symbol, val)
end
