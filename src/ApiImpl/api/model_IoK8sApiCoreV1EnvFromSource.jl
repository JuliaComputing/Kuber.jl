# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""EnvFromSource represents the source of a set of ConfigMaps

    IoK8sApiCoreV1EnvFromSource(;
        configMapRef=nothing,
        prefix=nothing,
        secretRef=nothing,
    )

    - configMapRef::IoK8sApiCoreV1ConfigMapEnvSource : The ConfigMap to select from
    - prefix::String : An optional identifier to prepend to each key in the ConfigMap. Must be a C_IDENTIFIER.
    - secretRef::IoK8sApiCoreV1SecretEnvSource : The Secret to select from
"""
mutable struct IoK8sApiCoreV1EnvFromSource <: SwaggerModel
    configMapRef::Any # spec type: Union{ Nothing, IoK8sApiCoreV1ConfigMapEnvSource } # spec name: configMapRef
    prefix::Any # spec type: Union{ Nothing, String } # spec name: prefix
    secretRef::Any # spec type: Union{ Nothing, IoK8sApiCoreV1SecretEnvSource } # spec name: secretRef

    function IoK8sApiCoreV1EnvFromSource(;configMapRef=nothing, prefix=nothing, secretRef=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1EnvFromSource, Symbol("configMapRef"), configMapRef)
        setfield!(o, Symbol("configMapRef"), configMapRef)
        validate_property(IoK8sApiCoreV1EnvFromSource, Symbol("prefix"), prefix)
        setfield!(o, Symbol("prefix"), prefix)
        validate_property(IoK8sApiCoreV1EnvFromSource, Symbol("secretRef"), secretRef)
        setfield!(o, Symbol("secretRef"), secretRef)
        o
    end
end # type IoK8sApiCoreV1EnvFromSource

const _property_map_IoK8sApiCoreV1EnvFromSource = Dict{Symbol,Symbol}(Symbol("configMapRef")=>Symbol("configMapRef"), Symbol("prefix")=>Symbol("prefix"), Symbol("secretRef")=>Symbol("secretRef"))
const _property_types_IoK8sApiCoreV1EnvFromSource = Dict{Symbol,String}(Symbol("configMapRef")=>"IoK8sApiCoreV1ConfigMapEnvSource", Symbol("prefix")=>"String", Symbol("secretRef")=>"IoK8sApiCoreV1SecretEnvSource")
Base.propertynames(::Type{ IoK8sApiCoreV1EnvFromSource }) = collect(keys(_property_map_IoK8sApiCoreV1EnvFromSource))
Swagger.property_type(::Type{ IoK8sApiCoreV1EnvFromSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1EnvFromSource[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1EnvFromSource }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1EnvFromSource[property_name]

function check_required(o::IoK8sApiCoreV1EnvFromSource)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1EnvFromSource }, name::Symbol, val)
end