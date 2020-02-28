# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiAuthorizationV1beta1NonResourceRule <: SwaggerModel
    nonResourceURLs::Any # spec type: Union{ Nothing, Vector{String} } # spec name: nonResourceURLs
    verbs::Any # spec type: Union{ Nothing, Vector{String} } # spec name: verbs

    function IoK8sApiAuthorizationV1beta1NonResourceRule(;nonResourceURLs=nothing, verbs=nothing)
        o = new()
        validate_property(IoK8sApiAuthorizationV1beta1NonResourceRule, Symbol("nonResourceURLs"), nonResourceURLs)
        setfield!(o, Symbol("nonResourceURLs"), nonResourceURLs)
        validate_property(IoK8sApiAuthorizationV1beta1NonResourceRule, Symbol("verbs"), verbs)
        setfield!(o, Symbol("verbs"), verbs)
        o
    end
end # type IoK8sApiAuthorizationV1beta1NonResourceRule

const _property_map_IoK8sApiAuthorizationV1beta1NonResourceRule = Dict{Symbol,Symbol}(Symbol("nonResourceURLs")=>Symbol("nonResourceURLs"), Symbol("verbs")=>Symbol("verbs"))
const _property_types_IoK8sApiAuthorizationV1beta1NonResourceRule = Dict{Symbol,String}(Symbol("nonResourceURLs")=>"Vector{String}", Symbol("verbs")=>"Vector{String}")
Base.propertynames(::Type{ IoK8sApiAuthorizationV1beta1NonResourceRule }) = collect(keys(_property_map_IoK8sApiAuthorizationV1beta1NonResourceRule))
Swagger.property_type(::Type{ IoK8sApiAuthorizationV1beta1NonResourceRule }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthorizationV1beta1NonResourceRule[name]))}
Swagger.field_name(::Type{ IoK8sApiAuthorizationV1beta1NonResourceRule }, property_name::Symbol) =  _property_map_IoK8sApiAuthorizationV1beta1NonResourceRule[property_name]

function check_required(o::IoK8sApiAuthorizationV1beta1NonResourceRule)
    (getproperty(o, Symbol("verbs")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAuthorizationV1beta1NonResourceRule }, name::Symbol, val)
end
