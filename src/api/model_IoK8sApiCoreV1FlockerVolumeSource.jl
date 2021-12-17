# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""Represents a Flocker volume mounted by the Flocker agent. One and only one of datasetName and datasetUUID should be set. Flocker volumes do not support ownership management or SELinux relabeling.

    IoK8sApiCoreV1FlockerVolumeSource(;
        datasetName=nothing,
        datasetUUID=nothing,
    )

    - datasetName::String : Name of the dataset stored as metadata -&gt; name on the dataset for Flocker should be considered as deprecated
    - datasetUUID::String : UUID of the dataset. This is unique identifier of a Flocker dataset
"""
mutable struct IoK8sApiCoreV1FlockerVolumeSource <: SwaggerModel
    datasetName::Any # spec type: Union{ Nothing, String } # spec name: datasetName
    datasetUUID::Any # spec type: Union{ Nothing, String } # spec name: datasetUUID

    function IoK8sApiCoreV1FlockerVolumeSource(;datasetName=nothing, datasetUUID=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1FlockerVolumeSource, Symbol("datasetName"), datasetName)
        setfield!(o, Symbol("datasetName"), datasetName)
        validate_property(IoK8sApiCoreV1FlockerVolumeSource, Symbol("datasetUUID"), datasetUUID)
        setfield!(o, Symbol("datasetUUID"), datasetUUID)
        o
    end
end # type IoK8sApiCoreV1FlockerVolumeSource

const _property_map_IoK8sApiCoreV1FlockerVolumeSource = Dict{Symbol,Symbol}(Symbol("datasetName")=>Symbol("datasetName"), Symbol("datasetUUID")=>Symbol("datasetUUID"))
const _property_types_IoK8sApiCoreV1FlockerVolumeSource = Dict{Symbol,String}(Symbol("datasetName")=>"String", Symbol("datasetUUID")=>"String")
Base.propertynames(::Type{ IoK8sApiCoreV1FlockerVolumeSource }) = collect(keys(_property_map_IoK8sApiCoreV1FlockerVolumeSource))
Swagger.property_type(::Type{ IoK8sApiCoreV1FlockerVolumeSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1FlockerVolumeSource[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1FlockerVolumeSource }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1FlockerVolumeSource[property_name]

function check_required(o::IoK8sApiCoreV1FlockerVolumeSource)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1FlockerVolumeSource }, name::Symbol, val)
end
