# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1LocalObjectReference <: SwaggerModel

    function IoK8sKubernetesPkgApiV1LocalObjectReference(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1LocalObjectReference

const _property_map_IoK8sKubernetesPkgApiV1LocalObjectReference = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1LocalObjectReference = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1LocalObjectReference }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1LocalObjectReference))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1LocalObjectReference }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1LocalObjectReference[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1LocalObjectReference }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1LocalObjectReference[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1LocalObjectReference)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1LocalObjectReference }, name::Symbol, val)
end