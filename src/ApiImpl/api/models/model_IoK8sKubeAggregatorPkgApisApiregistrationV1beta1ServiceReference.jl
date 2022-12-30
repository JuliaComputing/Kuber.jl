# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.kube-aggregator.pkg.apis.apiregistration.v1beta1.ServiceReference
ServiceReference holds a reference to Service.legacy.k8s.io

    IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference(;
        name=nothing,
        namespace=nothing,
        port=nothing,
    )

    - name::String : Name is the name of the service
    - namespace::String : Namespace is the namespace of the service
    - port::Int64 : If specified, the port on the service that hosting webhook. Default to 443 for backward compatibility. &#x60;port&#x60; should be a valid port number (1-65535, inclusive).
"""
Base.@kwdef mutable struct IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference <: OpenAPI.APIModel
    name::Union{Nothing, String} = nothing
    namespace::Union{Nothing, String} = nothing
    port::Union{Nothing, Int64} = nothing

    function IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference(name, namespace, port, )
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference, Symbol("name"), name)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference, Symbol("namespace"), namespace)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference, Symbol("port"), port)
        return new(name, namespace, port, )
    end
end # type IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference

const _property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference = Dict{Symbol,String}(Symbol("name")=>"String", Symbol("namespace")=>"String", Symbol("port")=>"Int64", )
OpenAPI.property_type(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference[name]))}

function check_required(o::IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference }, name::Symbol, val)
    if name === Symbol("port")
        OpenAPI.validate_param(name, "IoK8sKubeAggregatorPkgApisApiregistrationV1beta1ServiceReference", :format, val, "int32")
    end
end
