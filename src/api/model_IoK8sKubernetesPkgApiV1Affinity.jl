# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1Affinity <: SwaggerModel

    function IoK8sKubernetesPkgApiV1Affinity(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1Affinity

const _property_map_IoK8sKubernetesPkgApiV1Affinity = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1Affinity = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1Affinity }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1Affinity))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1Affinity }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1Affinity[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1Affinity }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1Affinity[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1Affinity)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1Affinity }, name::Symbol, val)
end
