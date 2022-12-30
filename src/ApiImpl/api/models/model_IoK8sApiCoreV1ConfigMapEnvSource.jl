# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.core.v1.ConfigMapEnvSource
ConfigMapEnvSource selects a ConfigMap to populate the environment variables with.  The contents of the target ConfigMap&#39;s Data field will represent the key-value pairs as environment variables.

    IoK8sApiCoreV1ConfigMapEnvSource(;
        name=nothing,
        optional=nothing,
    )

    - name::String : Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    - optional::Bool : Specify whether the ConfigMap must be defined
"""
Base.@kwdef mutable struct IoK8sApiCoreV1ConfigMapEnvSource <: OpenAPI.APIModel
    name::Union{Nothing, String} = nothing
    optional::Union{Nothing, Bool} = nothing

    function IoK8sApiCoreV1ConfigMapEnvSource(name, optional, )
        OpenAPI.validate_property(IoK8sApiCoreV1ConfigMapEnvSource, Symbol("name"), name)
        OpenAPI.validate_property(IoK8sApiCoreV1ConfigMapEnvSource, Symbol("optional"), optional)
        return new(name, optional, )
    end
end # type IoK8sApiCoreV1ConfigMapEnvSource

const _property_types_IoK8sApiCoreV1ConfigMapEnvSource = Dict{Symbol,String}(Symbol("name")=>"String", Symbol("optional")=>"Bool", )
OpenAPI.property_type(::Type{ IoK8sApiCoreV1ConfigMapEnvSource }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1ConfigMapEnvSource[name]))}

function check_required(o::IoK8sApiCoreV1ConfigMapEnvSource)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoreV1ConfigMapEnvSource }, name::Symbol, val)
end
