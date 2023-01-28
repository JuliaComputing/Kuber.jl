# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.autoscaling.v1.ScaleStatus
ScaleStatus represents the current status of a scale subresource.

    IoK8sApiAutoscalingV1ScaleStatus(;
        replicas=nothing,
        selector=nothing,
    )

    - replicas::Int64 : actual number of observed instances of the scaled object.
    - selector::String : label query over pods that should match the replicas count. This is same as the label selector but in the string format to avoid introspection by clients. The string will be in the same format as the query-param syntax. More info about label selectors: http://kubernetes.io/docs/user-guide/labels#label-selectors
"""
Base.@kwdef mutable struct IoK8sApiAutoscalingV1ScaleStatus <: OpenAPI.APIModel
    replicas::Union{Nothing, Int64} = nothing
    selector::Union{Nothing, String} = nothing

    function IoK8sApiAutoscalingV1ScaleStatus(replicas, selector, )
        OpenAPI.validate_property(IoK8sApiAutoscalingV1ScaleStatus, Symbol("replicas"), replicas)
        OpenAPI.validate_property(IoK8sApiAutoscalingV1ScaleStatus, Symbol("selector"), selector)
        return new(replicas, selector, )
    end
end # type IoK8sApiAutoscalingV1ScaleStatus

const _property_types_IoK8sApiAutoscalingV1ScaleStatus = Dict{Symbol,String}(Symbol("replicas")=>"Int64", Symbol("selector")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiAutoscalingV1ScaleStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAutoscalingV1ScaleStatus[name]))}

function check_required(o::IoK8sApiAutoscalingV1ScaleStatus)
    o.replicas === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAutoscalingV1ScaleStatus }, name::Symbol, val)
    if name === Symbol("replicas")
        OpenAPI.validate_param(name, "IoK8sApiAutoscalingV1ScaleStatus", :format, val, "int32")
    end
end
