# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1Service <: SwaggerModel

    function IoK8sKubernetesPkgApiV1Service(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1Service

const _property_map_IoK8sKubernetesPkgApiV1Service = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1Service = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1Service }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1Service))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1Service }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1Service[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1Service }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1Service[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1Service)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1Service }, name::Symbol, val)
end