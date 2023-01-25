# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.extensions.v1beta1.RollingUpdateDaemonSet
Spec to control the desired behavior of daemon set rolling update.

    IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet(;
        maxUnavailable=nothing,
    )

    - maxUnavailable::Any : IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
"""
Base.@kwdef mutable struct IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet <: OpenAPI.APIModel
    maxUnavailable::Union{Nothing, Any} = nothing

    function IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet(maxUnavailable, )
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet, Symbol("maxUnavailable"), maxUnavailable)
        return new(maxUnavailable, )
    end
end # type IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet

const _property_types_IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet = Dict{Symbol,String}(Symbol("maxUnavailable")=>"Any", )
OpenAPI.property_type(::Type{ IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet[name]))}

function check_required(o::IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet }, name::Symbol, val)
    if name === Symbol("maxUnavailable")
        OpenAPI.validate_param(name, "IoK8sApiExtensionsV1beta1RollingUpdateDaemonSet", :format, val, "int-or-string")
    end
end