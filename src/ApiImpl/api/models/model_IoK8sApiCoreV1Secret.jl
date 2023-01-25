# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.Secret
Secret holds secret data of a certain type. The total bytes of the values in the Data field must be less than MaxSecretSize bytes.

    IoK8sApiCoreV1Secret(;
        apiVersion=nothing,
        data=nothing,
        kind=nothing,
        metadata=nothing,
        stringData=nothing,
        type=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - data::Dict{String, Vector{UInt8}} : Data contains the secret data. Each key must consist of alphanumeric characters, &#39;-&#39;, &#39;_&#39; or &#39;.&#39;. The serialized form of the secret data is a base64 encoded string, representing the arbitrary (possibly non-string) data value here. Described in https://tools.ietf.org/html/rfc4648#section-4
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta
    - stringData::Dict{String, String} : stringData allows specifying non-binary secret data in string form. It is provided as a write-only convenience method. All keys and values are merged into the data field on write, overwriting any existing values. It is never output when reading from the API.
    - type::String : Used to facilitate programmatic handling of secret data.
"""
Base.@kwdef mutable struct IoK8sApiCoreV1Secret <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    data::Union{Nothing, Dict{String, Vector{UInt8}}} = nothing
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta }
    stringData::Union{Nothing, Dict{String, String}} = nothing
    type::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1Secret(apiVersion, data, kind, metadata, stringData, type, )
        OpenAPI.validate_property(IoK8sApiCoreV1Secret, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiCoreV1Secret, Symbol("data"), data)
        OpenAPI.validate_property(IoK8sApiCoreV1Secret, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiCoreV1Secret, Symbol("metadata"), metadata)
        OpenAPI.validate_property(IoK8sApiCoreV1Secret, Symbol("stringData"), stringData)
        OpenAPI.validate_property(IoK8sApiCoreV1Secret, Symbol("type"), type)
        return new(apiVersion, data, kind, metadata, stringData, type, )
    end
end # type IoK8sApiCoreV1Secret

const _property_types_IoK8sApiCoreV1Secret = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("data")=>"Dict{String, Vector{UInt8}}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("stringData")=>"Dict{String, String}", Symbol("type")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1Secret }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1Secret[name]))}

function check_required(o::IoK8sApiCoreV1Secret)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1Secret }, name::Symbol, val)
end