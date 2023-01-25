# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.admissionregistration.v1.RuleWithOperations
RuleWithOperations is a tuple of Operations and Resources. It is recommended to make sure that all the tuple expansions are valid.

    IoK8sApiAdmissionregistrationV1RuleWithOperations(;
        apiGroups=nothing,
        apiVersions=nothing,
        operations=nothing,
        resources=nothing,
        scope=nothing,
    )

    - apiGroups::Vector{String} : APIGroups is the API groups the resources belong to. &#39;*&#39; is all groups. If &#39;*&#39; is present, the length of the slice must be one. Required.
    - apiVersions::Vector{String} : APIVersions is the API versions the resources belong to. &#39;*&#39; is all versions. If &#39;*&#39; is present, the length of the slice must be one. Required.
    - operations::Vector{String} : Operations is the operations the admission hook cares about - CREATE, UPDATE, or * for all operations. If &#39;*&#39; is present, the length of the slice must be one. Required.
    - resources::Vector{String} : Resources is a list of resources this rule applies to.  For example: &#39;pods&#39; means pods. &#39;pods/log&#39; means the log subresource of pods. &#39;*&#39; means all resources, but not subresources. &#39;pods/*&#39; means all subresources of pods. &#39;*/scale&#39; means all scale subresources. &#39;*/*&#39; means all resources and their subresources.  If wildcard is present, the validation rule will ensure resources do not overlap with each other.  Depending on the enclosing object, subresources might not be allowed. Required.
    - scope::String : scope specifies the scope of this rule. Valid values are \&quot;Cluster\&quot;, \&quot;Namespaced\&quot;, and \&quot;*\&quot; \&quot;Cluster\&quot; means that only cluster-scoped resources will match this rule. Namespace API objects are cluster-scoped. \&quot;Namespaced\&quot; means that only namespaced resources will match this rule. \&quot;*\&quot; means that there are no scope restrictions. Subresources match the scope of their parent resource. Default is \&quot;*\&quot;.
"""
Base.@kwdef mutable struct IoK8sApiAdmissionregistrationV1RuleWithOperations <: OpenAPI.APIModel
    apiGroups::Union{Nothing, Vector{String}} = nothing
    apiVersions::Union{Nothing, Vector{String}} = nothing
    operations::Union{Nothing, Vector{String}} = nothing
    resources::Union{Nothing, Vector{String}} = nothing
    scope::Union{Nothing, String} = nothing

    function IoK8sApiAdmissionregistrationV1RuleWithOperations(apiGroups, apiVersions, operations, resources, scope, )
        OpenAPI.validate_property(IoK8sApiAdmissionregistrationV1RuleWithOperations, Symbol("apiGroups"), apiGroups)
        OpenAPI.validate_property(IoK8sApiAdmissionregistrationV1RuleWithOperations, Symbol("apiVersions"), apiVersions)
        OpenAPI.validate_property(IoK8sApiAdmissionregistrationV1RuleWithOperations, Symbol("operations"), operations)
        OpenAPI.validate_property(IoK8sApiAdmissionregistrationV1RuleWithOperations, Symbol("resources"), resources)
        OpenAPI.validate_property(IoK8sApiAdmissionregistrationV1RuleWithOperations, Symbol("scope"), scope)
        return new(apiGroups, apiVersions, operations, resources, scope, )
    end
end # type IoK8sApiAdmissionregistrationV1RuleWithOperations

const _property_types_IoK8sApiAdmissionregistrationV1RuleWithOperations = Dict{Symbol,String}(Symbol("apiGroups")=>"Vector{String}", Symbol("apiVersions")=>"Vector{String}", Symbol("operations")=>"Vector{String}", Symbol("resources")=>"Vector{String}", Symbol("scope")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiAdmissionregistrationV1RuleWithOperations }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAdmissionregistrationV1RuleWithOperations[name]))}

function check_required(o::IoK8sApiAdmissionregistrationV1RuleWithOperations)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAdmissionregistrationV1RuleWithOperations }, name::Symbol, val)
end