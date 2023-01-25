# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.PodAffinityTerm
Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-located is defined as running on a node whose value of the label with key &lt;topologyKey&gt; matches that of any node on which a pod of the set of pods is running

    IoK8sApiCoreV1PodAffinityTerm(;
        labelSelector=nothing,
        namespaces=nothing,
        topologyKey=nothing,
    )

    - labelSelector::IoK8sApimachineryPkgApisMetaV1LabelSelector
    - namespaces::Vector{String} : namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means \&quot;this pod&#39;s namespace\&quot;
    - topologyKey::String : This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed.
"""
Base.@kwdef mutable struct IoK8sApiCoreV1PodAffinityTerm <: OpenAPI.APIModel
    labelSelector = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector }
    namespaces::Union{Nothing, Vector{String}} = nothing
    topologyKey::Union{Nothing, String} = nothing

    function IoK8sApiCoreV1PodAffinityTerm(labelSelector, namespaces, topologyKey, )
        OpenAPI.validate_property(IoK8sApiCoreV1PodAffinityTerm, Symbol("labelSelector"), labelSelector)
        OpenAPI.validate_property(IoK8sApiCoreV1PodAffinityTerm, Symbol("namespaces"), namespaces)
        OpenAPI.validate_property(IoK8sApiCoreV1PodAffinityTerm, Symbol("topologyKey"), topologyKey)
        return new(labelSelector, namespaces, topologyKey, )
    end
end # type IoK8sApiCoreV1PodAffinityTerm

const _property_types_IoK8sApiCoreV1PodAffinityTerm = Dict{Symbol,String}(Symbol("labelSelector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("namespaces")=>"Vector{String}", Symbol("topologyKey")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1PodAffinityTerm }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1PodAffinityTerm[name]))}

function check_required(o::IoK8sApiCoreV1PodAffinityTerm)
    o.topologyKey === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1PodAffinityTerm }, name::Symbol, val)
end