# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes <: SwaggerModel

    function IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes

const _property_map_IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes }) = collect(keys(_property_map_IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes[property_name]

function check_required(o::IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisAuthorizationV1beta1NonResourceAttributes }, name::Symbol, val)
end