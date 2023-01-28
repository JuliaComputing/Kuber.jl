# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.AzureFileVolumeSource
AzureFile represents an Azure File Service mount on the host and bind mount to the pod.

    IoK8sApiCoreV1AzureFileVolumeSource(;
        readOnly=nothing,
        secretName=nothing,
        shareName=nothing,
    )

    - readOnly::Bool : Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    - secretName::String : the name of secret that contains Azure Storage Account Name and Key
    - shareName::String : Share Name
"""
Base.@kwdef mutable struct IoK8sApiCoreV1AzureFileVolumeSource <: OpenAPI.APIModel
    readOnly::Union{Nothing, Bool} = nothing
    secretName::Union{Nothing, String} = nothing
    shareName::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1AzureFileVolumeSource(readOnly, secretName, shareName, )
        OpenAPI.validate_property(IoK8sApiCoreV1AzureFileVolumeSource, Symbol("readOnly"), readOnly)
        OpenAPI.validate_property(IoK8sApiCoreV1AzureFileVolumeSource, Symbol("secretName"), secretName)
        OpenAPI.validate_property(IoK8sApiCoreV1AzureFileVolumeSource, Symbol("shareName"), shareName)
        return new(readOnly, secretName, shareName, )
    end
end # type IoK8sApiCoreV1AzureFileVolumeSource

const _property_types_IoK8sApiCoreV1AzureFileVolumeSource = Dict{Symbol,String}(Symbol("readOnly")=>"Bool", Symbol("secretName")=>"String", Symbol("shareName")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1AzureFileVolumeSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1AzureFileVolumeSource[name]))}

function check_required(o::IoK8sApiCoreV1AzureFileVolumeSource)
    o.secretName === nothing && (return false)
    o.shareName === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1AzureFileVolumeSource }, name::Symbol, val)
end
