# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiExtensionsV1beta1RollbackConfig <: SwaggerModel
    revision::Any # spec type: Union{ Nothing, Int64 } # spec name: revision

    function IoK8sApiExtensionsV1beta1RollbackConfig(;revision=nothing)
        o = new()
        validate_property(IoK8sApiExtensionsV1beta1RollbackConfig, Symbol("revision"), revision)
        setfield!(o, Symbol("revision"), revision)
        o
    end
end # type IoK8sApiExtensionsV1beta1RollbackConfig

const _property_map_IoK8sApiExtensionsV1beta1RollbackConfig = Dict{Symbol,Symbol}(Symbol("revision")=>Symbol("revision"))
const _property_types_IoK8sApiExtensionsV1beta1RollbackConfig = Dict{Symbol,String}(Symbol("revision")=>"Int64")
Base.propertynames(::Type{ IoK8sApiExtensionsV1beta1RollbackConfig }) = collect(keys(_property_map_IoK8sApiExtensionsV1beta1RollbackConfig))
Swagger.property_type(::Type{ IoK8sApiExtensionsV1beta1RollbackConfig }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1RollbackConfig[name]))}
Swagger.field_name(::Type{ IoK8sApiExtensionsV1beta1RollbackConfig }, property_name::Symbol) =  _property_map_IoK8sApiExtensionsV1beta1RollbackConfig[property_name]

function check_required(o::IoK8sApiExtensionsV1beta1RollbackConfig)
    true
end

function validate_property(::Type{ IoK8sApiExtensionsV1beta1RollbackConfig }, name::Symbol, val)
end
