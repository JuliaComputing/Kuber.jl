# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.authorization.v1beta1.ResourceRule
ResourceRule is the list of actions the subject is allowed to perform on resources. The list ordering isn&#39;t significant, may contain duplicates, and possibly be incomplete.

    IoK8sApiAuthorizationV1beta1ResourceRule(;
        apiGroups=nothing,
        resourceNames=nothing,
        resources=nothing,
        verbs=nothing,
    )

    - apiGroups::Vector{String} : APIGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.  \&quot;*\&quot; means all.
    - resourceNames::Vector{String} : ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.  \&quot;*\&quot; means all.
    - resources::Vector{String} : Resources is a list of resources this rule applies to.  \&quot;*\&quot; means all in the specified apiGroups.  \&quot;*/foo\&quot; represents the subresource &#39;foo&#39; for all resources in the specified apiGroups.
    - verbs::Vector{String} : Verb is a list of kubernetes resource API verbs, like: get, list, watch, create, update, delete, proxy.  \&quot;*\&quot; means all.
"""
Base.@kwdef mutable struct IoK8sApiAuthorizationV1beta1ResourceRule <: OpenAPI.APIModel
    apiGroups::Union{Nothing, Vector{String}} = nothing
    resourceNames::Union{Nothing, Vector{String}} = nothing
    resources::Union{Nothing, Vector{String}} = nothing
    verbs::Union{Nothing, Vector{String}} = nothing

    function IoK8sApiAuthorizationV1beta1ResourceRule(apiGroups, resourceNames, resources, verbs, )
        OpenAPI.validate_property(IoK8sApiAuthorizationV1beta1ResourceRule, Symbol("apiGroups"), apiGroups)
        OpenAPI.validate_property(IoK8sApiAuthorizationV1beta1ResourceRule, Symbol("resourceNames"), resourceNames)
        OpenAPI.validate_property(IoK8sApiAuthorizationV1beta1ResourceRule, Symbol("resources"), resources)
        OpenAPI.validate_property(IoK8sApiAuthorizationV1beta1ResourceRule, Symbol("verbs"), verbs)
        return new(apiGroups, resourceNames, resources, verbs, )
    end
end # type IoK8sApiAuthorizationV1beta1ResourceRule

const _property_types_IoK8sApiAuthorizationV1beta1ResourceRule = Dict{Symbol,String}(Symbol("apiGroups")=>"Vector{String}", Symbol("resourceNames")=>"Vector{String}", Symbol("resources")=>"Vector{String}", Symbol("verbs")=>"Vector{String}", )
OpenAPI.property_type(::Type{ IoK8sApiAuthorizationV1beta1ResourceRule }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthorizationV1beta1ResourceRule[name]))}

function check_required(o::IoK8sApiAuthorizationV1beta1ResourceRule)
    o.verbs === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAuthorizationV1beta1ResourceRule }, name::Symbol, val)
end