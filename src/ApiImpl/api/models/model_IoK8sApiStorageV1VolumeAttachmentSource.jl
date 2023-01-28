# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.storage.v1.VolumeAttachmentSource
VolumeAttachmentSource represents a volume that should be attached. Right now only PersistenVolumes can be attached via external attacher, in future we may allow also inline volumes in pods. Exactly one member can be set.

    IoK8sApiStorageV1VolumeAttachmentSource(;
        inlineVolumeSpec=nothing,
        persistentVolumeName=nothing,
    )

    - inlineVolumeSpec::IoK8sApiCoreV1PersistentVolumeSpec
    - persistentVolumeName::String : Name of the persistent volume to attach.
"""
Base.@kwdef mutable struct IoK8sApiStorageV1VolumeAttachmentSource <: OpenAPI.APIModel
    inlineVolumeSpec = nothing # spec type: Union{ Nothing, IoK8sApiCoreV1PersistentVolumeSpec }
    persistentVolumeName::Union{Nothing, String} = nothing

    function IoK8sApiStorageV1VolumeAttachmentSource(inlineVolumeSpec, persistentVolumeName, )
        OpenAPI.validate_property(IoK8sApiStorageV1VolumeAttachmentSource, Symbol("inlineVolumeSpec"), inlineVolumeSpec)
        OpenAPI.validate_property(IoK8sApiStorageV1VolumeAttachmentSource, Symbol("persistentVolumeName"), persistentVolumeName)
        return new(inlineVolumeSpec, persistentVolumeName, )
    end
end # type IoK8sApiStorageV1VolumeAttachmentSource

const _property_types_IoK8sApiStorageV1VolumeAttachmentSource = Dict{Symbol,String}(Symbol("inlineVolumeSpec")=>"IoK8sApiCoreV1PersistentVolumeSpec", Symbol("persistentVolumeName")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiStorageV1VolumeAttachmentSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiStorageV1VolumeAttachmentSource[name]))}

function check_required(o::IoK8sApiStorageV1VolumeAttachmentSource)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiStorageV1VolumeAttachmentSource }, name::Symbol, val)
end
