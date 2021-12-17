# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""ResourceRule is the list of actions the subject is allowed to perform on resources. The list ordering isn&#39;t significant, may contain duplicates, and possibly be incomplete.

    IoK8sApiAuthorizationV1ResourceRule(;
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
mutable struct IoK8sApiAuthorizationV1ResourceRule <: SwaggerModel
    apiGroups::Any # spec type: Union{ Nothing, Vector{String} } # spec name: apiGroups
    resourceNames::Any # spec type: Union{ Nothing, Vector{String} } # spec name: resourceNames
    resources::Any # spec type: Union{ Nothing, Vector{String} } # spec name: resources
    verbs::Any # spec type: Union{ Nothing, Vector{String} } # spec name: verbs

    function IoK8sApiAuthorizationV1ResourceRule(;apiGroups=nothing, resourceNames=nothing, resources=nothing, verbs=nothing)
        o = new()
        validate_property(IoK8sApiAuthorizationV1ResourceRule, Symbol("apiGroups"), apiGroups)
        setfield!(o, Symbol("apiGroups"), apiGroups)
        validate_property(IoK8sApiAuthorizationV1ResourceRule, Symbol("resourceNames"), resourceNames)
        setfield!(o, Symbol("resourceNames"), resourceNames)
        validate_property(IoK8sApiAuthorizationV1ResourceRule, Symbol("resources"), resources)
        setfield!(o, Symbol("resources"), resources)
        validate_property(IoK8sApiAuthorizationV1ResourceRule, Symbol("verbs"), verbs)
        setfield!(o, Symbol("verbs"), verbs)
        o
    end
end # type IoK8sApiAuthorizationV1ResourceRule

const _property_map_IoK8sApiAuthorizationV1ResourceRule = Dict{Symbol,Symbol}(Symbol("apiGroups")=>Symbol("apiGroups"), Symbol("resourceNames")=>Symbol("resourceNames"), Symbol("resources")=>Symbol("resources"), Symbol("verbs")=>Symbol("verbs"))
const _property_types_IoK8sApiAuthorizationV1ResourceRule = Dict{Symbol,String}(Symbol("apiGroups")=>"Vector{String}", Symbol("resourceNames")=>"Vector{String}", Symbol("resources")=>"Vector{String}", Symbol("verbs")=>"Vector{String}")
Base.propertynames(::Type{ IoK8sApiAuthorizationV1ResourceRule }) = collect(keys(_property_map_IoK8sApiAuthorizationV1ResourceRule))
Swagger.property_type(::Type{ IoK8sApiAuthorizationV1ResourceRule }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthorizationV1ResourceRule[name]))}
Swagger.field_name(::Type{ IoK8sApiAuthorizationV1ResourceRule }, property_name::Symbol) =  _property_map_IoK8sApiAuthorizationV1ResourceRule[property_name]

function check_required(o::IoK8sApiAuthorizationV1ResourceRule)
    (getproperty(o, Symbol("verbs")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAuthorizationV1ResourceRule }, name::Symbol, val)
end
