# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1ServicePort <: SwaggerModel

    function IoK8sKubernetesPkgApiV1ServicePort(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1ServicePort

const _property_map_IoK8sKubernetesPkgApiV1ServicePort = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1ServicePort = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1ServicePort }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1ServicePort))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1ServicePort }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1ServicePort[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1ServicePort }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1ServicePort[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1ServicePort)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1ServicePort }, name::Symbol, val)
end