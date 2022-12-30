# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.CephFSPersistentVolumeSource
Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not support ownership management or SELinux relabeling.

    IoK8sApiCoreV1CephFSPersistentVolumeSource(;
        monitors=nothing,
        path=nothing,
        readOnly=nothing,
        secretFile=nothing,
        secretRef=nothing,
        user=nothing,
    )

    - monitors::Vector{String} : Required: Monitors is a collection of Ceph monitors More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    - path::String : Optional: Used as the mounted root, rather than the full Ceph tree, default is /
    - readOnly::Bool : Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    - secretFile::String : Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    - secretRef::IoK8sApiCoreV1SecretReference
    - user::String : Optional: User is the rados user name, default is admin More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
"""
Base.@kwdef mutable struct IoK8sApiCoreV1CephFSPersistentVolumeSource <: OpenAPI.APIModel
    monitors::Union{Nothing, Vector{String}} = nothing
    path::Union{Nothing, String} = nothing
    readOnly::Union{Nothing, Bool} = nothing
    secretFile::Union{Nothing, String} = nothing
    secretRef = nothing # spec type: Union{ Nothing, IoK8sApiCoreV1SecretReference }
    user::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1CephFSPersistentVolumeSource(monitors, path, readOnly, secretFile, secretRef, user, )
        OpenAPI.validate_property(IoK8sApiCoreV1CephFSPersistentVolumeSource, Symbol("monitors"), monitors)
        OpenAPI.validate_property(IoK8sApiCoreV1CephFSPersistentVolumeSource, Symbol("path"), path)
        OpenAPI.validate_property(IoK8sApiCoreV1CephFSPersistentVolumeSource, Symbol("readOnly"), readOnly)
        OpenAPI.validate_property(IoK8sApiCoreV1CephFSPersistentVolumeSource, Symbol("secretFile"), secretFile)
        OpenAPI.validate_property(IoK8sApiCoreV1CephFSPersistentVolumeSource, Symbol("secretRef"), secretRef)
        OpenAPI.validate_property(IoK8sApiCoreV1CephFSPersistentVolumeSource, Symbol("user"), user)
        return new(monitors, path, readOnly, secretFile, secretRef, user, )
    end
end # type IoK8sApiCoreV1CephFSPersistentVolumeSource

const _property_types_IoK8sApiCoreV1CephFSPersistentVolumeSource = Dict{Symbol,String}(Symbol("monitors")=>"Vector{String}", Symbol("path")=>"String", Symbol("readOnly")=>"Bool", Symbol("secretFile")=>"String", Symbol("secretRef")=>"IoK8sApiCoreV1SecretReference", Symbol("user")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1CephFSPersistentVolumeSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1CephFSPersistentVolumeSource[name]))}

function check_required(o::IoK8sApiCoreV1CephFSPersistentVolumeSource)
    o.monitors === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1CephFSPersistentVolumeSource }, name::Symbol, val)
end
