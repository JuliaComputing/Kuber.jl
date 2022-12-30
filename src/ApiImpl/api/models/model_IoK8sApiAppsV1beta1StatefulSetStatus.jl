# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.apps.v1beta1.StatefulSetStatus
StatefulSetStatus represents the current state of a StatefulSet.

    IoK8sApiAppsV1beta1StatefulSetStatus(;
        collisionCount=nothing,
        conditions=nothing,
        currentReplicas=nothing,
        currentRevision=nothing,
        observedGeneration=nothing,
        readyReplicas=nothing,
        replicas=nothing,
        updateRevision=nothing,
        updatedReplicas=nothing,
    )

    - collisionCount::Int64 : collisionCount is the count of hash collisions for the StatefulSet. The StatefulSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision.
    - conditions::Vector{IoK8sApiAppsV1beta1StatefulSetCondition} : Represents the latest available observations of a statefulset&#39;s current state.
    - currentReplicas::Int64 : currentReplicas is the number of Pods created by the StatefulSet controller from the StatefulSet version indicated by currentRevision.
    - currentRevision::String : currentRevision, if not empty, indicates the version of the StatefulSet used to generate Pods in the sequence [0,currentReplicas).
    - observedGeneration::Int64 : observedGeneration is the most recent generation observed for this StatefulSet. It corresponds to the StatefulSet&#39;s generation, which is updated on mutation by the API Server.
    - readyReplicas::Int64 : readyReplicas is the number of Pods created by the StatefulSet controller that have a Ready Condition.
    - replicas::Int64 : replicas is the number of Pods created by the StatefulSet controller.
    - updateRevision::String : updateRevision, if not empty, indicates the version of the StatefulSet used to generate Pods in the sequence [replicas-updatedReplicas,replicas)
    - updatedReplicas::Int64 : updatedReplicas is the number of Pods created by the StatefulSet controller from the StatefulSet version indicated by updateRevision.
"""
Base.@kwdef mutable struct IoK8sApiAppsV1beta1StatefulSetStatus <: OpenAPI.APIModel
    collisionCount::Union{Nothing, Int64} = nothing
    conditions::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiAppsV1beta1StatefulSetCondition} }
    currentReplicas::Union{Nothing, Int64} = nothing
    currentRevision::Union{Nothing, String} = nothing
    observedGeneration::Union{Nothing, Int64} = nothing
    readyReplicas::Union{Nothing, Int64} = nothing
    replicas::Union{Nothing, Int64} = nothing
    updateRevision::Union{Nothing, String} = nothing
    updatedReplicas::Union{Nothing, Int64} = nothing

    function IoK8sApiAppsV1beta1StatefulSetStatus(collisionCount, conditions, currentReplicas, currentRevision, observedGeneration, readyReplicas, replicas, updateRevision, updatedReplicas, )
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetStatus, Symbol("collisionCount"), collisionCount)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetStatus, Symbol("conditions"), conditions)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetStatus, Symbol("currentReplicas"), currentReplicas)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetStatus, Symbol("currentRevision"), currentRevision)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetStatus, Symbol("observedGeneration"), observedGeneration)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetStatus, Symbol("readyReplicas"), readyReplicas)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetStatus, Symbol("replicas"), replicas)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetStatus, Symbol("updateRevision"), updateRevision)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetStatus, Symbol("updatedReplicas"), updatedReplicas)
        return new(collisionCount, conditions, currentReplicas, currentRevision, observedGeneration, readyReplicas, replicas, updateRevision, updatedReplicas, )
    end
end # type IoK8sApiAppsV1beta1StatefulSetStatus

const _property_types_IoK8sApiAppsV1beta1StatefulSetStatus = Dict{Symbol,String}(Symbol("collisionCount")=>"Int64", Symbol("conditions")=>"Vector{IoK8sApiAppsV1beta1StatefulSetCondition}", Symbol("currentReplicas")=>"Int64", Symbol("currentRevision")=>"String", Symbol("observedGeneration")=>"Int64", Symbol("readyReplicas")=>"Int64", Symbol("replicas")=>"Int64", Symbol("updateRevision")=>"String", Symbol("updatedReplicas")=>"Int64", )
OpenAPI.property_type(::Type{ IoK8sApiAppsV1beta1StatefulSetStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1beta1StatefulSetStatus[name]))}

function check_required(o::IoK8sApiAppsV1beta1StatefulSetStatus)
    o.replicas === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAppsV1beta1StatefulSetStatus }, name::Symbol, val)
    if name === Symbol("collisionCount")
        OpenAPI.validate_param(name, "IoK8sApiAppsV1beta1StatefulSetStatus", :format, val, "int32")
    end
    if name === Symbol("currentReplicas")
        OpenAPI.validate_param(name, "IoK8sApiAppsV1beta1StatefulSetStatus", :format, val, "int32")
    end
    if name === Symbol("observedGeneration")
        OpenAPI.validate_param(name, "IoK8sApiAppsV1beta1StatefulSetStatus", :format, val, "int64")
    end
    if name === Symbol("readyReplicas")
        OpenAPI.validate_param(name, "IoK8sApiAppsV1beta1StatefulSetStatus", :format, val, "int32")
    end
    if name === Symbol("replicas")
        OpenAPI.validate_param(name, "IoK8sApiAppsV1beta1StatefulSetStatus", :format, val, "int32")
    end
    if name === Symbol("updatedReplicas")
        OpenAPI.validate_param(name, "IoK8sApiAppsV1beta1StatefulSetStatus", :format, val, "int32")
    end
end
