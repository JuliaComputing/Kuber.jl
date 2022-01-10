# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""Scale represents a scaling request for a resource.

    IoK8sApiAppsV1beta2Scale(;
        apiVersion=nothing,
        kind=nothing,
        metadata=nothing,
        spec=nothing,
        status=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta : Standard object metadata; More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata.
    - spec::IoK8sApiAppsV1beta2ScaleSpec : defines the behavior of the scale. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status.
    - status::IoK8sApiAppsV1beta2ScaleStatus : current status of the scale. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status. Read-only.
"""
mutable struct IoK8sApiAppsV1beta2Scale <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    spec::Any # spec type: Union{ Nothing, IoK8sApiAppsV1beta2ScaleSpec } # spec name: spec
    status::Any # spec type: Union{ Nothing, IoK8sApiAppsV1beta2ScaleStatus } # spec name: status

    function IoK8sApiAppsV1beta2Scale(;apiVersion=nothing, kind=nothing, metadata=nothing, spec=nothing, status=nothing)
        o = new()
        validate_property(IoK8sApiAppsV1beta2Scale, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiAppsV1beta2Scale, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiAppsV1beta2Scale, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiAppsV1beta2Scale, Symbol("spec"), spec)
        setfield!(o, Symbol("spec"), spec)
        validate_property(IoK8sApiAppsV1beta2Scale, Symbol("status"), status)
        setfield!(o, Symbol("status"), status)
        o
    end
end # type IoK8sApiAppsV1beta2Scale

const _property_map_IoK8sApiAppsV1beta2Scale = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("spec")=>Symbol("spec"), Symbol("status")=>Symbol("status"))
const _property_types_IoK8sApiAppsV1beta2Scale = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiAppsV1beta2ScaleSpec", Symbol("status")=>"IoK8sApiAppsV1beta2ScaleStatus")
Base.propertynames(::Type{ IoK8sApiAppsV1beta2Scale }) = collect(keys(_property_map_IoK8sApiAppsV1beta2Scale))
Swagger.property_type(::Type{ IoK8sApiAppsV1beta2Scale }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1beta2Scale[name]))}
Swagger.field_name(::Type{ IoK8sApiAppsV1beta2Scale }, property_name::Symbol) =  _property_map_IoK8sApiAppsV1beta2Scale[property_name]

function check_required(o::IoK8sApiAppsV1beta2Scale)
    true
end

function validate_property(::Type{ IoK8sApiAppsV1beta2Scale }, name::Symbol, val)
end