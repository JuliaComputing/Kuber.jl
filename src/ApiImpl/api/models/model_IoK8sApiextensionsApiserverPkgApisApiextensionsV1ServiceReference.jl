# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.ServiceReference
ServiceReference holds a reference to Service.legacy.k8s.io

    IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference(;
        name=nothing,
        namespace=nothing,
        path=nothing,
        port=nothing,
    )

    - name::String : name is the name of the service. Required
    - namespace::String : namespace is the namespace of the service. Required
    - path::String : path is an optional URL path at which the webhook will be contacted.
    - port::Int64 : port is an optional service port at which the webhook will be contacted. &#x60;port&#x60; should be a valid port number (1-65535, inclusive). Defaults to 443 for backward compatibility.
"""
Base.@kwdef mutable struct IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference <: OpenAPI.APIModel
    name::Union{Nothing, String} = nothing
    namespace::Union{Nothing, String} = nothing
    path::Union{Nothing, String} = nothing
    port::Union{Nothing, Int64} = nothing

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference(name, namespace, path, port, )
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference, Symbol("name"), name)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference, Symbol("namespace"), namespace)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference, Symbol("path"), path)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference, Symbol("port"), port)
        return new(name, namespace, path, port, )
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference

const _property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference = Dict{Symbol,String}(Symbol("name")=>"String", Symbol("namespace")=>"String", Symbol("path")=>"String", Symbol("port")=>"Int64", )
OpenAPI.property_type(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference[name]))}

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference)
    o.name === nothing && (return false)
    o.namespace === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference }, name::Symbol, val)
    if name === Symbol("port")
        OpenAPI.validate_param(name, "IoK8sApiextensionsApiserverPkgApisApiextensionsV1ServiceReference", :format, val, "int32")
    end
end
