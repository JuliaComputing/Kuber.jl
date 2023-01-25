# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.HostAlias
HostAlias holds the mapping between IP and hostnames that will be injected as an entry in the pod&#39;s hosts file.

    IoK8sApiCoreV1HostAlias(;
        hostnames=nothing,
        ip=nothing,
    )

    - hostnames::Vector{String} : Hostnames for the above IP address.
    - ip::String : IP address of the host file entry.
"""
Base.@kwdef mutable struct IoK8sApiCoreV1HostAlias <: OpenAPI.APIModel
    hostnames::Union{Nothing, Vector{String}} = nothing
    ip::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1HostAlias(hostnames, ip, )
        OpenAPI.validate_property(IoK8sApiCoreV1HostAlias, Symbol("hostnames"), hostnames)
        OpenAPI.validate_property(IoK8sApiCoreV1HostAlias, Symbol("ip"), ip)
        return new(hostnames, ip, )
    end
end # type IoK8sApiCoreV1HostAlias

const _property_types_IoK8sApiCoreV1HostAlias = Dict{Symbol,String}(Symbol("hostnames")=>"Vector{String}", Symbol("ip")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1HostAlias }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1HostAlias[name]))}

function check_required(o::IoK8sApiCoreV1HostAlias)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1HostAlias }, name::Symbol, val)
end