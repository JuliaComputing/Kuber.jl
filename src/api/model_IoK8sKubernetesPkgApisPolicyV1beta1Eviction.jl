# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisPolicyV1beta1Eviction <: SwaggerModel

    function IoK8sKubernetesPkgApisPolicyV1beta1Eviction(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisPolicyV1beta1Eviction

const _property_map_IoK8sKubernetesPkgApisPolicyV1beta1Eviction = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisPolicyV1beta1Eviction = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisPolicyV1beta1Eviction }) = collect(keys(_property_map_IoK8sKubernetesPkgApisPolicyV1beta1Eviction))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisPolicyV1beta1Eviction }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisPolicyV1beta1Eviction[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisPolicyV1beta1Eviction }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisPolicyV1beta1Eviction[property_name]

function check_required(o::IoK8sKubernetesPkgApisPolicyV1beta1Eviction)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisPolicyV1beta1Eviction }, name::Symbol, val)
end