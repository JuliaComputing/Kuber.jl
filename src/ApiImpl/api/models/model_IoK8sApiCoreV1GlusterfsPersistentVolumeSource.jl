# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.GlusterfsPersistentVolumeSource
Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not support ownership management or SELinux relabeling.

    IoK8sApiCoreV1GlusterfsPersistentVolumeSource(;
        endpoints=nothing,
        endpointsNamespace=nothing,
        path=nothing,
        readOnly=nothing,
    )

    - endpoints::String : EndpointsName is the endpoint name that details Glusterfs topology. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
    - endpointsNamespace::String : EndpointsNamespace is the namespace that contains Glusterfs endpoint. If this field is empty, the EndpointNamespace defaults to the same namespace as the bound PVC. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
    - path::String : Path is the Glusterfs volume path. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
    - readOnly::Bool : ReadOnly here will force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
"""
Base.@kwdef mutable struct IoK8sApiCoreV1GlusterfsPersistentVolumeSource <: OpenAPI.APIModel
    endpoints::Union{Nothing, String} = nothing
    endpointsNamespace::Union{Nothing, String} = nothing
    path::Union{Nothing, String} = nothing
    readOnly::Union{Nothing, Bool} = nothing

    function IoK8sApiCoreV1GlusterfsPersistentVolumeSource(endpoints, endpointsNamespace, path, readOnly, )
        OpenAPI.validate_property(IoK8sApiCoreV1GlusterfsPersistentVolumeSource, Symbol("endpoints"), endpoints)
        OpenAPI.validate_property(IoK8sApiCoreV1GlusterfsPersistentVolumeSource, Symbol("endpointsNamespace"), endpointsNamespace)
        OpenAPI.validate_property(IoK8sApiCoreV1GlusterfsPersistentVolumeSource, Symbol("path"), path)
        OpenAPI.validate_property(IoK8sApiCoreV1GlusterfsPersistentVolumeSource, Symbol("readOnly"), readOnly)
        return new(endpoints, endpointsNamespace, path, readOnly, )
    end
end # type IoK8sApiCoreV1GlusterfsPersistentVolumeSource

const _property_types_IoK8sApiCoreV1GlusterfsPersistentVolumeSource = Dict{Symbol,String}(Symbol("endpoints")=>"String", Symbol("endpointsNamespace")=>"String", Symbol("path")=>"String", Symbol("readOnly")=>"Bool", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1GlusterfsPersistentVolumeSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1GlusterfsPersistentVolumeSource[name]))}

function check_required(o::IoK8sApiCoreV1GlusterfsPersistentVolumeSource)
    o.endpoints === nothing && (return false)
    o.path === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1GlusterfsPersistentVolumeSource }, name::Symbol, val)
end
