# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1TCPSocketAction <: SwaggerModel

    function IoK8sKubernetesPkgApiV1TCPSocketAction(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1TCPSocketAction

const _property_map_IoK8sKubernetesPkgApiV1TCPSocketAction = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1TCPSocketAction = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1TCPSocketAction }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1TCPSocketAction))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1TCPSocketAction }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1TCPSocketAction[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1TCPSocketAction }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1TCPSocketAction[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1TCPSocketAction)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1TCPSocketAction }, name::Symbol, val)
end
