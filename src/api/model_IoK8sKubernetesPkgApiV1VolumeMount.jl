# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1VolumeMount <: SwaggerModel

    function IoK8sKubernetesPkgApiV1VolumeMount(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1VolumeMount

const _property_map_IoK8sKubernetesPkgApiV1VolumeMount = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1VolumeMount = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1VolumeMount }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1VolumeMount))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1VolumeMount }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1VolumeMount[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1VolumeMount }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1VolumeMount[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1VolumeMount)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1VolumeMount }, name::Symbol, val)
end
