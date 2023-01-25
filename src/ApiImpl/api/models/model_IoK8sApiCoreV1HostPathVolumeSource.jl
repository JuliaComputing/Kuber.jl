# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.HostPathVolumeSource
Represents a host path mapped into a pod. Host path volumes do not support ownership management or SELinux relabeling.

    IoK8sApiCoreV1HostPathVolumeSource(;
        path=nothing,
        type=nothing,
    )

    - path::String : Path of the directory on the host. If the path is a symlink, it will follow the link to the real path. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
    - type::String : Type for HostPath Volume Defaults to \&quot;\&quot; More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
"""
Base.@kwdef mutable struct IoK8sApiCoreV1HostPathVolumeSource <: OpenAPI.APIModel
    path::Union{Nothing, String} = nothing
    type::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1HostPathVolumeSource(path, type, )
        OpenAPI.validate_property(IoK8sApiCoreV1HostPathVolumeSource, Symbol("path"), path)
        OpenAPI.validate_property(IoK8sApiCoreV1HostPathVolumeSource, Symbol("type"), type)
        return new(path, type, )
    end
end # type IoK8sApiCoreV1HostPathVolumeSource

const _property_types_IoK8sApiCoreV1HostPathVolumeSource = Dict{Symbol,String}(Symbol("path")=>"String", Symbol("type")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1HostPathVolumeSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1HostPathVolumeSource[name]))}

function check_required(o::IoK8sApiCoreV1HostPathVolumeSource)
    o.path === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1HostPathVolumeSource }, name::Symbol, val)
end