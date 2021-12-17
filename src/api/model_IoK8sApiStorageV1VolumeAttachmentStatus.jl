# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""VolumeAttachmentStatus is the status of a VolumeAttachment request.

    IoK8sApiStorageV1VolumeAttachmentStatus(;
        attachError=nothing,
        attached=nothing,
        attachmentMetadata=nothing,
        detachError=nothing,
    )

    - attachError::IoK8sApiStorageV1VolumeError : The last error encountered during attach operation, if any. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
    - attached::Bool : Indicates the volume is successfully attached. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
    - attachmentMetadata::Dict{String, String} : Upon successful attach, this field is populated with any information returned by the attach operation that must be passed into subsequent WaitForAttach or Mount calls. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
    - detachError::IoK8sApiStorageV1VolumeError : The last error encountered during detach operation, if any. This field must only be set by the entity completing the detach operation, i.e. the external-attacher.
"""
mutable struct IoK8sApiStorageV1VolumeAttachmentStatus <: SwaggerModel
    attachError::Any # spec type: Union{ Nothing, IoK8sApiStorageV1VolumeError } # spec name: attachError
    attached::Any # spec type: Union{ Nothing, Bool } # spec name: attached
    attachmentMetadata::Any # spec type: Union{ Nothing, Dict{String, String} } # spec name: attachmentMetadata
    detachError::Any # spec type: Union{ Nothing, IoK8sApiStorageV1VolumeError } # spec name: detachError

    function IoK8sApiStorageV1VolumeAttachmentStatus(;attachError=nothing, attached=nothing, attachmentMetadata=nothing, detachError=nothing)
        o = new()
        validate_property(IoK8sApiStorageV1VolumeAttachmentStatus, Symbol("attachError"), attachError)
        setfield!(o, Symbol("attachError"), attachError)
        validate_property(IoK8sApiStorageV1VolumeAttachmentStatus, Symbol("attached"), attached)
        setfield!(o, Symbol("attached"), attached)
        validate_property(IoK8sApiStorageV1VolumeAttachmentStatus, Symbol("attachmentMetadata"), attachmentMetadata)
        setfield!(o, Symbol("attachmentMetadata"), attachmentMetadata)
        validate_property(IoK8sApiStorageV1VolumeAttachmentStatus, Symbol("detachError"), detachError)
        setfield!(o, Symbol("detachError"), detachError)
        o
    end
end # type IoK8sApiStorageV1VolumeAttachmentStatus

const _property_map_IoK8sApiStorageV1VolumeAttachmentStatus = Dict{Symbol,Symbol}(Symbol("attachError")=>Symbol("attachError"), Symbol("attached")=>Symbol("attached"), Symbol("attachmentMetadata")=>Symbol("attachmentMetadata"), Symbol("detachError")=>Symbol("detachError"))
const _property_types_IoK8sApiStorageV1VolumeAttachmentStatus = Dict{Symbol,String}(Symbol("attachError")=>"IoK8sApiStorageV1VolumeError", Symbol("attached")=>"Bool", Symbol("attachmentMetadata")=>"Dict{String, String}", Symbol("detachError")=>"IoK8sApiStorageV1VolumeError")
Base.propertynames(::Type{ IoK8sApiStorageV1VolumeAttachmentStatus }) = collect(keys(_property_map_IoK8sApiStorageV1VolumeAttachmentStatus))
Swagger.property_type(::Type{ IoK8sApiStorageV1VolumeAttachmentStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiStorageV1VolumeAttachmentStatus[name]))}
Swagger.field_name(::Type{ IoK8sApiStorageV1VolumeAttachmentStatus }, property_name::Symbol) =  _property_map_IoK8sApiStorageV1VolumeAttachmentStatus[property_name]

function check_required(o::IoK8sApiStorageV1VolumeAttachmentStatus)
    (getproperty(o, Symbol("attached")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiStorageV1VolumeAttachmentStatus }, name::Symbol, val)
end
