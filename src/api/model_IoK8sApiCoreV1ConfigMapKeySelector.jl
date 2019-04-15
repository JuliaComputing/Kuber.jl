# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiCoreV1ConfigMapKeySelector <: SwaggerModel
    key::Any # spec type: Union{ Nothing, String } # spec name: key
    name::Any # spec type: Union{ Nothing, String } # spec name: name
    optional::Any # spec type: Union{ Nothing, Bool } # spec name: optional

    function IoK8sApiCoreV1ConfigMapKeySelector(;key=nothing, name=nothing, optional=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1ConfigMapKeySelector, Symbol("key"), key)
        setfield!(o, Symbol("key"), key)
        validate_property(IoK8sApiCoreV1ConfigMapKeySelector, Symbol("name"), name)
        setfield!(o, Symbol("name"), name)
        validate_property(IoK8sApiCoreV1ConfigMapKeySelector, Symbol("optional"), optional)
        setfield!(o, Symbol("optional"), optional)
        o
    end
end # type IoK8sApiCoreV1ConfigMapKeySelector

const _property_map_IoK8sApiCoreV1ConfigMapKeySelector = Dict{Symbol,Symbol}(Symbol("key")=>Symbol("key"), Symbol("name")=>Symbol("name"), Symbol("optional")=>Symbol("optional"))
const _property_types_IoK8sApiCoreV1ConfigMapKeySelector = Dict{Symbol,String}(Symbol("key")=>"String", Symbol("name")=>"String", Symbol("optional")=>"Bool")
Base.propertynames(::Type{ IoK8sApiCoreV1ConfigMapKeySelector }) = collect(keys(_property_map_IoK8sApiCoreV1ConfigMapKeySelector))
Swagger.property_type(::Type{ IoK8sApiCoreV1ConfigMapKeySelector }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiCoreV1ConfigMapKeySelector[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1ConfigMapKeySelector }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1ConfigMapKeySelector[property_name]

function check_required(o::IoK8sApiCoreV1ConfigMapKeySelector)
    (getproperty(o, Symbol("key")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1ConfigMapKeySelector }, name::Symbol, val)
end