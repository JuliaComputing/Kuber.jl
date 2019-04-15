# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiCoreV1ISCSIPersistentVolumeSource <: SwaggerModel
    chapAuthDiscovery::Any # spec type: Union{ Nothing, Bool } # spec name: chapAuthDiscovery
    chapAuthSession::Any # spec type: Union{ Nothing, Bool } # spec name: chapAuthSession
    fsType::Any # spec type: Union{ Nothing, String } # spec name: fsType
    initiatorName::Any # spec type: Union{ Nothing, String } # spec name: initiatorName
    iqn::Any # spec type: Union{ Nothing, String } # spec name: iqn
    iscsiInterface::Any # spec type: Union{ Nothing, String } # spec name: iscsiInterface
    lun::Any # spec type: Union{ Nothing, Int32 } # spec name: lun
    portals::Any # spec type: Union{ Nothing, Vector{String} } # spec name: portals
    readOnly::Any # spec type: Union{ Nothing, Bool } # spec name: readOnly
    secretRef::Any # spec type: Union{ Nothing, IoK8sApiCoreV1SecretReference } # spec name: secretRef
    targetPortal::Any # spec type: Union{ Nothing, String } # spec name: targetPortal

    function IoK8sApiCoreV1ISCSIPersistentVolumeSource(;chapAuthDiscovery=nothing, chapAuthSession=nothing, fsType=nothing, initiatorName=nothing, iqn=nothing, iscsiInterface=nothing, lun=nothing, portals=nothing, readOnly=nothing, secretRef=nothing, targetPortal=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1ISCSIPersistentVolumeSource, Symbol("chapAuthDiscovery"), chapAuthDiscovery)
        setfield!(o, Symbol("chapAuthDiscovery"), chapAuthDiscovery)
        validate_property(IoK8sApiCoreV1ISCSIPersistentVolumeSource, Symbol("chapAuthSession"), chapAuthSession)
        setfield!(o, Symbol("chapAuthSession"), chapAuthSession)
        validate_property(IoK8sApiCoreV1ISCSIPersistentVolumeSource, Symbol("fsType"), fsType)
        setfield!(o, Symbol("fsType"), fsType)
        validate_property(IoK8sApiCoreV1ISCSIPersistentVolumeSource, Symbol("initiatorName"), initiatorName)
        setfield!(o, Symbol("initiatorName"), initiatorName)
        validate_property(IoK8sApiCoreV1ISCSIPersistentVolumeSource, Symbol("iqn"), iqn)
        setfield!(o, Symbol("iqn"), iqn)
        validate_property(IoK8sApiCoreV1ISCSIPersistentVolumeSource, Symbol("iscsiInterface"), iscsiInterface)
        setfield!(o, Symbol("iscsiInterface"), iscsiInterface)
        validate_property(IoK8sApiCoreV1ISCSIPersistentVolumeSource, Symbol("lun"), lun)
        setfield!(o, Symbol("lun"), lun)
        validate_property(IoK8sApiCoreV1ISCSIPersistentVolumeSource, Symbol("portals"), portals)
        setfield!(o, Symbol("portals"), portals)
        validate_property(IoK8sApiCoreV1ISCSIPersistentVolumeSource, Symbol("readOnly"), readOnly)
        setfield!(o, Symbol("readOnly"), readOnly)
        validate_property(IoK8sApiCoreV1ISCSIPersistentVolumeSource, Symbol("secretRef"), secretRef)
        setfield!(o, Symbol("secretRef"), secretRef)
        validate_property(IoK8sApiCoreV1ISCSIPersistentVolumeSource, Symbol("targetPortal"), targetPortal)
        setfield!(o, Symbol("targetPortal"), targetPortal)
        o
    end
end # type IoK8sApiCoreV1ISCSIPersistentVolumeSource

const _property_map_IoK8sApiCoreV1ISCSIPersistentVolumeSource = Dict{Symbol,Symbol}(Symbol("chapAuthDiscovery")=>Symbol("chapAuthDiscovery"), Symbol("chapAuthSession")=>Symbol("chapAuthSession"), Symbol("fsType")=>Symbol("fsType"), Symbol("initiatorName")=>Symbol("initiatorName"), Symbol("iqn")=>Symbol("iqn"), Symbol("iscsiInterface")=>Symbol("iscsiInterface"), Symbol("lun")=>Symbol("lun"), Symbol("portals")=>Symbol("portals"), Symbol("readOnly")=>Symbol("readOnly"), Symbol("secretRef")=>Symbol("secretRef"), Symbol("targetPortal")=>Symbol("targetPortal"))
const _property_types_IoK8sApiCoreV1ISCSIPersistentVolumeSource = Dict{Symbol,String}(Symbol("chapAuthDiscovery")=>"Bool", Symbol("chapAuthSession")=>"Bool", Symbol("fsType")=>"String", Symbol("initiatorName")=>"String", Symbol("iqn")=>"String", Symbol("iscsiInterface")=>"String", Symbol("lun")=>"Int32", Symbol("portals")=>"Vector{String}", Symbol("readOnly")=>"Bool", Symbol("secretRef")=>"IoK8sApiCoreV1SecretReference", Symbol("targetPortal")=>"String")
Base.propertynames(::Type{ IoK8sApiCoreV1ISCSIPersistentVolumeSource }) = collect(keys(_property_map_IoK8sApiCoreV1ISCSIPersistentVolumeSource))
Swagger.property_type(::Type{ IoK8sApiCoreV1ISCSIPersistentVolumeSource }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiCoreV1ISCSIPersistentVolumeSource[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1ISCSIPersistentVolumeSource }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1ISCSIPersistentVolumeSource[property_name]

function check_required(o::IoK8sApiCoreV1ISCSIPersistentVolumeSource)
    (getproperty(o, Symbol("iqn")) === nothing) && (return false)
    (getproperty(o, Symbol("lun")) === nothing) && (return false)
    (getproperty(o, Symbol("targetPortal")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1ISCSIPersistentVolumeSource }, name::Symbol, val)
end
