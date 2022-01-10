# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""ScaleIOPersistentVolumeSource represents a persistent ScaleIO volume

    IoK8sApiCoreV1ScaleIOPersistentVolumeSource(;
        fsType=nothing,
        gateway=nothing,
        protectionDomain=nothing,
        readOnly=nothing,
        secretRef=nothing,
        sslEnabled=nothing,
        storageMode=nothing,
        storagePool=nothing,
        system=nothing,
        volumeName=nothing,
    )

    - fsType::String : Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \&quot;ext4\&quot;, \&quot;xfs\&quot;, \&quot;ntfs\&quot;. Default is \&quot;xfs\&quot;
    - gateway::String : The host address of the ScaleIO API Gateway.
    - protectionDomain::String : The name of the ScaleIO Protection Domain for the configured storage.
    - readOnly::Bool : Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    - secretRef::IoK8sApiCoreV1SecretReference : SecretRef references to the secret for ScaleIO user and other sensitive information. If this is not provided, Login operation will fail.
    - sslEnabled::Bool : Flag to enable/disable SSL communication with Gateway, default false
    - storageMode::String : Indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned. Default is ThinProvisioned.
    - storagePool::String : The ScaleIO Storage Pool associated with the protection domain.
    - system::String : The name of the storage system as configured in ScaleIO.
    - volumeName::String : The name of a volume already created in the ScaleIO system that is associated with this volume source.
"""
mutable struct IoK8sApiCoreV1ScaleIOPersistentVolumeSource <: SwaggerModel
    fsType::Any # spec type: Union{ Nothing, String } # spec name: fsType
    gateway::Any # spec type: Union{ Nothing, String } # spec name: gateway
    protectionDomain::Any # spec type: Union{ Nothing, String } # spec name: protectionDomain
    readOnly::Any # spec type: Union{ Nothing, Bool } # spec name: readOnly
    secretRef::Any # spec type: Union{ Nothing, IoK8sApiCoreV1SecretReference } # spec name: secretRef
    sslEnabled::Any # spec type: Union{ Nothing, Bool } # spec name: sslEnabled
    storageMode::Any # spec type: Union{ Nothing, String } # spec name: storageMode
    storagePool::Any # spec type: Union{ Nothing, String } # spec name: storagePool
    system::Any # spec type: Union{ Nothing, String } # spec name: system
    volumeName::Any # spec type: Union{ Nothing, String } # spec name: volumeName

    function IoK8sApiCoreV1ScaleIOPersistentVolumeSource(;fsType=nothing, gateway=nothing, protectionDomain=nothing, readOnly=nothing, secretRef=nothing, sslEnabled=nothing, storageMode=nothing, storagePool=nothing, system=nothing, volumeName=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1ScaleIOPersistentVolumeSource, Symbol("fsType"), fsType)
        setfield!(o, Symbol("fsType"), fsType)
        validate_property(IoK8sApiCoreV1ScaleIOPersistentVolumeSource, Symbol("gateway"), gateway)
        setfield!(o, Symbol("gateway"), gateway)
        validate_property(IoK8sApiCoreV1ScaleIOPersistentVolumeSource, Symbol("protectionDomain"), protectionDomain)
        setfield!(o, Symbol("protectionDomain"), protectionDomain)
        validate_property(IoK8sApiCoreV1ScaleIOPersistentVolumeSource, Symbol("readOnly"), readOnly)
        setfield!(o, Symbol("readOnly"), readOnly)
        validate_property(IoK8sApiCoreV1ScaleIOPersistentVolumeSource, Symbol("secretRef"), secretRef)
        setfield!(o, Symbol("secretRef"), secretRef)
        validate_property(IoK8sApiCoreV1ScaleIOPersistentVolumeSource, Symbol("sslEnabled"), sslEnabled)
        setfield!(o, Symbol("sslEnabled"), sslEnabled)
        validate_property(IoK8sApiCoreV1ScaleIOPersistentVolumeSource, Symbol("storageMode"), storageMode)
        setfield!(o, Symbol("storageMode"), storageMode)
        validate_property(IoK8sApiCoreV1ScaleIOPersistentVolumeSource, Symbol("storagePool"), storagePool)
        setfield!(o, Symbol("storagePool"), storagePool)
        validate_property(IoK8sApiCoreV1ScaleIOPersistentVolumeSource, Symbol("system"), system)
        setfield!(o, Symbol("system"), system)
        validate_property(IoK8sApiCoreV1ScaleIOPersistentVolumeSource, Symbol("volumeName"), volumeName)
        setfield!(o, Symbol("volumeName"), volumeName)
        o
    end
end # type IoK8sApiCoreV1ScaleIOPersistentVolumeSource

const _property_map_IoK8sApiCoreV1ScaleIOPersistentVolumeSource = Dict{Symbol,Symbol}(Symbol("fsType")=>Symbol("fsType"), Symbol("gateway")=>Symbol("gateway"), Symbol("protectionDomain")=>Symbol("protectionDomain"), Symbol("readOnly")=>Symbol("readOnly"), Symbol("secretRef")=>Symbol("secretRef"), Symbol("sslEnabled")=>Symbol("sslEnabled"), Symbol("storageMode")=>Symbol("storageMode"), Symbol("storagePool")=>Symbol("storagePool"), Symbol("system")=>Symbol("system"), Symbol("volumeName")=>Symbol("volumeName"))
const _property_types_IoK8sApiCoreV1ScaleIOPersistentVolumeSource = Dict{Symbol,String}(Symbol("fsType")=>"String", Symbol("gateway")=>"String", Symbol("protectionDomain")=>"String", Symbol("readOnly")=>"Bool", Symbol("secretRef")=>"IoK8sApiCoreV1SecretReference", Symbol("sslEnabled")=>"Bool", Symbol("storageMode")=>"String", Symbol("storagePool")=>"String", Symbol("system")=>"String", Symbol("volumeName")=>"String")
Base.propertynames(::Type{ IoK8sApiCoreV1ScaleIOPersistentVolumeSource }) = collect(keys(_property_map_IoK8sApiCoreV1ScaleIOPersistentVolumeSource))
Swagger.property_type(::Type{ IoK8sApiCoreV1ScaleIOPersistentVolumeSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1ScaleIOPersistentVolumeSource[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1ScaleIOPersistentVolumeSource }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1ScaleIOPersistentVolumeSource[property_name]

function check_required(o::IoK8sApiCoreV1ScaleIOPersistentVolumeSource)
    (getproperty(o, Symbol("gateway")) === nothing) && (return false)
    (getproperty(o, Symbol("secretRef")) === nothing) && (return false)
    (getproperty(o, Symbol("system")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1ScaleIOPersistentVolumeSource }, name::Symbol, val)
end