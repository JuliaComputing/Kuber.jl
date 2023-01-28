# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.rbac.v1beta1.PolicyRule
PolicyRule holds information that describes a policy rule, but does not contain information about who the rule applies to or which namespace the rule applies to.

    IoK8sApiRbacV1beta1PolicyRule(;
        apiGroups=nothing,
        nonResourceURLs=nothing,
        resourceNames=nothing,
        resources=nothing,
        verbs=nothing,
    )

    - apiGroups::Vector{String} : APIGroups is the name of the APIGroup that contains the resources.  If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed.
    - nonResourceURLs::Vector{String} : NonResourceURLs is a set of partial urls that a user should have access to.  *s are allowed, but only as the full, final step in the path Since non-resource URLs are not namespaced, this field is only applicable for ClusterRoles referenced from a ClusterRoleBinding. Rules can either apply to API resources (such as \&quot;pods\&quot; or \&quot;secrets\&quot;) or non-resource URL paths (such as \&quot;/api\&quot;),  but not both.
    - resourceNames::Vector{String} : ResourceNames is an optional white list of names that the rule applies to.  An empty set means that everything is allowed.
    - resources::Vector{String} : Resources is a list of resources this rule applies to.  &#39;*&#39; represents all resources in the specified apiGroups. &#39;*/foo&#39; represents the subresource &#39;foo&#39; for all resources in the specified apiGroups.
    - verbs::Vector{String} : Verbs is a list of Verbs that apply to ALL the ResourceKinds and AttributeRestrictions contained in this rule.  VerbAll represents all kinds.
"""
Base.@kwdef mutable struct IoK8sApiRbacV1beta1PolicyRule <: OpenAPI.APIModel
    apiGroups::Union{Nothing, Vector{String}} = nothing
    nonResourceURLs::Union{Nothing, Vector{String}} = nothing
    resourceNames::Union{Nothing, Vector{String}} = nothing
    resources::Union{Nothing, Vector{String}} = nothing
    verbs::Union{Nothing, Vector{String}} = nothing

    function IoK8sApiRbacV1beta1PolicyRule(apiGroups, nonResourceURLs, resourceNames, resources, verbs, )
        OpenAPI.validate_property(IoK8sApiRbacV1beta1PolicyRule, Symbol("apiGroups"), apiGroups)
        OpenAPI.validate_property(IoK8sApiRbacV1beta1PolicyRule, Symbol("nonResourceURLs"), nonResourceURLs)
        OpenAPI.validate_property(IoK8sApiRbacV1beta1PolicyRule, Symbol("resourceNames"), resourceNames)
        OpenAPI.validate_property(IoK8sApiRbacV1beta1PolicyRule, Symbol("resources"), resources)
        OpenAPI.validate_property(IoK8sApiRbacV1beta1PolicyRule, Symbol("verbs"), verbs)
        return new(apiGroups, nonResourceURLs, resourceNames, resources, verbs, )
    end
end # type IoK8sApiRbacV1beta1PolicyRule

const _property_types_IoK8sApiRbacV1beta1PolicyRule = Dict{Symbol,String}(Symbol("apiGroups")=>"Vector{String}", Symbol("nonResourceURLs")=>"Vector{String}", Symbol("resourceNames")=>"Vector{String}", Symbol("resources")=>"Vector{String}", Symbol("verbs")=>"Vector{String}", )
OpenAPI.property_type(::Type{ IoK8sApiRbacV1beta1PolicyRule }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiRbacV1beta1PolicyRule[name]))}

function check_required(o::IoK8sApiRbacV1beta1PolicyRule)
    o.verbs === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiRbacV1beta1PolicyRule }, name::Symbol, val)
end
