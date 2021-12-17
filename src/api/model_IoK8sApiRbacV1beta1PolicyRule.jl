# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""PolicyRule holds information that describes a policy rule, but does not contain information about who the rule applies to or which namespace the rule applies to.

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
mutable struct IoK8sApiRbacV1beta1PolicyRule <: SwaggerModel
    apiGroups::Any # spec type: Union{ Nothing, Vector{String} } # spec name: apiGroups
    nonResourceURLs::Any # spec type: Union{ Nothing, Vector{String} } # spec name: nonResourceURLs
    resourceNames::Any # spec type: Union{ Nothing, Vector{String} } # spec name: resourceNames
    resources::Any # spec type: Union{ Nothing, Vector{String} } # spec name: resources
    verbs::Any # spec type: Union{ Nothing, Vector{String} } # spec name: verbs

    function IoK8sApiRbacV1beta1PolicyRule(;apiGroups=nothing, nonResourceURLs=nothing, resourceNames=nothing, resources=nothing, verbs=nothing)
        o = new()
        validate_property(IoK8sApiRbacV1beta1PolicyRule, Symbol("apiGroups"), apiGroups)
        setfield!(o, Symbol("apiGroups"), apiGroups)
        validate_property(IoK8sApiRbacV1beta1PolicyRule, Symbol("nonResourceURLs"), nonResourceURLs)
        setfield!(o, Symbol("nonResourceURLs"), nonResourceURLs)
        validate_property(IoK8sApiRbacV1beta1PolicyRule, Symbol("resourceNames"), resourceNames)
        setfield!(o, Symbol("resourceNames"), resourceNames)
        validate_property(IoK8sApiRbacV1beta1PolicyRule, Symbol("resources"), resources)
        setfield!(o, Symbol("resources"), resources)
        validate_property(IoK8sApiRbacV1beta1PolicyRule, Symbol("verbs"), verbs)
        setfield!(o, Symbol("verbs"), verbs)
        o
    end
end # type IoK8sApiRbacV1beta1PolicyRule

const _property_map_IoK8sApiRbacV1beta1PolicyRule = Dict{Symbol,Symbol}(Symbol("apiGroups")=>Symbol("apiGroups"), Symbol("nonResourceURLs")=>Symbol("nonResourceURLs"), Symbol("resourceNames")=>Symbol("resourceNames"), Symbol("resources")=>Symbol("resources"), Symbol("verbs")=>Symbol("verbs"))
const _property_types_IoK8sApiRbacV1beta1PolicyRule = Dict{Symbol,String}(Symbol("apiGroups")=>"Vector{String}", Symbol("nonResourceURLs")=>"Vector{String}", Symbol("resourceNames")=>"Vector{String}", Symbol("resources")=>"Vector{String}", Symbol("verbs")=>"Vector{String}")
Base.propertynames(::Type{ IoK8sApiRbacV1beta1PolicyRule }) = collect(keys(_property_map_IoK8sApiRbacV1beta1PolicyRule))
Swagger.property_type(::Type{ IoK8sApiRbacV1beta1PolicyRule }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiRbacV1beta1PolicyRule[name]))}
Swagger.field_name(::Type{ IoK8sApiRbacV1beta1PolicyRule }, property_name::Symbol) =  _property_map_IoK8sApiRbacV1beta1PolicyRule[property_name]

function check_required(o::IoK8sApiRbacV1beta1PolicyRule)
    (getproperty(o, Symbol("verbs")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiRbacV1beta1PolicyRule }, name::Symbol, val)
end
