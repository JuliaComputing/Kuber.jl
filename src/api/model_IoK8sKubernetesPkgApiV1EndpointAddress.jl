# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1EndpointAddress <: SwaggerModel

    function IoK8sKubernetesPkgApiV1EndpointAddress(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1EndpointAddress

const _property_map_IoK8sKubernetesPkgApiV1EndpointAddress = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1EndpointAddress = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1EndpointAddress }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1EndpointAddress))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1EndpointAddress }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1EndpointAddress[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1EndpointAddress }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1EndpointAddress[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1EndpointAddress)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1EndpointAddress }, name::Symbol, val)
end
