# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.apimachinery.pkg.apis.meta.v1.Status_v2
Status is a return value for calls that don&#39;t return other objects.

    IoK8sApimachineryPkgApisMetaV1StatusV2(;
        apiVersion=nothing,
        code=nothing,
        details=nothing,
        kind=nothing,
        message=nothing,
        metadata=nothing,
        reason=nothing,
        status=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - code::Int64 : Suggested HTTP return code for this status, 0 if not set.
    - details::IoK8sApimachineryPkgApisMetaV1StatusDetailsV2
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - message::String : A human-readable description of the status of this operation.
    - metadata::IoK8sApimachineryPkgApisMetaV1ListMeta
    - reason::String : A machine-readable description of why this operation is in the \&quot;Failure\&quot; status. If this value is empty there is no information available. A Reason clarifies an HTTP status code but does not override it.
    - status::String : Status of the operation. One of: \&quot;Success\&quot; or \&quot;Failure\&quot;. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
"""
Base.@kwdef mutable struct IoK8sApimachineryPkgApisMetaV1StatusV2 <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    code::Union{Nothing, Int64} = nothing
    details = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1StatusDetailsV2 }
    kind::Union{Nothing, String} = nothing
    message::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ListMeta }
    reason::Union{Nothing, String} = nothing
    status::Union{Nothing, String} = nothing

    function IoK8sApimachineryPkgApisMetaV1StatusV2(apiVersion, code, details, kind, message, metadata, reason, status, )
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1StatusV2, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1StatusV2, Symbol("code"), code)
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1StatusV2, Symbol("details"), details)
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1StatusV2, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1StatusV2, Symbol("message"), message)
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1StatusV2, Symbol("metadata"), metadata)
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1StatusV2, Symbol("reason"), reason)
        OpenAPI.validate_property(IoK8sApimachineryPkgApisMetaV1StatusV2, Symbol("status"), status)
        return new(apiVersion, code, details, kind, message, metadata, reason, status, )
    end
end # type IoK8sApimachineryPkgApisMetaV1StatusV2

const _property_types_IoK8sApimachineryPkgApisMetaV1StatusV2 = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("code")=>"Int64", Symbol("details")=>"IoK8sApimachineryPkgApisMetaV1StatusDetailsV2", Symbol("kind")=>"String", Symbol("message")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ListMeta", Symbol("reason")=>"String", Symbol("status")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApimachineryPkgApisMetaV1StatusV2 }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApimachineryPkgApisMetaV1StatusV2[name]))}

function check_required(o::IoK8sApimachineryPkgApisMetaV1StatusV2)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApimachineryPkgApisMetaV1StatusV2 }, name::Symbol, val)
    if name === Symbol("code")
        OpenAPI.validate_param(name, "IoK8sApimachineryPkgApisMetaV1StatusV2", :format, val, "int32")
    end
end