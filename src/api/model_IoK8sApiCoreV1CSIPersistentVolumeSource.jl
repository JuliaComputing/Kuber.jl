# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiCoreV1CSIPersistentVolumeSource <: SwaggerModel
    controllerExpandSecretRef::Any # spec type: Union{ Nothing, IoK8sApiCoreV1SecretReference } # spec name: controllerExpandSecretRef
    controllerPublishSecretRef::Any # spec type: Union{ Nothing, IoK8sApiCoreV1SecretReference } # spec name: controllerPublishSecretRef
    driver::Any # spec type: Union{ Nothing, String } # spec name: driver
    fsType::Any # spec type: Union{ Nothing, String } # spec name: fsType
    nodePublishSecretRef::Any # spec type: Union{ Nothing, IoK8sApiCoreV1SecretReference } # spec name: nodePublishSecretRef
    nodeStageSecretRef::Any # spec type: Union{ Nothing, IoK8sApiCoreV1SecretReference } # spec name: nodeStageSecretRef
    readOnly::Any # spec type: Union{ Nothing, Bool } # spec name: readOnly
    volumeAttributes::Any # spec type: Union{ Nothing, Dict{String, String} } # spec name: volumeAttributes
    volumeHandle::Any # spec type: Union{ Nothing, String } # spec name: volumeHandle

    function IoK8sApiCoreV1CSIPersistentVolumeSource(;controllerExpandSecretRef=nothing, controllerPublishSecretRef=nothing, driver=nothing, fsType=nothing, nodePublishSecretRef=nothing, nodeStageSecretRef=nothing, readOnly=nothing, volumeAttributes=nothing, volumeHandle=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1CSIPersistentVolumeSource, Symbol("controllerExpandSecretRef"), controllerExpandSecretRef)
        setfield!(o, Symbol("controllerExpandSecretRef"), controllerExpandSecretRef)
        validate_property(IoK8sApiCoreV1CSIPersistentVolumeSource, Symbol("controllerPublishSecretRef"), controllerPublishSecretRef)
        setfield!(o, Symbol("controllerPublishSecretRef"), controllerPublishSecretRef)
        validate_property(IoK8sApiCoreV1CSIPersistentVolumeSource, Symbol("driver"), driver)
        setfield!(o, Symbol("driver"), driver)
        validate_property(IoK8sApiCoreV1CSIPersistentVolumeSource, Symbol("fsType"), fsType)
        setfield!(o, Symbol("fsType"), fsType)
        validate_property(IoK8sApiCoreV1CSIPersistentVolumeSource, Symbol("nodePublishSecretRef"), nodePublishSecretRef)
        setfield!(o, Symbol("nodePublishSecretRef"), nodePublishSecretRef)
        validate_property(IoK8sApiCoreV1CSIPersistentVolumeSource, Symbol("nodeStageSecretRef"), nodeStageSecretRef)
        setfield!(o, Symbol("nodeStageSecretRef"), nodeStageSecretRef)
        validate_property(IoK8sApiCoreV1CSIPersistentVolumeSource, Symbol("readOnly"), readOnly)
        setfield!(o, Symbol("readOnly"), readOnly)
        validate_property(IoK8sApiCoreV1CSIPersistentVolumeSource, Symbol("volumeAttributes"), volumeAttributes)
        setfield!(o, Symbol("volumeAttributes"), volumeAttributes)
        validate_property(IoK8sApiCoreV1CSIPersistentVolumeSource, Symbol("volumeHandle"), volumeHandle)
        setfield!(o, Symbol("volumeHandle"), volumeHandle)
        o
    end
end # type IoK8sApiCoreV1CSIPersistentVolumeSource

const _property_map_IoK8sApiCoreV1CSIPersistentVolumeSource = Dict{Symbol,Symbol}(Symbol("controllerExpandSecretRef")=>Symbol("controllerExpandSecretRef"), Symbol("controllerPublishSecretRef")=>Symbol("controllerPublishSecretRef"), Symbol("driver")=>Symbol("driver"), Symbol("fsType")=>Symbol("fsType"), Symbol("nodePublishSecretRef")=>Symbol("nodePublishSecretRef"), Symbol("nodeStageSecretRef")=>Symbol("nodeStageSecretRef"), Symbol("readOnly")=>Symbol("readOnly"), Symbol("volumeAttributes")=>Symbol("volumeAttributes"), Symbol("volumeHandle")=>Symbol("volumeHandle"))
const _property_types_IoK8sApiCoreV1CSIPersistentVolumeSource = Dict{Symbol,String}(Symbol("controllerExpandSecretRef")=>"IoK8sApiCoreV1SecretReference", Symbol("controllerPublishSecretRef")=>"IoK8sApiCoreV1SecretReference", Symbol("driver")=>"String", Symbol("fsType")=>"String", Symbol("nodePublishSecretRef")=>"IoK8sApiCoreV1SecretReference", Symbol("nodeStageSecretRef")=>"IoK8sApiCoreV1SecretReference", Symbol("readOnly")=>"Bool", Symbol("volumeAttributes")=>"Dict{String, String}", Symbol("volumeHandle")=>"String")
Base.propertynames(::Type{ IoK8sApiCoreV1CSIPersistentVolumeSource }) = collect(keys(_property_map_IoK8sApiCoreV1CSIPersistentVolumeSource))
Swagger.property_type(::Type{ IoK8sApiCoreV1CSIPersistentVolumeSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1CSIPersistentVolumeSource[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1CSIPersistentVolumeSource }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1CSIPersistentVolumeSource[property_name]

function check_required(o::IoK8sApiCoreV1CSIPersistentVolumeSource)
    (getproperty(o, Symbol("driver")) === nothing) && (return false)
    (getproperty(o, Symbol("volumeHandle")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1CSIPersistentVolumeSource }, name::Symbol, val)
end
