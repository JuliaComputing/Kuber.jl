# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1Probe <: SwaggerModel

    function IoK8sKubernetesPkgApiV1Probe(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1Probe

const _property_map_IoK8sKubernetesPkgApiV1Probe = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1Probe = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1Probe }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1Probe))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1Probe }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1Probe[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1Probe }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1Probe[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1Probe)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1Probe }, name::Symbol, val)
end