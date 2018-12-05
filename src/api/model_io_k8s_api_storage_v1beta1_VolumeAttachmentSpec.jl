# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.

mutable struct IoK8sApiStorageV1beta1VolumeAttachmentSpec <: SwaggerModel
    attacher::Union{ Nothing, String } # attacher
    nodeName::Union{ Nothing, String } # nodeName
    source::Union{ Nothing, IoK8sApiStorageV1beta1VolumeAttachmentSource } # source

    function IoK8sApiStorageV1beta1VolumeAttachmentSpec(;attacher=nothing, nodeName=nothing, source=nothing)
        o = new()
        set_field!(o, :attacher, attacher)
        set_field!(o, :nodeName, nodeName)
        set_field!(o, :source, source)
        o
    end
end # type IoK8sApiStorageV1beta1VolumeAttachmentSpec

const _name_map_IoK8sApiStorageV1beta1VolumeAttachmentSpec = Dict{String,Symbol}(["attacher"=>:attacher, "nodeName"=>:nodeName, "source"=>:source])
const _field_map_IoK8sApiStorageV1beta1VolumeAttachmentSpec = Dict{Symbol,String}([:attacher=>"attacher", :nodeName=>"nodeName", :source=>"source"])
Swagger.name_map(::Type{ IoK8sApiStorageV1beta1VolumeAttachmentSpec }) = _name_map_IoK8sApiStorageV1beta1VolumeAttachmentSpec
Swagger.field_map(::Type{ IoK8sApiStorageV1beta1VolumeAttachmentSpec }) = _field_map_IoK8sApiStorageV1beta1VolumeAttachmentSpec

function check_required(o::IoK8sApiStorageV1beta1VolumeAttachmentSpec)
    (o.attacher === nothing) && (return false)
    (o.nodeName === nothing) && (return false)
    (o.source === nothing) && (return false)
    true
end

function validate_field(o::IoK8sApiStorageV1beta1VolumeAttachmentSpec, name::Symbol, val)
end
