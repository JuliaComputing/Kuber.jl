# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisExtensionsV1beta1IDRange <: SwaggerModel

    function IoK8sKubernetesPkgApisExtensionsV1beta1IDRange(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisExtensionsV1beta1IDRange

const _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1IDRange = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisExtensionsV1beta1IDRange = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IDRange }) = collect(keys(_property_map_IoK8sKubernetesPkgApisExtensionsV1beta1IDRange))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IDRange }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisExtensionsV1beta1IDRange[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IDRange }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisExtensionsV1beta1IDRange[property_name]

function check_required(o::IoK8sKubernetesPkgApisExtensionsV1beta1IDRange)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisExtensionsV1beta1IDRange }, name::Symbol, val)
end
