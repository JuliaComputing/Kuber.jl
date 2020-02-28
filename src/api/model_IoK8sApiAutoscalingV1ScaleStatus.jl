# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiAutoscalingV1ScaleStatus <: SwaggerModel
    replicas::Any # spec type: Union{ Nothing, Int32 } # spec name: replicas
    selector::Any # spec type: Union{ Nothing, String } # spec name: selector

    function IoK8sApiAutoscalingV1ScaleStatus(;replicas=nothing, selector=nothing)
        o = new()
        validate_property(IoK8sApiAutoscalingV1ScaleStatus, Symbol("replicas"), replicas)
        setfield!(o, Symbol("replicas"), replicas)
        validate_property(IoK8sApiAutoscalingV1ScaleStatus, Symbol("selector"), selector)
        setfield!(o, Symbol("selector"), selector)
        o
    end
end # type IoK8sApiAutoscalingV1ScaleStatus

const _property_map_IoK8sApiAutoscalingV1ScaleStatus = Dict{Symbol,Symbol}(Symbol("replicas")=>Symbol("replicas"), Symbol("selector")=>Symbol("selector"))
const _property_types_IoK8sApiAutoscalingV1ScaleStatus = Dict{Symbol,String}(Symbol("replicas")=>"Int32", Symbol("selector")=>"String")
Base.propertynames(::Type{ IoK8sApiAutoscalingV1ScaleStatus }) = collect(keys(_property_map_IoK8sApiAutoscalingV1ScaleStatus))
Swagger.property_type(::Type{ IoK8sApiAutoscalingV1ScaleStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAutoscalingV1ScaleStatus[name]))}
Swagger.field_name(::Type{ IoK8sApiAutoscalingV1ScaleStatus }, property_name::Symbol) =  _property_map_IoK8sApiAutoscalingV1ScaleStatus[property_name]

function check_required(o::IoK8sApiAutoscalingV1ScaleStatus)
    (getproperty(o, Symbol("replicas")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAutoscalingV1ScaleStatus }, name::Symbol, val)
end
