# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiPolicyV1beta1RunAsUserStrategyOptions <: SwaggerModel
    ranges::Any # spec type: Union{ Nothing, Vector{IoK8sApiPolicyV1beta1IDRange} } # spec name: ranges
    rule::Any # spec type: Union{ Nothing, String } # spec name: rule

    function IoK8sApiPolicyV1beta1RunAsUserStrategyOptions(;ranges=nothing, rule=nothing)
        o = new()
        validate_property(IoK8sApiPolicyV1beta1RunAsUserStrategyOptions, Symbol("ranges"), ranges)
        setfield!(o, Symbol("ranges"), ranges)
        validate_property(IoK8sApiPolicyV1beta1RunAsUserStrategyOptions, Symbol("rule"), rule)
        setfield!(o, Symbol("rule"), rule)
        o
    end
end # type IoK8sApiPolicyV1beta1RunAsUserStrategyOptions

const _property_map_IoK8sApiPolicyV1beta1RunAsUserStrategyOptions = Dict{Symbol,Symbol}(Symbol("ranges")=>Symbol("ranges"), Symbol("rule")=>Symbol("rule"))
const _property_types_IoK8sApiPolicyV1beta1RunAsUserStrategyOptions = Dict{Symbol,String}(Symbol("ranges")=>"Vector{IoK8sApiPolicyV1beta1IDRange}", Symbol("rule")=>"String")
Base.propertynames(::Type{ IoK8sApiPolicyV1beta1RunAsUserStrategyOptions }) = collect(keys(_property_map_IoK8sApiPolicyV1beta1RunAsUserStrategyOptions))
Swagger.property_type(::Type{ IoK8sApiPolicyV1beta1RunAsUserStrategyOptions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiPolicyV1beta1RunAsUserStrategyOptions[name]))}
Swagger.field_name(::Type{ IoK8sApiPolicyV1beta1RunAsUserStrategyOptions }, property_name::Symbol) =  _property_map_IoK8sApiPolicyV1beta1RunAsUserStrategyOptions[property_name]

function check_required(o::IoK8sApiPolicyV1beta1RunAsUserStrategyOptions)
    (getproperty(o, Symbol("rule")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiPolicyV1beta1RunAsUserStrategyOptions }, name::Symbol, val)
end
