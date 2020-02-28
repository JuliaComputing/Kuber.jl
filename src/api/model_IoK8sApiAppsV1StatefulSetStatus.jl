# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiAppsV1StatefulSetStatus <: SwaggerModel
    collisionCount::Any # spec type: Union{ Nothing, Int32 } # spec name: collisionCount
    conditions::Any # spec type: Union{ Nothing, Vector{IoK8sApiAppsV1StatefulSetCondition} } # spec name: conditions
    currentReplicas::Any # spec type: Union{ Nothing, Int32 } # spec name: currentReplicas
    currentRevision::Any # spec type: Union{ Nothing, String } # spec name: currentRevision
    observedGeneration::Any # spec type: Union{ Nothing, Int64 } # spec name: observedGeneration
    readyReplicas::Any # spec type: Union{ Nothing, Int32 } # spec name: readyReplicas
    replicas::Any # spec type: Union{ Nothing, Int32 } # spec name: replicas
    updateRevision::Any # spec type: Union{ Nothing, String } # spec name: updateRevision
    updatedReplicas::Any # spec type: Union{ Nothing, Int32 } # spec name: updatedReplicas

    function IoK8sApiAppsV1StatefulSetStatus(;collisionCount=nothing, conditions=nothing, currentReplicas=nothing, currentRevision=nothing, observedGeneration=nothing, readyReplicas=nothing, replicas=nothing, updateRevision=nothing, updatedReplicas=nothing)
        o = new()
        validate_property(IoK8sApiAppsV1StatefulSetStatus, Symbol("collisionCount"), collisionCount)
        setfield!(o, Symbol("collisionCount"), collisionCount)
        validate_property(IoK8sApiAppsV1StatefulSetStatus, Symbol("conditions"), conditions)
        setfield!(o, Symbol("conditions"), conditions)
        validate_property(IoK8sApiAppsV1StatefulSetStatus, Symbol("currentReplicas"), currentReplicas)
        setfield!(o, Symbol("currentReplicas"), currentReplicas)
        validate_property(IoK8sApiAppsV1StatefulSetStatus, Symbol("currentRevision"), currentRevision)
        setfield!(o, Symbol("currentRevision"), currentRevision)
        validate_property(IoK8sApiAppsV1StatefulSetStatus, Symbol("observedGeneration"), observedGeneration)
        setfield!(o, Symbol("observedGeneration"), observedGeneration)
        validate_property(IoK8sApiAppsV1StatefulSetStatus, Symbol("readyReplicas"), readyReplicas)
        setfield!(o, Symbol("readyReplicas"), readyReplicas)
        validate_property(IoK8sApiAppsV1StatefulSetStatus, Symbol("replicas"), replicas)
        setfield!(o, Symbol("replicas"), replicas)
        validate_property(IoK8sApiAppsV1StatefulSetStatus, Symbol("updateRevision"), updateRevision)
        setfield!(o, Symbol("updateRevision"), updateRevision)
        validate_property(IoK8sApiAppsV1StatefulSetStatus, Symbol("updatedReplicas"), updatedReplicas)
        setfield!(o, Symbol("updatedReplicas"), updatedReplicas)
        o
    end
end # type IoK8sApiAppsV1StatefulSetStatus

const _property_map_IoK8sApiAppsV1StatefulSetStatus = Dict{Symbol,Symbol}(Symbol("collisionCount")=>Symbol("collisionCount"), Symbol("conditions")=>Symbol("conditions"), Symbol("currentReplicas")=>Symbol("currentReplicas"), Symbol("currentRevision")=>Symbol("currentRevision"), Symbol("observedGeneration")=>Symbol("observedGeneration"), Symbol("readyReplicas")=>Symbol("readyReplicas"), Symbol("replicas")=>Symbol("replicas"), Symbol("updateRevision")=>Symbol("updateRevision"), Symbol("updatedReplicas")=>Symbol("updatedReplicas"))
const _property_types_IoK8sApiAppsV1StatefulSetStatus = Dict{Symbol,String}(Symbol("collisionCount")=>"Int32", Symbol("conditions")=>"Vector{IoK8sApiAppsV1StatefulSetCondition}", Symbol("currentReplicas")=>"Int32", Symbol("currentRevision")=>"String", Symbol("observedGeneration")=>"Int64", Symbol("readyReplicas")=>"Int32", Symbol("replicas")=>"Int32", Symbol("updateRevision")=>"String", Symbol("updatedReplicas")=>"Int32")
Base.propertynames(::Type{ IoK8sApiAppsV1StatefulSetStatus }) = collect(keys(_property_map_IoK8sApiAppsV1StatefulSetStatus))
Swagger.property_type(::Type{ IoK8sApiAppsV1StatefulSetStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1StatefulSetStatus[name]))}
Swagger.field_name(::Type{ IoK8sApiAppsV1StatefulSetStatus }, property_name::Symbol) =  _property_map_IoK8sApiAppsV1StatefulSetStatus[property_name]

function check_required(o::IoK8sApiAppsV1StatefulSetStatus)
    (getproperty(o, Symbol("replicas")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAppsV1StatefulSetStatus }, name::Symbol, val)
end
