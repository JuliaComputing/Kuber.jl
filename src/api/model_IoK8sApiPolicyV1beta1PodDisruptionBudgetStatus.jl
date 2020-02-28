# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus <: SwaggerModel
    currentHealthy::Any # spec type: Union{ Nothing, Int32 } # spec name: currentHealthy
    desiredHealthy::Any # spec type: Union{ Nothing, Int32 } # spec name: desiredHealthy
    disruptedPods::Any # spec type: Union{ Nothing, Dict{String, IoK8sApimachineryPkgApisMetaV1Time} } # spec name: disruptedPods
    disruptionsAllowed::Any # spec type: Union{ Nothing, Int32 } # spec name: disruptionsAllowed
    expectedPods::Any # spec type: Union{ Nothing, Int32 } # spec name: expectedPods
    observedGeneration::Any # spec type: Union{ Nothing, Int64 } # spec name: observedGeneration

    function IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus(;currentHealthy=nothing, desiredHealthy=nothing, disruptedPods=nothing, disruptionsAllowed=nothing, expectedPods=nothing, observedGeneration=nothing)
        o = new()
        validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus, Symbol("currentHealthy"), currentHealthy)
        setfield!(o, Symbol("currentHealthy"), currentHealthy)
        validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus, Symbol("desiredHealthy"), desiredHealthy)
        setfield!(o, Symbol("desiredHealthy"), desiredHealthy)
        validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus, Symbol("disruptedPods"), disruptedPods)
        setfield!(o, Symbol("disruptedPods"), disruptedPods)
        validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus, Symbol("disruptionsAllowed"), disruptionsAllowed)
        setfield!(o, Symbol("disruptionsAllowed"), disruptionsAllowed)
        validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus, Symbol("expectedPods"), expectedPods)
        setfield!(o, Symbol("expectedPods"), expectedPods)
        validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus, Symbol("observedGeneration"), observedGeneration)
        setfield!(o, Symbol("observedGeneration"), observedGeneration)
        o
    end
end # type IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus

const _property_map_IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus = Dict{Symbol,Symbol}(Symbol("currentHealthy")=>Symbol("currentHealthy"), Symbol("desiredHealthy")=>Symbol("desiredHealthy"), Symbol("disruptedPods")=>Symbol("disruptedPods"), Symbol("disruptionsAllowed")=>Symbol("disruptionsAllowed"), Symbol("expectedPods")=>Symbol("expectedPods"), Symbol("observedGeneration")=>Symbol("observedGeneration"))
const _property_types_IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus = Dict{Symbol,String}(Symbol("currentHealthy")=>"Int32", Symbol("desiredHealthy")=>"Int32", Symbol("disruptedPods")=>"Dict{String, IoK8sApimachineryPkgApisMetaV1Time}", Symbol("disruptionsAllowed")=>"Int32", Symbol("expectedPods")=>"Int32", Symbol("observedGeneration")=>"Int64")
Base.propertynames(::Type{ IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus }) = collect(keys(_property_map_IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus))
Swagger.property_type(::Type{ IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus[name]))}
Swagger.field_name(::Type{ IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus }, property_name::Symbol) =  _property_map_IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus[property_name]

function check_required(o::IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus)
    (getproperty(o, Symbol("currentHealthy")) === nothing) && (return false)
    (getproperty(o, Symbol("desiredHealthy")) === nothing) && (return false)
    (getproperty(o, Symbol("disruptionsAllowed")) === nothing) && (return false)
    (getproperty(o, Symbol("expectedPods")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus }, name::Symbol, val)
end
