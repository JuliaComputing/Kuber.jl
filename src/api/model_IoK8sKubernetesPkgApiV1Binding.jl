# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1Binding <: SwaggerModel

    function IoK8sKubernetesPkgApiV1Binding(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1Binding

const _property_map_IoK8sKubernetesPkgApiV1Binding = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1Binding = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1Binding }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1Binding))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1Binding }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1Binding[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1Binding }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1Binding[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1Binding)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1Binding }, name::Symbol, val)
end
