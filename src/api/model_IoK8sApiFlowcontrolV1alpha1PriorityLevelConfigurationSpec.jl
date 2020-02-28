# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec <: SwaggerModel
    limited::Any # spec type: Union{ Nothing, IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration } # spec name: limited
    type::Any # spec type: Union{ Nothing, String } # spec name: type

    function IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec(;limited=nothing, type=nothing)
        o = new()
        validate_property(IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec, Symbol("limited"), limited)
        setfield!(o, Symbol("limited"), limited)
        validate_property(IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec, Symbol("type"), type)
        setfield!(o, Symbol("type"), type)
        o
    end
end # type IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec

const _property_map_IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec = Dict{Symbol,Symbol}(Symbol("limited")=>Symbol("limited"), Symbol("type")=>Symbol("type"))
const _property_types_IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec = Dict{Symbol,String}(Symbol("limited")=>"IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration", Symbol("type")=>"String")
Base.propertynames(::Type{ IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec }) = collect(keys(_property_map_IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec))
Swagger.property_type(::Type{ IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec }, property_name::Symbol) =  _property_map_IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec[property_name]

function check_required(o::IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec)
    (getproperty(o, Symbol("type")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiFlowcontrolV1alpha1PriorityLevelConfigurationSpec }, name::Symbol, val)
end
