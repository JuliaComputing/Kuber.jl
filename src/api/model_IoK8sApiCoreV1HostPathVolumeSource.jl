# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""Represents a host path mapped into a pod. Host path volumes do not support ownership management or SELinux relabeling.

    IoK8sApiCoreV1HostPathVolumeSource(;
        path=nothing,
        type=nothing,
    )

    - path::String : Path of the directory on the host. If the path is a symlink, it will follow the link to the real path. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
    - type::String : Type for HostPath Volume Defaults to \&quot;\&quot; More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
"""
mutable struct IoK8sApiCoreV1HostPathVolumeSource <: SwaggerModel
    path::Any # spec type: Union{ Nothing, String } # spec name: path
    type::Any # spec type: Union{ Nothing, String } # spec name: type

    function IoK8sApiCoreV1HostPathVolumeSource(;path=nothing, type=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1HostPathVolumeSource, Symbol("path"), path)
        setfield!(o, Symbol("path"), path)
        validate_property(IoK8sApiCoreV1HostPathVolumeSource, Symbol("type"), type)
        setfield!(o, Symbol("type"), type)
        o
    end
end # type IoK8sApiCoreV1HostPathVolumeSource

const _property_map_IoK8sApiCoreV1HostPathVolumeSource = Dict{Symbol,Symbol}(Symbol("path")=>Symbol("path"), Symbol("type")=>Symbol("type"))
const _property_types_IoK8sApiCoreV1HostPathVolumeSource = Dict{Symbol,String}(Symbol("path")=>"String", Symbol("type")=>"String")
Base.propertynames(::Type{ IoK8sApiCoreV1HostPathVolumeSource }) = collect(keys(_property_map_IoK8sApiCoreV1HostPathVolumeSource))
Swagger.property_type(::Type{ IoK8sApiCoreV1HostPathVolumeSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1HostPathVolumeSource[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1HostPathVolumeSource }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1HostPathVolumeSource[property_name]

function check_required(o::IoK8sApiCoreV1HostPathVolumeSource)
    (getproperty(o, Symbol("path")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1HostPathVolumeSource }, name::Symbol, val)
end
