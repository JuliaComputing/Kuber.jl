# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1ServiceSpec <: SwaggerModel

    function IoK8sKubernetesPkgApiV1ServiceSpec(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1ServiceSpec

const _property_map_IoK8sKubernetesPkgApiV1ServiceSpec = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1ServiceSpec = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1ServiceSpec }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1ServiceSpec))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1ServiceSpec }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1ServiceSpec[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1ServiceSpec }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1ServiceSpec[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1ServiceSpec)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1ServiceSpec }, name::Symbol, val)
end