# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiAuthenticationV1TokenRequestSpec <: SwaggerModel
    audiences::Any # spec type: Union{ Nothing, Vector{String} } # spec name: audiences
    boundObjectRef::Any # spec type: Union{ Nothing, IoK8sApiAuthenticationV1BoundObjectReference } # spec name: boundObjectRef
    expirationSeconds::Any # spec type: Union{ Nothing, Int64 } # spec name: expirationSeconds

    function IoK8sApiAuthenticationV1TokenRequestSpec(;audiences=nothing, boundObjectRef=nothing, expirationSeconds=nothing)
        o = new()
        validate_property(IoK8sApiAuthenticationV1TokenRequestSpec, Symbol("audiences"), audiences)
        setfield!(o, Symbol("audiences"), audiences)
        validate_property(IoK8sApiAuthenticationV1TokenRequestSpec, Symbol("boundObjectRef"), boundObjectRef)
        setfield!(o, Symbol("boundObjectRef"), boundObjectRef)
        validate_property(IoK8sApiAuthenticationV1TokenRequestSpec, Symbol("expirationSeconds"), expirationSeconds)
        setfield!(o, Symbol("expirationSeconds"), expirationSeconds)
        o
    end
end # type IoK8sApiAuthenticationV1TokenRequestSpec

const _property_map_IoK8sApiAuthenticationV1TokenRequestSpec = Dict{Symbol,Symbol}(Symbol("audiences")=>Symbol("audiences"), Symbol("boundObjectRef")=>Symbol("boundObjectRef"), Symbol("expirationSeconds")=>Symbol("expirationSeconds"))
const _property_types_IoK8sApiAuthenticationV1TokenRequestSpec = Dict{Symbol,String}(Symbol("audiences")=>"Vector{String}", Symbol("boundObjectRef")=>"IoK8sApiAuthenticationV1BoundObjectReference", Symbol("expirationSeconds")=>"Int64")
Base.propertynames(::Type{ IoK8sApiAuthenticationV1TokenRequestSpec }) = collect(keys(_property_map_IoK8sApiAuthenticationV1TokenRequestSpec))
Swagger.property_type(::Type{ IoK8sApiAuthenticationV1TokenRequestSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthenticationV1TokenRequestSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiAuthenticationV1TokenRequestSpec }, property_name::Symbol) =  _property_map_IoK8sApiAuthenticationV1TokenRequestSpec[property_name]

function check_required(o::IoK8sApiAuthenticationV1TokenRequestSpec)
    (getproperty(o, Symbol("audiences")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAuthenticationV1TokenRequestSpec }, name::Symbol, val)
end
