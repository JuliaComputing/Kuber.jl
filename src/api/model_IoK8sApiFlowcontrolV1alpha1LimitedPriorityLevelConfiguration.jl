# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration <: SwaggerModel
    assuredConcurrencyShares::Any # spec type: Union{ Nothing, Int32 } # spec name: assuredConcurrencyShares
    limitResponse::Any # spec type: Union{ Nothing, IoK8sApiFlowcontrolV1alpha1LimitResponse } # spec name: limitResponse

    function IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration(;assuredConcurrencyShares=nothing, limitResponse=nothing)
        o = new()
        validate_property(IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration, Symbol("assuredConcurrencyShares"), assuredConcurrencyShares)
        setfield!(o, Symbol("assuredConcurrencyShares"), assuredConcurrencyShares)
        validate_property(IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration, Symbol("limitResponse"), limitResponse)
        setfield!(o, Symbol("limitResponse"), limitResponse)
        o
    end
end # type IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration

const _property_map_IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration = Dict{Symbol,Symbol}(Symbol("assuredConcurrencyShares")=>Symbol("assuredConcurrencyShares"), Symbol("limitResponse")=>Symbol("limitResponse"))
const _property_types_IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration = Dict{Symbol,String}(Symbol("assuredConcurrencyShares")=>"Int32", Symbol("limitResponse")=>"IoK8sApiFlowcontrolV1alpha1LimitResponse")
Base.propertynames(::Type{ IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration }) = collect(keys(_property_map_IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration))
Swagger.property_type(::Type{ IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration[name]))}
Swagger.field_name(::Type{ IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration }, property_name::Symbol) =  _property_map_IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration[property_name]

function check_required(o::IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration)
    true
end

function validate_property(::Type{ IoK8sApiFlowcontrolV1alpha1LimitedPriorityLevelConfiguration }, name::Symbol, val)
end
