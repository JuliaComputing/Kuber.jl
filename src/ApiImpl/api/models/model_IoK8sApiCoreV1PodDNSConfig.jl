# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.PodDNSConfig
PodDNSConfig defines the DNS parameters of a pod in addition to those generated from DNSPolicy.

    IoK8sApiCoreV1PodDNSConfig(;
        nameservers=nothing,
        options=nothing,
        searches=nothing,
    )

    - nameservers::Vector{String} : A list of DNS name server IP addresses. This will be appended to the base nameservers generated from DNSPolicy. Duplicated nameservers will be removed.
    - options::Vector{IoK8sApiCoreV1PodDNSConfigOption} : A list of DNS resolver options. This will be merged with the base options generated from DNSPolicy. Duplicated entries will be removed. Resolution options given in Options will override those that appear in the base DNSPolicy.
    - searches::Vector{String} : A list of DNS search domains for host-name lookup. This will be appended to the base search paths generated from DNSPolicy. Duplicated search paths will be removed.
"""
Base.@kwdef mutable struct IoK8sApiCoreV1PodDNSConfig <: OpenAPI.APIModel
    nameservers::Union{Nothing, Vector{String}} = nothing
    options::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1PodDNSConfigOption} }
    searches::Union{Nothing, Vector{String}} = nothing

    function IoK8sApiCoreV1PodDNSConfig(nameservers, options, searches, )
        OpenAPI.validate_property(IoK8sApiCoreV1PodDNSConfig, Symbol("nameservers"), nameservers)
        OpenAPI.validate_property(IoK8sApiCoreV1PodDNSConfig, Symbol("options"), options)
        OpenAPI.validate_property(IoK8sApiCoreV1PodDNSConfig, Symbol("searches"), searches)
        return new(nameservers, options, searches, )
    end
end # type IoK8sApiCoreV1PodDNSConfig

const _property_types_IoK8sApiCoreV1PodDNSConfig = Dict{Symbol,String}(Symbol("nameservers")=>"Vector{String}", Symbol("options")=>"Vector{IoK8sApiCoreV1PodDNSConfigOption}", Symbol("searches")=>"Vector{String}", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1PodDNSConfig }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1PodDNSConfig[name]))}

function check_required(o::IoK8sApiCoreV1PodDNSConfig)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1PodDNSConfig }, name::Symbol, val)
end
