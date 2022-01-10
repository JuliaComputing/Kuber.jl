# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""NodeDaemonEndpoints lists ports opened by daemons running on the Node.

    IoK8sApiCoreV1NodeDaemonEndpoints(;
        kubeletEndpoint=nothing,
    )

    - kubeletEndpoint::IoK8sApiCoreV1DaemonEndpoint : Endpoint on which Kubelet is listening.
"""
mutable struct IoK8sApiCoreV1NodeDaemonEndpoints <: SwaggerModel
    kubeletEndpoint::Any # spec type: Union{ Nothing, IoK8sApiCoreV1DaemonEndpoint } # spec name: kubeletEndpoint

    function IoK8sApiCoreV1NodeDaemonEndpoints(;kubeletEndpoint=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1NodeDaemonEndpoints, Symbol("kubeletEndpoint"), kubeletEndpoint)
        setfield!(o, Symbol("kubeletEndpoint"), kubeletEndpoint)
        o
    end
end # type IoK8sApiCoreV1NodeDaemonEndpoints

const _property_map_IoK8sApiCoreV1NodeDaemonEndpoints = Dict{Symbol,Symbol}(Symbol("kubeletEndpoint")=>Symbol("kubeletEndpoint"))
const _property_types_IoK8sApiCoreV1NodeDaemonEndpoints = Dict{Symbol,String}(Symbol("kubeletEndpoint")=>"IoK8sApiCoreV1DaemonEndpoint")
Base.propertynames(::Type{ IoK8sApiCoreV1NodeDaemonEndpoints }) = collect(keys(_property_map_IoK8sApiCoreV1NodeDaemonEndpoints))
Swagger.property_type(::Type{ IoK8sApiCoreV1NodeDaemonEndpoints }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1NodeDaemonEndpoints[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1NodeDaemonEndpoints }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1NodeDaemonEndpoints[property_name]

function check_required(o::IoK8sApiCoreV1NodeDaemonEndpoints)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1NodeDaemonEndpoints }, name::Symbol, val)
end