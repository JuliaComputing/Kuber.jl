# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.autoscaling.v2beta1.CrossVersionObjectReference
CrossVersionObjectReference contains enough information to let you identify the referred resource.

    IoK8sApiAutoscalingV2beta1CrossVersionObjectReference(;
        apiVersion=nothing,
        kind=nothing,
        name=nothing,
    )

    - apiVersion::String : API version of the referent
    - kind::String : Kind of the referent; More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds\&quot;
    - name::String : Name of the referent; More info: http://kubernetes.io/docs/user-guide/identifiers#names
"""
Base.@kwdef mutable struct IoK8sApiAutoscalingV2beta1CrossVersionObjectReference <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    kind::Union{Nothing, String} = nothing
    name::Union{Nothing, String} = nothing

    function IoK8sApiAutoscalingV2beta1CrossVersionObjectReference(apiVersion, kind, name, )
        OpenAPI.validate_property(IoK8sApiAutoscalingV2beta1CrossVersionObjectReference, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiAutoscalingV2beta1CrossVersionObjectReference, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiAutoscalingV2beta1CrossVersionObjectReference, Symbol("name"), name)
        return new(apiVersion, kind, name, )
    end
end # type IoK8sApiAutoscalingV2beta1CrossVersionObjectReference

const _property_types_IoK8sApiAutoscalingV2beta1CrossVersionObjectReference = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("name")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiAutoscalingV2beta1CrossVersionObjectReference }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAutoscalingV2beta1CrossVersionObjectReference[name]))}

function check_required(o::IoK8sApiAutoscalingV2beta1CrossVersionObjectReference)
    o.kind === nothing && (return false)
    o.name === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAutoscalingV2beta1CrossVersionObjectReference }, name::Symbol, val)
end
