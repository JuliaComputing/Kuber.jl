# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiCoreV1SecretReference <: SwaggerModel
    name::Any # spec type: Union{ Nothing, String } # spec name: name
    namespace::Any # spec type: Union{ Nothing, String } # spec name: namespace

    function IoK8sApiCoreV1SecretReference(;name=nothing, namespace=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1SecretReference, Symbol("name"), name)
        setfield!(o, Symbol("name"), name)
        validate_property(IoK8sApiCoreV1SecretReference, Symbol("namespace"), namespace)
        setfield!(o, Symbol("namespace"), namespace)
        o
    end
end # type IoK8sApiCoreV1SecretReference

const _property_map_IoK8sApiCoreV1SecretReference = Dict{Symbol,Symbol}(Symbol("name")=>Symbol("name"), Symbol("namespace")=>Symbol("namespace"))
const _property_types_IoK8sApiCoreV1SecretReference = Dict{Symbol,String}(Symbol("name")=>"String", Symbol("namespace")=>"String")
Base.propertynames(::Type{ IoK8sApiCoreV1SecretReference }) = collect(keys(_property_map_IoK8sApiCoreV1SecretReference))
Swagger.property_type(::Type{ IoK8sApiCoreV1SecretReference }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1SecretReference[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1SecretReference }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1SecretReference[property_name]

function check_required(o::IoK8sApiCoreV1SecretReference)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1SecretReference }, name::Symbol, val)
end
