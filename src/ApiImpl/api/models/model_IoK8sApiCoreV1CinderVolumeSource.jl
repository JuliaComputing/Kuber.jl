# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.CinderVolumeSource
Represents a cinder volume resource in Openstack. A Cinder volume must exist before mounting to a container. The volume must also be in the same region as the kubelet. Cinder volumes support ownership management and SELinux relabeling.

    IoK8sApiCoreV1CinderVolumeSource(;
        fsType=nothing,
        readOnly=nothing,
        secretRef=nothing,
        volumeID=nothing,
    )

    - fsType::String : Filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: \&quot;ext4\&quot;, \&quot;xfs\&quot;, \&quot;ntfs\&quot;. Implicitly inferred to be \&quot;ext4\&quot; if unspecified. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    - readOnly::Bool : Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    - secretRef::IoK8sApiCoreV1LocalObjectReference
    - volumeID::String : volume id used to identify the volume in cinder. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
"""
Base.@kwdef mutable struct IoK8sApiCoreV1CinderVolumeSource <: OpenAPI.APIModel
    fsType::Union{Nothing, String} = nothing
    readOnly::Union{Nothing, Bool} = nothing
    secretRef = nothing # spec type: Union{ Nothing, IoK8sApiCoreV1LocalObjectReference }
    volumeID::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1CinderVolumeSource(fsType, readOnly, secretRef, volumeID, )
        OpenAPI.validate_property(IoK8sApiCoreV1CinderVolumeSource, Symbol("fsType"), fsType)
        OpenAPI.validate_property(IoK8sApiCoreV1CinderVolumeSource, Symbol("readOnly"), readOnly)
        OpenAPI.validate_property(IoK8sApiCoreV1CinderVolumeSource, Symbol("secretRef"), secretRef)
        OpenAPI.validate_property(IoK8sApiCoreV1CinderVolumeSource, Symbol("volumeID"), volumeID)
        return new(fsType, readOnly, secretRef, volumeID, )
    end
end # type IoK8sApiCoreV1CinderVolumeSource

const _property_types_IoK8sApiCoreV1CinderVolumeSource = Dict{Symbol,String}(Symbol("fsType")=>"String", Symbol("readOnly")=>"Bool", Symbol("secretRef")=>"IoK8sApiCoreV1LocalObjectReference", Symbol("volumeID")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1CinderVolumeSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1CinderVolumeSource[name]))}

function check_required(o::IoK8sApiCoreV1CinderVolumeSource)
    o.volumeID === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1CinderVolumeSource }, name::Symbol, val)
end