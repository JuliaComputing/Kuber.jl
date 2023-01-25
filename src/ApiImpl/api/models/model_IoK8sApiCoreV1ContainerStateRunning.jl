# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.ContainerStateRunning
ContainerStateRunning is a running state of a container.

    IoK8sApiCoreV1ContainerStateRunning(;
        startedAt=nothing,
    )

    - startedAt::ZonedDateTime : Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
"""
Base.@kwdef mutable struct IoK8sApiCoreV1ContainerStateRunning <: OpenAPI.APIModel
    startedAt::Union{Nothing, ZonedDateTime} = nothing

    function IoK8sApiCoreV1ContainerStateRunning(startedAt, )
        OpenAPI.validate_property(IoK8sApiCoreV1ContainerStateRunning, Symbol("startedAt"), startedAt)
        return new(startedAt, )
    end
end # type IoK8sApiCoreV1ContainerStateRunning

const _property_types_IoK8sApiCoreV1ContainerStateRunning = Dict{Symbol,String}(Symbol("startedAt")=>"ZonedDateTime", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1ContainerStateRunning }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1ContainerStateRunning[name]))}

function check_required(o::IoK8sApiCoreV1ContainerStateRunning)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1ContainerStateRunning }, name::Symbol, val)
    if name === Symbol("startedAt")
        OpenAPI.validate_param(name, "IoK8sApiCoreV1ContainerStateRunning", :format, val, "date-time")
    end
end