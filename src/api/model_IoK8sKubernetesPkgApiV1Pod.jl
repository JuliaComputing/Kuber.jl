# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1Pod <: SwaggerModel

    function IoK8sKubernetesPkgApiV1Pod(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1Pod

const _property_map_IoK8sKubernetesPkgApiV1Pod = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1Pod = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1Pod }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1Pod))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1Pod }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1Pod[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1Pod }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1Pod[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1Pod)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1Pod }, name::Symbol, val)
end