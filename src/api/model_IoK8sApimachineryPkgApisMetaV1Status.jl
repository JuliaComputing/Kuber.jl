# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApimachineryPkgApisMetaV1Status <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    code::Any # spec type: Union{ Nothing, Int32 } # spec name: code
    details::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1StatusDetails } # spec name: details
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    message::Any # spec type: Union{ Nothing, String } # spec name: message
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ListMeta } # spec name: metadata
    reason::Any # spec type: Union{ Nothing, String } # spec name: reason
    status::Any # spec type: Union{ Nothing, String } # spec name: status

    function IoK8sApimachineryPkgApisMetaV1Status(;apiVersion=nothing, code=nothing, details=nothing, kind=nothing, message=nothing, metadata=nothing, reason=nothing, status=nothing)
        o = new()
        validate_property(IoK8sApimachineryPkgApisMetaV1Status, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApimachineryPkgApisMetaV1Status, Symbol("code"), code)
        setfield!(o, Symbol("code"), code)
        validate_property(IoK8sApimachineryPkgApisMetaV1Status, Symbol("details"), details)
        setfield!(o, Symbol("details"), details)
        validate_property(IoK8sApimachineryPkgApisMetaV1Status, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApimachineryPkgApisMetaV1Status, Symbol("message"), message)
        setfield!(o, Symbol("message"), message)
        validate_property(IoK8sApimachineryPkgApisMetaV1Status, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApimachineryPkgApisMetaV1Status, Symbol("reason"), reason)
        setfield!(o, Symbol("reason"), reason)
        validate_property(IoK8sApimachineryPkgApisMetaV1Status, Symbol("status"), status)
        setfield!(o, Symbol("status"), status)
        o
    end
end # type IoK8sApimachineryPkgApisMetaV1Status

const _property_map_IoK8sApimachineryPkgApisMetaV1Status = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("code")=>Symbol("code"), Symbol("details")=>Symbol("details"), Symbol("kind")=>Symbol("kind"), Symbol("message")=>Symbol("message"), Symbol("metadata")=>Symbol("metadata"), Symbol("reason")=>Symbol("reason"), Symbol("status")=>Symbol("status"))
const _property_types_IoK8sApimachineryPkgApisMetaV1Status = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("code")=>"Int32", Symbol("details")=>"IoK8sApimachineryPkgApisMetaV1StatusDetails", Symbol("kind")=>"String", Symbol("message")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ListMeta", Symbol("reason")=>"String", Symbol("status")=>"String")
Base.propertynames(::Type{ IoK8sApimachineryPkgApisMetaV1Status }) = collect(keys(_property_map_IoK8sApimachineryPkgApisMetaV1Status))
Swagger.property_type(::Type{ IoK8sApimachineryPkgApisMetaV1Status }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApimachineryPkgApisMetaV1Status[name]))}
Swagger.field_name(::Type{ IoK8sApimachineryPkgApisMetaV1Status }, property_name::Symbol) =  _property_map_IoK8sApimachineryPkgApisMetaV1Status[property_name]

function check_required(o::IoK8sApimachineryPkgApisMetaV1Status)
    true
end

function validate_property(::Type{ IoK8sApimachineryPkgApisMetaV1Status }, name::Symbol, val)
end
