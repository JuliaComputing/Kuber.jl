# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.apps.v1beta2.ScaleStatus
ScaleStatus represents the current status of a scale subresource.

    IoK8sApiAppsV1beta2ScaleStatus(;
        replicas=nothing,
        selector=nothing,
        targetSelector=nothing,
    )

    - replicas::Int64 : actual number of observed instances of the scaled object.
    - selector::Dict{String, String} : label query over pods that should match the replicas count. More info: http://kubernetes.io/docs/user-guide/labels#label-selectors
    - targetSelector::String : label selector for pods that should match the replicas count. This is a serializated version of both map-based and more expressive set-based selectors. This is done to avoid introspection in the clients. The string will be in the same format as the query-param syntax. If the target type only supports map-based selectors, both this field and map-based selector field are populated. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
"""
Base.@kwdef mutable struct IoK8sApiAppsV1beta2ScaleStatus <: OpenAPI.APIModel
    replicas::Union{Nothing, Int64} = nothing
    selector::Union{Nothing, Dict{String, String}} = nothing
    targetSelector::Union{Nothing, String} = nothing

    function IoK8sApiAppsV1beta2ScaleStatus(replicas, selector, targetSelector, )
        OpenAPI.validate_property(IoK8sApiAppsV1beta2ScaleStatus, Symbol("replicas"), replicas)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2ScaleStatus, Symbol("selector"), selector)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2ScaleStatus, Symbol("targetSelector"), targetSelector)
        return new(replicas, selector, targetSelector, )
    end
end # type IoK8sApiAppsV1beta2ScaleStatus

const _property_types_IoK8sApiAppsV1beta2ScaleStatus = Dict{Symbol,String}(Symbol("replicas")=>"Int64", Symbol("selector")=>"Dict{String, String}", Symbol("targetSelector")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiAppsV1beta2ScaleStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1beta2ScaleStatus[name]))}

function check_required(o::IoK8sApiAppsV1beta2ScaleStatus)
    o.replicas === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAppsV1beta2ScaleStatus }, name::Symbol, val)
    if name === Symbol("replicas")
        OpenAPI.validate_param(name, "IoK8sApiAppsV1beta2ScaleStatus", :format, val, "int32")
    end
end