# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.GlusterfsVolumeSource
Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not support ownership management or SELinux relabeling.

    IoK8sApiCoreV1GlusterfsVolumeSource(;
        endpoints=nothing,
        path=nothing,
        readOnly=nothing,
    )

    - endpoints::String : EndpointsName is the endpoint name that details Glusterfs topology. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
    - path::String : Path is the Glusterfs volume path. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
    - readOnly::Bool : ReadOnly here will force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
"""
Base.@kwdef mutable struct IoK8sApiCoreV1GlusterfsVolumeSource <: OpenAPI.APIModel
    endpoints::Union{Nothing, String} = nothing
    path::Union{Nothing, String} = nothing
    readOnly::Union{Nothing, Bool} = nothing

    function IoK8sApiCoreV1GlusterfsVolumeSource(endpoints, path, readOnly, )
        OpenAPI.validate_property(IoK8sApiCoreV1GlusterfsVolumeSource, Symbol("endpoints"), endpoints)
        OpenAPI.validate_property(IoK8sApiCoreV1GlusterfsVolumeSource, Symbol("path"), path)
        OpenAPI.validate_property(IoK8sApiCoreV1GlusterfsVolumeSource, Symbol("readOnly"), readOnly)
        return new(endpoints, path, readOnly, )
    end
end # type IoK8sApiCoreV1GlusterfsVolumeSource

const _property_types_IoK8sApiCoreV1GlusterfsVolumeSource = Dict{Symbol,String}(Symbol("endpoints")=>"String", Symbol("path")=>"String", Symbol("readOnly")=>"Bool", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1GlusterfsVolumeSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1GlusterfsVolumeSource[name]))}

function check_required(o::IoK8sApiCoreV1GlusterfsVolumeSource)
    o.endpoints === nothing && (return false)
    o.path === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1GlusterfsVolumeSource }, name::Symbol, val)
end
