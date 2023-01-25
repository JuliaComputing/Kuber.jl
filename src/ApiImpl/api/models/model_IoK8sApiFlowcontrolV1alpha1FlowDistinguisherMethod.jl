# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.flowcontrol.v1alpha1.FlowDistinguisherMethod
FlowDistinguisherMethod specifies the method of a flow distinguisher.

    IoK8sApiFlowcontrolV1alpha1FlowDistinguisherMethod(;
        type=nothing,
    )

    - type::String : &#x60;type&#x60; is the type of flow distinguisher method The supported types are \&quot;ByUser\&quot; and \&quot;ByNamespace\&quot;. Required.
"""
Base.@kwdef mutable struct IoK8sApiFlowcontrolV1alpha1FlowDistinguisherMethod <: OpenAPI.APIModel
    type::Union{Nothing, String} = nothing

    function IoK8sApiFlowcontrolV1alpha1FlowDistinguisherMethod(type, )
        OpenAPI.validate_property(IoK8sApiFlowcontrolV1alpha1FlowDistinguisherMethod, Symbol("type"), type)
        return new(type, )
    end
end # type IoK8sApiFlowcontrolV1alpha1FlowDistinguisherMethod

const _property_types_IoK8sApiFlowcontrolV1alpha1FlowDistinguisherMethod = Dict{Symbol,String}(Symbol("type")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiFlowcontrolV1alpha1FlowDistinguisherMethod }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiFlowcontrolV1alpha1FlowDistinguisherMethod[name]))}

function check_required(o::IoK8sApiFlowcontrolV1alpha1FlowDistinguisherMethod)
    o.type === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiFlowcontrolV1alpha1FlowDistinguisherMethod }, name::Symbol, val)
end