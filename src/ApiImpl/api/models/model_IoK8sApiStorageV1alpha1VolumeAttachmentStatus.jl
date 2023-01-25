# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.storage.v1alpha1.VolumeAttachmentStatus
VolumeAttachmentStatus is the status of a VolumeAttachment request.

    IoK8sApiStorageV1alpha1VolumeAttachmentStatus(;
        attachError=nothing,
        attached=nothing,
        attachmentMetadata=nothing,
        detachError=nothing,
    )

    - attachError::IoK8sApiStorageV1alpha1VolumeError
    - attached::Bool : Indicates the volume is successfully attached. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
    - attachmentMetadata::Dict{String, String} : Upon successful attach, this field is populated with any information returned by the attach operation that must be passed into subsequent WaitForAttach or Mount calls. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
    - detachError::IoK8sApiStorageV1alpha1VolumeError
"""
Base.@kwdef mutable struct IoK8sApiStorageV1alpha1VolumeAttachmentStatus <: OpenAPI.APIModel
    attachError = nothing # spec type: Union{ Nothing, IoK8sApiStorageV1alpha1VolumeError }
    attached::Union{Nothing, Bool} = nothing
    attachmentMetadata::Union{Nothing, Dict{String, String}} = nothing
    detachError = nothing # spec type: Union{ Nothing, IoK8sApiStorageV1alpha1VolumeError }

    function IoK8sApiStorageV1alpha1VolumeAttachmentStatus(attachError, attached, attachmentMetadata, detachError, )
        OpenAPI.validate_property(IoK8sApiStorageV1alpha1VolumeAttachmentStatus, Symbol("attachError"), attachError)
        OpenAPI.validate_property(IoK8sApiStorageV1alpha1VolumeAttachmentStatus, Symbol("attached"), attached)
        OpenAPI.validate_property(IoK8sApiStorageV1alpha1VolumeAttachmentStatus, Symbol("attachmentMetadata"), attachmentMetadata)
        OpenAPI.validate_property(IoK8sApiStorageV1alpha1VolumeAttachmentStatus, Symbol("detachError"), detachError)
        return new(attachError, attached, attachmentMetadata, detachError, )
    end
end # type IoK8sApiStorageV1alpha1VolumeAttachmentStatus

const _property_types_IoK8sApiStorageV1alpha1VolumeAttachmentStatus = Dict{Symbol,String}(Symbol("attachError")=>"IoK8sApiStorageV1alpha1VolumeError", Symbol("attached")=>"Bool", Symbol("attachmentMetadata")=>"Dict{String, String}", Symbol("detachError")=>"IoK8sApiStorageV1alpha1VolumeError", )
OpenAPI.property_type(::Type{ IoK8sApiStorageV1alpha1VolumeAttachmentStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiStorageV1alpha1VolumeAttachmentStatus[name]))}

function check_required(o::IoK8sApiStorageV1alpha1VolumeAttachmentStatus)
    o.attached === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiStorageV1alpha1VolumeAttachmentStatus }, name::Symbol, val)
end