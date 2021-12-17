# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""IngressBackend describes all endpoints for a given service and port.

    IoK8sApiNetworkingV1beta1IngressBackend(;
        serviceName=nothing,
        servicePort=nothing,
    )

    - serviceName::String : Specifies the name of the referenced service.
    - servicePort::IoK8sApimachineryPkgUtilIntstrIntOrString : Specifies the port of the referenced service.
"""
mutable struct IoK8sApiNetworkingV1beta1IngressBackend <: SwaggerModel
    serviceName::Any # spec type: Union{ Nothing, String } # spec name: serviceName
    servicePort::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgUtilIntstrIntOrString } # spec name: servicePort

    function IoK8sApiNetworkingV1beta1IngressBackend(;serviceName=nothing, servicePort=nothing)
        o = new()
        validate_property(IoK8sApiNetworkingV1beta1IngressBackend, Symbol("serviceName"), serviceName)
        setfield!(o, Symbol("serviceName"), serviceName)
        validate_property(IoK8sApiNetworkingV1beta1IngressBackend, Symbol("servicePort"), servicePort)
        setfield!(o, Symbol("servicePort"), servicePort)
        o
    end
end # type IoK8sApiNetworkingV1beta1IngressBackend

const _property_map_IoK8sApiNetworkingV1beta1IngressBackend = Dict{Symbol,Symbol}(Symbol("serviceName")=>Symbol("serviceName"), Symbol("servicePort")=>Symbol("servicePort"))
const _property_types_IoK8sApiNetworkingV1beta1IngressBackend = Dict{Symbol,String}(Symbol("serviceName")=>"String", Symbol("servicePort")=>"IoK8sApimachineryPkgUtilIntstrIntOrString")
Base.propertynames(::Type{ IoK8sApiNetworkingV1beta1IngressBackend }) = collect(keys(_property_map_IoK8sApiNetworkingV1beta1IngressBackend))
Swagger.property_type(::Type{ IoK8sApiNetworkingV1beta1IngressBackend }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiNetworkingV1beta1IngressBackend[name]))}
Swagger.field_name(::Type{ IoK8sApiNetworkingV1beta1IngressBackend }, property_name::Symbol) =  _property_map_IoK8sApiNetworkingV1beta1IngressBackend[property_name]

function check_required(o::IoK8sApiNetworkingV1beta1IngressBackend)
    (getproperty(o, Symbol("serviceName")) === nothing) && (return false)
    (getproperty(o, Symbol("servicePort")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiNetworkingV1beta1IngressBackend }, name::Symbol, val)
end
