# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.apimachinery.pkg.apis.meta.v1.APIVersions
APIVersions lists the versions that are available, to allow clients to discover the API at /api, which is the root path of the legacy v1 API.

    IoK8sApimachineryPkgApisMetaV1APIVersions(;
        apiVersion=nothing,
        kind=nothing,
        serverAddressByClientCIDRs=nothing,
        versions=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - serverAddressByClientCIDRs::Vector{IoK8sApimachineryPkgApisMetaV1ServerAddressByClientCIDR} : a map of client CIDR to server address that is serving this group. This is to help clients reach servers in the most network-efficient way possible. Clients can use the appropriate server address as per the CIDR that they match. In case of multiple matches, clients should use the longest matching CIDR. The server returns only those CIDRs that it thinks that the client can match. For example: the master will return an internal IP CIDR only, if the client reaches the server using an internal IP. Server looks at X-Forwarded-For header or X-Real-Ip header or request.RemoteAddr (in that order) to get the client IP.
    - versions::Vector{String} : versions are the api versions that are available.
"""
Base.@kwdef mutable struct IoK8sApimachineryPkgApisMetaV1APIVersions <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    kind::Union{Nothing, String} = nothing
    serverAddressByClientCIDRs::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApimachineryPkgApisMetaV1ServerAddressByClientCIDR} }
    versions::Union{Nothing, Vector{String}} = nothing

    function IoK8sApimachineryPkgApisMetaV1APIVersions(apiVersion, kind, serverAddressByClientCIDRs, versions, )
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1APIVersions, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1APIVersions, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1APIVersions, Symbol("serverAddressByClientCIDRs"), serverAddressByClientCIDRs)
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1APIVersions, Symbol("versions"), versions)
        return new(apiVersion, kind, serverAddressByClientCIDRs, versions, )
    end
end # type IoK8sApimachineryPkgApisMetaV1APIVersions

const _property_types_IoK8sApimachineryPkgApisMetaV1APIVersions = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("serverAddressByClientCIDRs")=>"Vector{IoK8sApimachineryPkgApisMetaV1ServerAddressByClientCIDR}", Symbol("versions")=>"Vector{String}", )
OpenAPI.property_type(::Type{ IoK8sApimachineryPkgApisMetaV1APIVersions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApimachineryPkgApisMetaV1APIVersions[name]))}

function check_required(o::IoK8sApimachineryPkgApisMetaV1APIVersions)
    o.serverAddressByClientCIDRs === nothing && (return false)
    o.versions === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApimachineryPkgApisMetaV1APIVersions }, name::Symbol, val)
end