# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.autoscaling.v1.HorizontalPodAutoscalerStatus
current status of a horizontal pod autoscaler

    IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus(;
        currentCPUUtilizationPercentage=nothing,
        currentReplicas=nothing,
        desiredReplicas=nothing,
        lastScaleTime=nothing,
        observedGeneration=nothing,
    )

    - currentCPUUtilizationPercentage::Int64 : current average CPU utilization over all pods, represented as a percentage of requested CPU, e.g. 70 means that an average pod is using now 70% of its requested CPU.
    - currentReplicas::Int64 : current number of replicas of pods managed by this autoscaler.
    - desiredReplicas::Int64 : desired number of replicas of pods managed by this autoscaler.
    - lastScaleTime::ZonedDateTime : Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
    - observedGeneration::Int64 : most recent generation observed by this autoscaler.
"""
Base.@kwdef mutable struct IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus <: OpenAPI.APIModel
    currentCPUUtilizationPercentage::Union{Nothing, Int64} = nothing
    currentReplicas::Union{Nothing, Int64} = nothing
    desiredReplicas::Union{Nothing, Int64} = nothing
    lastScaleTime::Union{Nothing, ZonedDateTime} = nothing
    observedGeneration::Union{Nothing, Int64} = nothing

    function IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus(currentCPUUtilizationPercentage, currentReplicas, desiredReplicas, lastScaleTime, observedGeneration, )
        OpenAPI.validate_property(IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus, Symbol("currentCPUUtilizationPercentage"), currentCPUUtilizationPercentage)
        OpenAPI.validate_property(IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus, Symbol("currentReplicas"), currentReplicas)
        OpenAPI.validate_property(IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus, Symbol("desiredReplicas"), desiredReplicas)
        OpenAPI.validate_property(IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus, Symbol("lastScaleTime"), lastScaleTime)
        OpenAPI.validate_property(IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus, Symbol("observedGeneration"), observedGeneration)
        return new(currentCPUUtilizationPercentage, currentReplicas, desiredReplicas, lastScaleTime, observedGeneration, )
    end
end # type IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus

const _property_types_IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus = Dict{Symbol,String}(Symbol("currentCPUUtilizationPercentage")=>"Int64", Symbol("currentReplicas")=>"Int64", Symbol("desiredReplicas")=>"Int64", Symbol("lastScaleTime")=>"ZonedDateTime", Symbol("observedGeneration")=>"Int64", )
OpenAPI.property_type(::Type{ IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus[name]))}

function check_required(o::IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus)
    o.currentReplicas === nothing && (return false)
    o.desiredReplicas === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus }, name::Symbol, val)
    if name === Symbol("currentCPUUtilizationPercentage")
        OpenAPI.validate_param(name, "IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus", :format, val, "int32")
    end
    if name === Symbol("currentReplicas")
        OpenAPI.validate_param(name, "IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus", :format, val, "int32")
    end
    if name === Symbol("desiredReplicas")
        OpenAPI.validate_param(name, "IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus", :format, val, "int32")
    end
    if name === Symbol("lastScaleTime")
        OpenAPI.validate_param(name, "IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus", :format, val, "date-time")
    end
    if name === Symbol("observedGeneration")
        OpenAPI.validate_param(name, "IoK8sApiAutoscalingV1HorizontalPodAutoscalerStatus", :format, val, "int64")
    end
end
