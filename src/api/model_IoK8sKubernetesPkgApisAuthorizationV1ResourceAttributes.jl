# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes <: SwaggerModel

    function IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes

const _property_map_IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes }) = collect(keys(_property_map_IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes[property_name]

function check_required(o::IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisAuthorizationV1ResourceAttributes }, name::Symbol, val)
end