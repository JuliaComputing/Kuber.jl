# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""ReplicationControllerStatus represents the current status of a replication controller.

    IoK8sApiCoreV1ReplicationControllerStatus(;
        availableReplicas=nothing,
        conditions=nothing,
        fullyLabeledReplicas=nothing,
        observedGeneration=nothing,
        readyReplicas=nothing,
        replicas=nothing,
    )

    - availableReplicas::Int32 : The number of available replicas (ready for at least minReadySeconds) for this replication controller.
    - conditions::Vector{IoK8sApiCoreV1ReplicationControllerCondition} : Represents the latest available observations of a replication controller&#39;s current state.
    - fullyLabeledReplicas::Int32 : The number of pods that have labels matching the labels of the pod template of the replication controller.
    - observedGeneration::Int64 : ObservedGeneration reflects the generation of the most recently observed replication controller.
    - readyReplicas::Int32 : The number of ready replicas for this replication controller.
    - replicas::Int32 : Replicas is the most recently oberved number of replicas. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#what-is-a-replicationcontroller
"""
mutable struct IoK8sApiCoreV1ReplicationControllerStatus <: SwaggerModel
    availableReplicas::Any # spec type: Union{ Nothing, Int32 } # spec name: availableReplicas
    conditions::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1ReplicationControllerCondition} } # spec name: conditions
    fullyLabeledReplicas::Any # spec type: Union{ Nothing, Int32 } # spec name: fullyLabeledReplicas
    observedGeneration::Any # spec type: Union{ Nothing, Int64 } # spec name: observedGeneration
    readyReplicas::Any # spec type: Union{ Nothing, Int32 } # spec name: readyReplicas
    replicas::Any # spec type: Union{ Nothing, Int32 } # spec name: replicas

    function IoK8sApiCoreV1ReplicationControllerStatus(;availableReplicas=nothing, conditions=nothing, fullyLabeledReplicas=nothing, observedGeneration=nothing, readyReplicas=nothing, replicas=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1ReplicationControllerStatus, Symbol("availableReplicas"), availableReplicas)
        setfield!(o, Symbol("availableReplicas"), availableReplicas)
        validate_property(IoK8sApiCoreV1ReplicationControllerStatus, Symbol("conditions"), conditions)
        setfield!(o, Symbol("conditions"), conditions)
        validate_property(IoK8sApiCoreV1ReplicationControllerStatus, Symbol("fullyLabeledReplicas"), fullyLabeledReplicas)
        setfield!(o, Symbol("fullyLabeledReplicas"), fullyLabeledReplicas)
        validate_property(IoK8sApiCoreV1ReplicationControllerStatus, Symbol("observedGeneration"), observedGeneration)
        setfield!(o, Symbol("observedGeneration"), observedGeneration)
        validate_property(IoK8sApiCoreV1ReplicationControllerStatus, Symbol("readyReplicas"), readyReplicas)
        setfield!(o, Symbol("readyReplicas"), readyReplicas)
        validate_property(IoK8sApiCoreV1ReplicationControllerStatus, Symbol("replicas"), replicas)
        setfield!(o, Symbol("replicas"), replicas)
        o
    end
end # type IoK8sApiCoreV1ReplicationControllerStatus

const _property_map_IoK8sApiCoreV1ReplicationControllerStatus = Dict{Symbol,Symbol}(Symbol("availableReplicas")=>Symbol("availableReplicas"), Symbol("conditions")=>Symbol("conditions"), Symbol("fullyLabeledReplicas")=>Symbol("fullyLabeledReplicas"), Symbol("observedGeneration")=>Symbol("observedGeneration"), Symbol("readyReplicas")=>Symbol("readyReplicas"), Symbol("replicas")=>Symbol("replicas"))
const _property_types_IoK8sApiCoreV1ReplicationControllerStatus = Dict{Symbol,String}(Symbol("availableReplicas")=>"Int32", Symbol("conditions")=>"Vector{IoK8sApiCoreV1ReplicationControllerCondition}", Symbol("fullyLabeledReplicas")=>"Int32", Symbol("observedGeneration")=>"Int64", Symbol("readyReplicas")=>"Int32", Symbol("replicas")=>"Int32")
Base.propertynames(::Type{ IoK8sApiCoreV1ReplicationControllerStatus }) = collect(keys(_property_map_IoK8sApiCoreV1ReplicationControllerStatus))
Swagger.property_type(::Type{ IoK8sApiCoreV1ReplicationControllerStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1ReplicationControllerStatus[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1ReplicationControllerStatus }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1ReplicationControllerStatus[property_name]

function check_required(o::IoK8sApiCoreV1ReplicationControllerStatus)
    (getproperty(o, Symbol("replicas")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1ReplicationControllerStatus }, name::Symbol, val)
end
