# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1NodeSelectorRequirement <: SwaggerModel

    function IoK8sKubernetesPkgApiV1NodeSelectorRequirement(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1NodeSelectorRequirement

const _property_map_IoK8sKubernetesPkgApiV1NodeSelectorRequirement = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1NodeSelectorRequirement = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1NodeSelectorRequirement }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1NodeSelectorRequirement))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1NodeSelectorRequirement }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1NodeSelectorRequirement[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1NodeSelectorRequirement }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1NodeSelectorRequirement[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1NodeSelectorRequirement)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1NodeSelectorRequirement }, name::Symbol, val)
end