# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.extensions.v1beta1.RollingUpdateDeployment
Spec to control the desired behavior of rolling update.

    IoK8sApiExtensionsV1beta1RollingUpdateDeployment(;
        maxSurge=nothing,
        maxUnavailable=nothing,
    )

    - maxSurge::Any : IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
    - maxUnavailable::Any : IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
"""
Base.@kwdef mutable struct IoK8sApiExtensionsV1beta1RollingUpdateDeployment <: OpenAPI.APIModel
    maxSurge::Union{Nothing, Any} = nothing
    maxUnavailable::Union{Nothing, Any} = nothing

    function IoK8sApiExtensionsV1beta1RollingUpdateDeployment(maxSurge, maxUnavailable, )
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1RollingUpdateDeployment, Symbol("maxSurge"), maxSurge)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1RollingUpdateDeployment, Symbol("maxUnavailable"), maxUnavailable)
        return new(maxSurge, maxUnavailable, )
    end
end # type IoK8sApiExtensionsV1beta1RollingUpdateDeployment

const _property_types_IoK8sApiExtensionsV1beta1RollingUpdateDeployment = Dict{Symbol,String}(Symbol("maxSurge")=>"Any", Symbol("maxUnavailable")=>"Any", )
OpenAPI.property_type(::Type{ IoK8sApiExtensionsV1beta1RollingUpdateDeployment }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1RollingUpdateDeployment[name]))}

function check_required(o::IoK8sApiExtensionsV1beta1RollingUpdateDeployment)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiExtensionsV1beta1RollingUpdateDeployment }, name::Symbol, val)
    if name === Symbol("maxSurge")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1RollingUpdateDeployment", :format, val, "int-or-string")
    end
    if name === Symbol("maxUnavailable")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1RollingUpdateDeployment", :format, val, "int-or-string")
    end
end
