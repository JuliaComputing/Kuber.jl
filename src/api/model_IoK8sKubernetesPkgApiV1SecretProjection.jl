# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1SecretProjection <: SwaggerModel

    function IoK8sKubernetesPkgApiV1SecretProjection(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1SecretProjection

const _property_map_IoK8sKubernetesPkgApiV1SecretProjection = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1SecretProjection = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1SecretProjection }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1SecretProjection))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1SecretProjection }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1SecretProjection[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1SecretProjection }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1SecretProjection[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1SecretProjection)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1SecretProjection }, name::Symbol, val)
end
