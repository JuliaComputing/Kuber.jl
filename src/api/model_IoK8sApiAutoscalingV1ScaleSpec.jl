# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiAutoscalingV1ScaleSpec <: SwaggerModel
    replicas::Any # spec type: Union{ Nothing, Int32 } # spec name: replicas

    function IoK8sApiAutoscalingV1ScaleSpec(;replicas=nothing)
        o = new()
        validate_property(IoK8sApiAutoscalingV1ScaleSpec, Symbol("replicas"), replicas)
        setfield!(o, Symbol("replicas"), replicas)
        o
    end
end # type IoK8sApiAutoscalingV1ScaleSpec

const _property_map_IoK8sApiAutoscalingV1ScaleSpec = Dict{Symbol,Symbol}(Symbol("replicas")=>Symbol("replicas"))
const _property_types_IoK8sApiAutoscalingV1ScaleSpec = Dict{Symbol,String}(Symbol("replicas")=>"Int32")
Base.propertynames(::Type{ IoK8sApiAutoscalingV1ScaleSpec }) = collect(keys(_property_map_IoK8sApiAutoscalingV1ScaleSpec))
Swagger.property_type(::Type{ IoK8sApiAutoscalingV1ScaleSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAutoscalingV1ScaleSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiAutoscalingV1ScaleSpec }, property_name::Symbol) =  _property_map_IoK8sApiAutoscalingV1ScaleSpec[property_name]

function check_required(o::IoK8sApiAutoscalingV1ScaleSpec)
    true
end

function validate_property(::Type{ IoK8sApiAutoscalingV1ScaleSpec }, name::Symbol, val)
end
