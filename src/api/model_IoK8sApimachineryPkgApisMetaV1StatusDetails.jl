# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApimachineryPkgApisMetaV1StatusDetails <: SwaggerModel
    causes::Any # spec type: Union{ Nothing, Vector{IoK8sApimachineryPkgApisMetaV1StatusCause} } # spec name: causes
    group::Any # spec type: Union{ Nothing, String } # spec name: group
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    name::Any # spec type: Union{ Nothing, String } # spec name: name
    retryAfterSeconds::Any # spec type: Union{ Nothing, Int32 } # spec name: retryAfterSeconds
    uid::Any # spec type: Union{ Nothing, String } # spec name: uid

    function IoK8sApimachineryPkgApisMetaV1StatusDetails(;causes=nothing, group=nothing, kind=nothing, name=nothing, retryAfterSeconds=nothing, uid=nothing)
        o = new()
        validate_property(IoK8sApimachineryPkgApisMetaV1StatusDetails, Symbol("causes"), causes)
        setfield!(o, Symbol("causes"), causes)
        validate_property(IoK8sApimachineryPkgApisMetaV1StatusDetails, Symbol("group"), group)
        setfield!(o, Symbol("group"), group)
        validate_property(IoK8sApimachineryPkgApisMetaV1StatusDetails, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApimachineryPkgApisMetaV1StatusDetails, Symbol("name"), name)
        setfield!(o, Symbol("name"), name)
        validate_property(IoK8sApimachineryPkgApisMetaV1StatusDetails, Symbol("retryAfterSeconds"), retryAfterSeconds)
        setfield!(o, Symbol("retryAfterSeconds"), retryAfterSeconds)
        validate_property(IoK8sApimachineryPkgApisMetaV1StatusDetails, Symbol("uid"), uid)
        setfield!(o, Symbol("uid"), uid)
        o
    end
end # type IoK8sApimachineryPkgApisMetaV1StatusDetails

const _property_map_IoK8sApimachineryPkgApisMetaV1StatusDetails = Dict{Symbol,Symbol}(Symbol("causes")=>Symbol("causes"), Symbol("group")=>Symbol("group"), Symbol("kind")=>Symbol("kind"), Symbol("name")=>Symbol("name"), Symbol("retryAfterSeconds")=>Symbol("retryAfterSeconds"), Symbol("uid")=>Symbol("uid"))
const _property_types_IoK8sApimachineryPkgApisMetaV1StatusDetails = Dict{Symbol,String}(Symbol("causes")=>"Vector{IoK8sApimachineryPkgApisMetaV1StatusCause}", Symbol("group")=>"String", Symbol("kind")=>"String", Symbol("name")=>"String", Symbol("retryAfterSeconds")=>"Int32", Symbol("uid")=>"String")
Base.propertynames(::Type{ IoK8sApimachineryPkgApisMetaV1StatusDetails }) = collect(keys(_property_map_IoK8sApimachineryPkgApisMetaV1StatusDetails))
Swagger.property_type(::Type{ IoK8sApimachineryPkgApisMetaV1StatusDetails }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApimachineryPkgApisMetaV1StatusDetails[name]))}
Swagger.field_name(::Type{ IoK8sApimachineryPkgApisMetaV1StatusDetails }, property_name::Symbol) =  _property_map_IoK8sApimachineryPkgApisMetaV1StatusDetails[property_name]

function check_required(o::IoK8sApimachineryPkgApisMetaV1StatusDetails)
    true
end

function validate_property(::Type{ IoK8sApimachineryPkgApisMetaV1StatusDetails }, name::Symbol, val)
end
