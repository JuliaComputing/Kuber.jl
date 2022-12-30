# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.extensions.v1beta1.DeploymentRollback
DEPRECATED. DeploymentRollback stores the information required to rollback a deployment.

    IoK8sApiExtensionsV1beta1DeploymentRollback(;
        apiVersion=nothing,
        kind=nothing,
        name=nothing,
        rollbackTo=nothing,
        updatedAnnotations=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - name::String : Required: This must match the Name of a deployment.
    - rollbackTo::IoK8sApiExtensionsV1beta1RollbackConfig
    - updatedAnnotations::Dict{String, String} : The annotations to be updated to a deployment
"""
Base.@kwdef mutable struct IoK8sApiExtensionsV1beta1DeploymentRollback <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    kind::Union{Nothing, String} = nothing
    name::Union{Nothing, String} = nothing
    rollbackTo = nothing # spec type: Union{ Nothing, IoK8sApiExtensionsV1beta1RollbackConfig }
    updatedAnnotations::Union{Nothing, Dict{String, String}} = nothing

    function IoK8sApiExtensionsV1beta1DeploymentRollback(apiVersion, kind, name, rollbackTo, updatedAnnotations, )
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DeploymentRollback, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DeploymentRollback, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DeploymentRollback, Symbol("name"), name)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DeploymentRollback, Symbol("rollbackTo"), rollbackTo)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1DeploymentRollback, Symbol("updatedAnnotations"), updatedAnnotations)
        return new(apiVersion, kind, name, rollbackTo, updatedAnnotations, )
    end
end # type IoK8sApiExtensionsV1beta1DeploymentRollback

const _property_types_IoK8sApiExtensionsV1beta1DeploymentRollback = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("name")=>"String", Symbol("rollbackTo")=>"IoK8sApiExtensionsV1beta1RollbackConfig", Symbol("updatedAnnotations")=>"Dict{String, String}", )
OpenAPI.property_type(::Type{ IoK8sApiExtensionsV1beta1DeploymentRollback }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1DeploymentRollback[name]))}

function check_required(o::IoK8sApiExtensionsV1beta1DeploymentRollback)
    o.name === nothing && (return false)
    o.rollbackTo === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiExtensionsV1beta1DeploymentRollback }, name::Symbol, val)
end
