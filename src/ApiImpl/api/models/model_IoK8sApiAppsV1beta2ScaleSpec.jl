# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.apps.v1beta2.ScaleSpec
ScaleSpec describes the attributes of a scale subresource

    IoK8sApiAppsV1beta2ScaleSpec(;
        replicas=nothing,
    )

    - replicas::Int64 : desired number of instances for the scaled object.
"""
Base.@kwdef mutable struct IoK8sApiAppsV1beta2ScaleSpec <: OpenAPI.APIModel
    replicas::Union{Nothing, Int64} = nothing

    function IoK8sApiAppsV1beta2ScaleSpec(replicas, )
        OpenAPI.validate_property(IoK8sApiAppsV1beta2ScaleSpec, Symbol("replicas"), replicas)
        return new(replicas, )
    end
end # type IoK8sApiAppsV1beta2ScaleSpec

const _property_types_IoK8sApiAppsV1beta2ScaleSpec = Dict{Symbol,String}(Symbol("replicas")=>"Int64", )
OpenAPI.property_type(::Type{ IoK8sApiAppsV1beta2ScaleSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1beta2ScaleSpec[name]))}

function check_required(o::IoK8sApiAppsV1beta2ScaleSpec)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAppsV1beta2ScaleSpec }, name::Symbol, val)
    if name === Symbol("replicas")
        OpenAPI.validate_param(name, "IoK8sApiAppsV1beta2ScaleSpec", :format, val, "int32")
    end
end
