# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.certificates.v1beta1.CertificateSigningRequestList

    IoK8sApiCertificatesV1beta1CertificateSigningRequestList(;
        apiVersion=nothing,
        items=nothing,
        kind=nothing,
        metadata=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - items::Vector{IoK8sApiCertificatesV1beta1CertificateSigningRequest}
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ListMeta
"""
Base.@kwdef mutable struct IoK8sApiCertificatesV1beta1CertificateSigningRequestList <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    items::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiCertificatesV1beta1CertificateSigningRequest} }
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ListMeta }

    function IoK8sApiCertificatesV1beta1CertificateSigningRequestList(apiVersion, items, kind, metadata, )
        OpenAPI.validate_property(IoK8sApiCertificatesV1beta1CertificateSigningRequestList, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiCertificatesV1beta1CertificateSigningRequestList, Symbol("items"), items)
        OpenAPI.validate_property(IoK8sApiCertificatesV1beta1CertificateSigningRequestList, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiCertificatesV1beta1CertificateSigningRequestList, Symbol("metadata"), metadata)
        return new(apiVersion, items, kind, metadata, )
    end
end # type IoK8sApiCertificatesV1beta1CertificateSigningRequestList

const _property_types_IoK8sApiCertificatesV1beta1CertificateSigningRequestList = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("items")=>"Vector{IoK8sApiCertificatesV1beta1CertificateSigningRequest}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ListMeta", )
OpenAPI.property_type(::Type{ IoK8sApiCertificatesV1beta1CertificateSigningRequestList }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCertificatesV1beta1CertificateSigningRequestList[name]))}

function check_required(o::IoK8sApiCertificatesV1beta1CertificateSigningRequestList)
    o.items === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCertificatesV1beta1CertificateSigningRequestList }, name::Symbol, val)
end