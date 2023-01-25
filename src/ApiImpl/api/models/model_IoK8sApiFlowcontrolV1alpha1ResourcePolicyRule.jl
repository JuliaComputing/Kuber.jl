# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.flowcontrol.v1alpha1.ResourcePolicyRule
ResourcePolicyRule is a predicate that matches some resource requests, testing the request&#39;s verb and the target resource. A ResourcePolicyRule matches a resource request if and only if: (a) at least one member of verbs matches the request, (b) at least one member of apiGroups matches the request, (c) at least one member of resources matches the request, and (d) least one member of namespaces matches the request.

    IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule(;
        apiGroups=nothing,
        clusterScope=nothing,
        namespaces=nothing,
        resources=nothing,
        verbs=nothing,
    )

    - apiGroups::Vector{String} : &#x60;apiGroups&#x60; is a list of matching API groups and may not be empty. \&quot;*\&quot; matches all API groups and, if present, must be the only entry. Required.
    - clusterScope::Bool : &#x60;clusterScope&#x60; indicates whether to match requests that do not specify a namespace (which happens either because the resource is not namespaced or the request targets all namespaces). If this field is omitted or false then the &#x60;namespaces&#x60; field must contain a non-empty list.
    - namespaces::Vector{String} : &#x60;namespaces&#x60; is a list of target namespaces that restricts matches.  A request that specifies a target namespace matches only if either (a) this list contains that target namespace or (b) this list contains \&quot;*\&quot;.  Note that \&quot;*\&quot; matches any specified namespace but does not match a request that _does not specify_ a namespace (see the &#x60;clusterScope&#x60; field for that). This list may be empty, but only if &#x60;clusterScope&#x60; is true.
    - resources::Vector{String} : &#x60;resources&#x60; is a list of matching resources (i.e., lowercase and plural) with, if desired, subresource.  For example, [ \&quot;services\&quot;, \&quot;nodes/status\&quot; ].  This list may not be empty. \&quot;*\&quot; matches all resources and, if present, must be the only entry. Required.
    - verbs::Vector{String} : &#x60;verbs&#x60; is a list of matching verbs and may not be empty. \&quot;*\&quot; matches all verbs and, if present, must be the only entry. Required.
"""
Base.@kwdef mutable struct IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule <: OpenAPI.APIModel
    apiGroups::Union{Nothing, Vector{String}} = nothing
    clusterScope::Union{Nothing, Bool} = nothing
    namespaces::Union{Nothing, Vector{String}} = nothing
    resources::Union{Nothing, Vector{String}} = nothing
    verbs::Union{Nothing, Vector{String}} = nothing

    function IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule(apiGroups, clusterScope, namespaces, resources, verbs, )
        OpenAPI.validate_property(IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule, Symbol("apiGroups"), apiGroups)
        OpenAPI.validate_property(IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule, Symbol("clusterScope"), clusterScope)
        OpenAPI.validate_property(IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule, Symbol("namespaces"), namespaces)
        OpenAPI.validate_property(IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule, Symbol("resources"), resources)
        OpenAPI.validate_property(IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule, Symbol("verbs"), verbs)
        return new(apiGroups, clusterScope, namespaces, resources, verbs, )
    end
end # type IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule

const _property_types_IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule = Dict{Symbol,String}(Symbol("apiGroups")=>"Vector{String}", Symbol("clusterScope")=>"Bool", Symbol("namespaces")=>"Vector{String}", Symbol("resources")=>"Vector{String}", Symbol("verbs")=>"Vector{String}", )
OpenAPI.property_type(::Type{ IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule[name]))}

function check_required(o::IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule)
    o.apiGroups === nothing && (return false)
    o.resources === nothing && (return false)
    o.verbs === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule }, name::Symbol, val)
end