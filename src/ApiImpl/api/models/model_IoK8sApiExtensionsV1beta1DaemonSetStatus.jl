# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.extensions.v1beta1.DaemonSetStatus
DaemonSetStatus represents the current status of a daemon set.

    IoK8sApiExtensionsV1beta1DaemonSetStatus(;
        collisionCount=nothing,
        conditions=nothing,
        currentNumberScheduled=nothing,
        desiredNumberScheduled=nothing,
        numberAvailable=nothing,
        numberMisscheduled=nothing,
        numberReady=nothing,
        numberUnavailable=nothing,
        observedGeneration=nothing,
        updatedNumberScheduled=nothing,
    )

    - collisionCount::Int64 : Count of hash collisions for the DaemonSet. The DaemonSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision.
    - conditions::Vector{IoK8sApiExtensionsV1beta1DaemonSetCondition} : Represents the latest available observations of a DaemonSet&#39;s current state.
    - currentNumberScheduled::Int64 : The number of nodes that are running at least 1 daemon pod and are supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
    - desiredNumberScheduled::Int64 : The total number of nodes that should be running the daemon pod (including nodes correctly running the daemon pod). More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
    - numberAvailable::Int64 : The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and available (ready for at least spec.minReadySeconds)
    - numberMisscheduled::Int64 : The number of nodes that are running the daemon pod, but are not supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
    - numberReady::Int64 : The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and ready.
    - numberUnavailable::Int64 : The number of nodes that should be running the daemon pod and have none of the daemon pod running and available (ready for at least spec.minReadySeconds)
    - observedGeneration::Int64 : The most recent generation observed by the daemon set controller.
    - updatedNumberScheduled::Int64 : The total number of nodes that are running updated daemon pod
"""
Base.@kwdef mutable struct IoK8sApiExtensionsV1beta1DaemonSetStatus <: OpenAPI.APIModel
    collisionCount::Union{Nothing, Int64} = nothing
    conditions::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiExtensionsV1beta1DaemonSetCondition} }
    currentNumberScheduled::Union{Nothing, Int64} = nothing
    desiredNumberScheduled::Union{Nothing, Int64} = nothing
    numberAvailable::Union{Nothing, Int64} = nothing
    numberMisscheduled::Union{Nothing, Int64} = nothing
    numberReady::Union{Nothing, Int64} = nothing
    numberUnavailable::Union{Nothing, Int64} = nothing
    observedGeneration::Union{Nothing, Int64} = nothing
    updatedNumberScheduled::Union{Nothing, Int64} = nothing

    function IoK8sApiExtensionsV1beta1DaemonSetStatus(collisionCount, conditions, currentNumberScheduled, desiredNumberScheduled, numberAvailable, numberMisscheduled, numberReady, numberUnavailable, observedGeneration, updatedNumberScheduled, )
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DaemonSetStatus, Symbol("collisionCount"), collisionCount)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DaemonSetStatus, Symbol("conditions"), conditions)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DaemonSetStatus, Symbol("currentNumberScheduled"), currentNumberScheduled)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DaemonSetStatus, Symbol("desiredNumberScheduled"), desiredNumberScheduled)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DaemonSetStatus, Symbol("numberAvailable"), numberAvailable)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DaemonSetStatus, Symbol("numberMisscheduled"), numberMisscheduled)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DaemonSetStatus, Symbol("numberReady"), numberReady)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DaemonSetStatus, Symbol("numberUnavailable"), numberUnavailable)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DaemonSetStatus, Symbol("observedGeneration"), observedGeneration)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DaemonSetStatus, Symbol("updatedNumberScheduled"), updatedNumberScheduled)
        return new(collisionCount, conditions, currentNumberScheduled, desiredNumberScheduled, numberAvailable, numberMisscheduled, numberReady, numberUnavailable, observedGeneration, updatedNumberScheduled, )
    end
end # type IoK8sApiExtensionsV1beta1DaemonSetStatus

const _property_types_IoK8sApiExtensionsV1beta1DaemonSetStatus = Dict{Symbol,String}(Symbol("collisionCount")=>"Int64", Symbol("conditions")=>"Vector{IoK8sApiExtensionsV1beta1DaemonSetCondition}", Symbol("currentNumberScheduled")=>"Int64", Symbol("desiredNumberScheduled")=>"Int64", Symbol("numberAvailable")=>"Int64", Symbol("numberMisscheduled")=>"Int64", Symbol("numberReady")=>"Int64", Symbol("numberUnavailable")=>"Int64", Symbol("observedGeneration")=>"Int64", Symbol("updatedNumberScheduled")=>"Int64", )
OpenAPI.property_type(::Type{ IoK8sApiExtensionsV1beta1DaemonSetStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1DaemonSetStatus[name]))}

function check_required(o::IoK8sApiExtensionsV1beta1DaemonSetStatus)
    o.currentNumberScheduled === nothing && (return false)
    o.desiredNumberScheduled === nothing && (return false)
    o.numberMisscheduled === nothing && (return false)
    o.numberReady === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiExtensionsV1beta1DaemonSetStatus }, name::Symbol, val)
    if name === Symbol("collisionCount")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1DaemonSetStatus", :format, val, "int32")
    end
    if name === Symbol("currentNumberScheduled")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1DaemonSetStatus", :format, val, "int32")
    end
    if name === Symbol("desiredNumberScheduled")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1DaemonSetStatus", :format, val, "int32")
    end
    if name === Symbol("numberAvailable")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1DaemonSetStatus", :format, val, "int32")
    end
    if name === Symbol("numberMisscheduled")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1DaemonSetStatus", :format, val, "int32")
    end
    if name === Symbol("numberReady")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1DaemonSetStatus", :format, val, "int32")
    end
    if name === Symbol("numberUnavailable")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1DaemonSetStatus", :format, val, "int32")
    end
    if name === Symbol("observedGeneration")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1DaemonSetStatus", :format, val, "int64")
    end
    if name === Symbol("updatedNumberScheduled")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1DaemonSetStatus", :format, val, "int32")
    end
end
