# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.autoscaling.v1.HorizontalPodAutoscalerSpec
specification of a horizontal pod autoscaler.

    IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec(;
        maxReplicas=nothing,
        minReplicas=nothing,
        scaleTargetRef=nothing,
        targetCPUUtilizationPercentage=nothing,
    )

    - maxReplicas::Int64 : upper limit for the number of pods that can be set by the autoscaler; cannot be smaller than MinReplicas.
    - minReplicas::Int64 : minReplicas is the lower limit for the number of replicas to which the autoscaler can scale down.  It defaults to 1 pod.  minReplicas is allowed to be 0 if the alpha feature gate HPAScaleToZero is enabled and at least one Object or External metric is configured.  Scaling is active as long as at least one metric value is available.
    - scaleTargetRef::IoK8sApiAutoscalingV1CrossVersionObjectReference
    - targetCPUUtilizationPercentage::Int64 : target average CPU utilization (represented as a percentage of requested CPU) over all the pods; if not specified the default autoscaling policy will be used.
"""
Base.@kwdef mutable struct IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec <: OpenAPI.APIModel
    maxReplicas::Union{Nothing, Int64} = nothing
    minReplicas::Union{Nothing, Int64} = nothing
    scaleTargetRef = nothing # spec type: Union{ Nothing, IoK8sApiAutoscalingV1CrossVersionObjectReference }
    targetCPUUtilizationPercentage::Union{Nothing, Int64} = nothing

    function IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec(maxReplicas, minReplicas, scaleTargetRef, targetCPUUtilizationPercentage, )
        OpenAPI.validate_property(IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec, Symbol("maxReplicas"), maxReplicas)
        OpenAPI.validate_property(IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec, Symbol("minReplicas"), minReplicas)
        OpenAPI.validate_property(IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec, Symbol("scaleTargetRef"), scaleTargetRef)
        OpenAPI.validate_property(IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec, Symbol("targetCPUUtilizationPercentage"), targetCPUUtilizationPercentage)
        return new(maxReplicas, minReplicas, scaleTargetRef, targetCPUUtilizationPercentage, )
    end
end # type IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec

const _property_types_IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec = Dict{Symbol,String}(Symbol("maxReplicas")=>"Int64", Symbol("minReplicas")=>"Int64", Symbol("scaleTargetRef")=>"IoK8sApiAutoscalingV1CrossVersionObjectReference", Symbol("targetCPUUtilizationPercentage")=>"Int64", )
OpenAPI.property_type(::Type{ IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec[name]))}

function check_required(o::IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec)
    o.maxReplicas === nothing && (return false)
    o.scaleTargetRef === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec }, name::Symbol, val)
    if name === Symbol("maxReplicas")
        OpenAPI.validate_param(name, "IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec", :format, val, "int32")
    end
    if name === Symbol("minReplicas")
        OpenAPI.validate_param(name, "IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec", :format, val, "int32")
    end
    if name === Symbol("targetCPUUtilizationPercentage")
        OpenAPI.validate_param(name, "IoK8sApiAutoscalingV1HorizontalPodAutoscalerSpec", :format, val, "int32")
    end
end