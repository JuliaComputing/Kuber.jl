# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.Taint
The node this Taint is attached to has the \&quot;effect\&quot; on any pod that does not tolerate the Taint.

    IoK8sApiCoreV1Taint(;
        effect=nothing,
        key=nothing,
        timeAdded=nothing,
        value=nothing,
    )

    - effect::String : Required. The effect of the taint on pods that do not tolerate the taint. Valid effects are NoSchedule, PreferNoSchedule and NoExecute.
    - key::String : Required. The taint key to be applied to a node.
    - timeAdded::ZonedDateTime : Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
    - value::String : Required. The taint value corresponding to the taint key.
"""
Base.@kwdef mutable struct IoK8sApiCoreV1Taint <: OpenAPI.APIModel
    effect::Union{Nothing, String} = nothing
    key::Union{Nothing, String} = nothing
    timeAdded::Union{Nothing, ZonedDateTime} = nothing
    value::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1Taint(effect, key, timeAdded, value, )
        OpenAPI.validate_property(IoK8sApiCoreV1Taint, Symbol("effect"), effect)
        OpenAPI.validate_property(IoK8sApiCoreV1Taint, Symbol("key"), key)
        OpenAPI.validate_property(IoK8sApiCoreV1Taint, Symbol("timeAdded"), timeAdded)
        OpenAPI.validate_property(IoK8sApiCoreV1Taint, Symbol("value"), value)
        return new(effect, key, timeAdded, value, )
    end
end # type IoK8sApiCoreV1Taint

const _property_types_IoK8sApiCoreV1Taint = Dict{Symbol,String}(Symbol("effect")=>"String", Symbol("key")=>"String", Symbol("timeAdded")=>"ZonedDateTime", Symbol("value")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1Taint }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1Taint[name]))}

function check_required(o::IoK8sApiCoreV1Taint)
    o.effect === nothing && (return false)
    o.key === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1Taint }, name::Symbol, val)
    if name === Symbol("timeAdded")
        OpenAPI.validate_param(name, "IoK8sApiCoreV1Taint", :format, val, "date-time")
    end
end
