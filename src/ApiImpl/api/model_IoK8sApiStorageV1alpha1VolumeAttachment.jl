# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""VolumeAttachment captures the intent to attach or detach the specified volume to/from the specified node.  VolumeAttachment objects are non-namespaced.

    IoK8sApiStorageV1alpha1VolumeAttachment(;
        apiVersion=nothing,
        kind=nothing,
        metadata=nothing,
        spec=nothing,
        status=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta : Standard object metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    - spec::IoK8sApiStorageV1alpha1VolumeAttachmentSpec : Specification of the desired attach/detach volume behavior. Populated by the Kubernetes system.
    - status::IoK8sApiStorageV1alpha1VolumeAttachmentStatus : Status of the VolumeAttachment request. Populated by the entity completing the attach or detach operation, i.e. the external-attacher.
"""
mutable struct IoK8sApiStorageV1alpha1VolumeAttachment <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    spec::Any # spec type: Union{ Nothing, IoK8sApiStorageV1alpha1VolumeAttachmentSpec } # spec name: spec
    status::Any # spec type: Union{ Nothing, IoK8sApiStorageV1alpha1VolumeAttachmentStatus } # spec name: status

    function IoK8sApiStorageV1alpha1VolumeAttachment(;apiVersion=nothing, kind=nothing, metadata=nothing, spec=nothing, status=nothing)
        o = new()
        validate_property(IoK8sApiStorageV1alpha1VolumeAttachment, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiStorageV1alpha1VolumeAttachment, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiStorageV1alpha1VolumeAttachment, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiStorageV1alpha1VolumeAttachment, Symbol("spec"), spec)
        setfield!(o, Symbol("spec"), spec)
        validate_property(IoK8sApiStorageV1alpha1VolumeAttachment, Symbol("status"), status)
        setfield!(o, Symbol("status"), status)
        o
    end
end # type IoK8sApiStorageV1alpha1VolumeAttachment

const _property_map_IoK8sApiStorageV1alpha1VolumeAttachment = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("spec")=>Symbol("spec"), Symbol("status")=>Symbol("status"))
const _property_types_IoK8sApiStorageV1alpha1VolumeAttachment = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiStorageV1alpha1VolumeAttachmentSpec", Symbol("status")=>"IoK8sApiStorageV1alpha1VolumeAttachmentStatus")
Base.propertynames(::Type{ IoK8sApiStorageV1alpha1VolumeAttachment }) = collect(keys(_property_map_IoK8sApiStorageV1alpha1VolumeAttachment))
Swagger.property_type(::Type{ IoK8sApiStorageV1alpha1VolumeAttachment }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiStorageV1alpha1VolumeAttachment[name]))}
Swagger.field_name(::Type{ IoK8sApiStorageV1alpha1VolumeAttachment }, property_name::Symbol) =  _property_map_IoK8sApiStorageV1alpha1VolumeAttachment[property_name]

function check_required(o::IoK8sApiStorageV1alpha1VolumeAttachment)
    (getproperty(o, Symbol("spec")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiStorageV1alpha1VolumeAttachment }, name::Symbol, val)
end