# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1ReplicationController <: SwaggerModel

    function IoK8sKubernetesPkgApiV1ReplicationController(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1ReplicationController

const _property_map_IoK8sKubernetesPkgApiV1ReplicationController = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1ReplicationController = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1ReplicationController }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1ReplicationController))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1ReplicationController }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1ReplicationController[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1ReplicationController }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1ReplicationController[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1ReplicationController)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1ReplicationController }, name::Symbol, val)
end
