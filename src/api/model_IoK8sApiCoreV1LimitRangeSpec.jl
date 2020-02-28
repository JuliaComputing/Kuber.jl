# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiCoreV1LimitRangeSpec <: SwaggerModel
    limits::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1LimitRangeItem} } # spec name: limits

    function IoK8sApiCoreV1LimitRangeSpec(;limits=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1LimitRangeSpec, Symbol("limits"), limits)
        setfield!(o, Symbol("limits"), limits)
        o
    end
end # type IoK8sApiCoreV1LimitRangeSpec

const _property_map_IoK8sApiCoreV1LimitRangeSpec = Dict{Symbol,Symbol}(Symbol("limits")=>Symbol("limits"))
const _property_types_IoK8sApiCoreV1LimitRangeSpec = Dict{Symbol,String}(Symbol("limits")=>"Vector{IoK8sApiCoreV1LimitRangeItem}")
Base.propertynames(::Type{ IoK8sApiCoreV1LimitRangeSpec }) = collect(keys(_property_map_IoK8sApiCoreV1LimitRangeSpec))
Swagger.property_type(::Type{ IoK8sApiCoreV1LimitRangeSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1LimitRangeSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1LimitRangeSpec }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1LimitRangeSpec[property_name]

function check_required(o::IoK8sApiCoreV1LimitRangeSpec)
    (getproperty(o, Symbol("limits")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1LimitRangeSpec }, name::Symbol, val)
end
