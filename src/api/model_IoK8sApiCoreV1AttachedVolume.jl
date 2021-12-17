# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""AttachedVolume describes a volume attached to a node

    IoK8sApiCoreV1AttachedVolume(;
        devicePath=nothing,
        name=nothing,
    )

    - devicePath::String : DevicePath represents the device path where the volume should be available
    - name::String : Name of the attached volume
"""
mutable struct IoK8sApiCoreV1AttachedVolume <: SwaggerModel
    devicePath::Any # spec type: Union{ Nothing, String } # spec name: devicePath
    name::Any # spec type: Union{ Nothing, String } # spec name: name

    function IoK8sApiCoreV1AttachedVolume(;devicePath=nothing, name=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1AttachedVolume, Symbol("devicePath"), devicePath)
        setfield!(o, Symbol("devicePath"), devicePath)
        validate_property(IoK8sApiCoreV1AttachedVolume, Symbol("name"), name)
        setfield!(o, Symbol("name"), name)
        o
    end
end # type IoK8sApiCoreV1AttachedVolume

const _property_map_IoK8sApiCoreV1AttachedVolume = Dict{Symbol,Symbol}(Symbol("devicePath")=>Symbol("devicePath"), Symbol("name")=>Symbol("name"))
const _property_types_IoK8sApiCoreV1AttachedVolume = Dict{Symbol,String}(Symbol("devicePath")=>"String", Symbol("name")=>"String")
Base.propertynames(::Type{ IoK8sApiCoreV1AttachedVolume }) = collect(keys(_property_map_IoK8sApiCoreV1AttachedVolume))
Swagger.property_type(::Type{ IoK8sApiCoreV1AttachedVolume }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1AttachedVolume[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1AttachedVolume }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1AttachedVolume[property_name]

function check_required(o::IoK8sApiCoreV1AttachedVolume)
    (getproperty(o, Symbol("devicePath")) === nothing) && (return false)
    (getproperty(o, Symbol("name")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1AttachedVolume }, name::Symbol, val)
end
