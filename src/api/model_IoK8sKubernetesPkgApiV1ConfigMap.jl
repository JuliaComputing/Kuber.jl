# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1ConfigMap <: SwaggerModel

    function IoK8sKubernetesPkgApiV1ConfigMap(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1ConfigMap

const _property_map_IoK8sKubernetesPkgApiV1ConfigMap = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1ConfigMap = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1ConfigMap }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1ConfigMap))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1ConfigMap }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1ConfigMap[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1ConfigMap }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1ConfigMap[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1ConfigMap)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1ConfigMap }, name::Symbol, val)
end