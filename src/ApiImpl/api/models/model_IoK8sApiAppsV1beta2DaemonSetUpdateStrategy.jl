# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.apps.v1beta2.DaemonSetUpdateStrategy
DaemonSetUpdateStrategy is a struct used to control the update strategy for a DaemonSet.

    IoK8sApiAppsV1beta2DaemonSetUpdateStrategy(;
        rollingUpdate=nothing,
        type=nothing,
    )

    - rollingUpdate::IoK8sApiAppsV1beta2RollingUpdateDaemonSet
    - type::String : Type of daemon set update. Can be \&quot;RollingUpdate\&quot; or \&quot;OnDelete\&quot;. Default is RollingUpdate.
"""
Base.@kwdef mutable struct IoK8sApiAppsV1beta2DaemonSetUpdateStrategy <: OpenAPI.APIModel
    rollingUpdate = nothing # spec type: Union{ Nothing, IoK8sApiAppsV1beta2RollingUpdateDaemonSet }
    type::Union{Nothing, String} = nothing

    function IoK8sApiAppsV1beta2DaemonSetUpdateStrategy(rollingUpdate, type, )
        OpenAPI.validate_property(IoK8sApiAppsV1beta2DaemonSetUpdateStrategy, Symbol("rollingUpdate"), rollingUpdate)
        OpenAPI.validate_property(IoK8sApiAppsV1beta2DaemonSetUpdateStrategy, Symbol("type"), type)
        return new(rollingUpdate, type, )
    end
end # type IoK8sApiAppsV1beta2DaemonSetUpdateStrategy

const _property_types_IoK8sApiAppsV1beta2DaemonSetUpdateStrategy = Dict{Symbol,String}(Symbol("rollingUpdate")=>"IoK8sApiAppsV1beta2RollingUpdateDaemonSet", Symbol("type")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiAppsV1beta2DaemonSetUpdateStrategy }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1beta2DaemonSetUpdateStrategy[name]))}

function check_required(o::IoK8sApiAppsV1beta2DaemonSetUpdateStrategy)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAppsV1beta2DaemonSetUpdateStrategy }, name::Symbol, val)
end