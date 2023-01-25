# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.policy.v1beta1.PodDisruptionBudgetSpec
PodDisruptionBudgetSpec is a description of a PodDisruptionBudget.

    IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec(;
        maxUnavailable=nothing,
        minAvailable=nothing,
        selector=nothing,
    )

    - maxUnavailable::Any : IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
    - minAvailable::Any : IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
    - selector::IoK8sApimachineryPkgApisMetaV1LabelSelector
"""
Base.@kwdef mutable struct IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec <: OpenAPI.APIModel
    maxUnavailable::Union{Nothing, Any} = nothing
    minAvailable::Union{Nothing, Any} = nothing
    selector = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector }

    function IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec(maxUnavailable, minAvailable, selector, )
        OpenAPI.validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec, Symbol("maxUnavailable"), maxUnavailable)
        OpenAPI.validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec, Symbol("minAvailable"), minAvailable)
        OpenAPI.validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec, Symbol("selector"), selector)
        return new(maxUnavailable, minAvailable, selector, )
    end
end # type IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec

const _property_types_IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec = Dict{Symbol,String}(Symbol("maxUnavailable")=>"Any", Symbol("minAvailable")=>"Any", Symbol("selector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", )
OpenAPI.property_type(::Type{ IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec[name]))}

function check_required(o::IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec }, name::Symbol, val)
    if name === Symbol("maxUnavailable")
        OpenAPI.validate_param(name, "IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec", :format, val, "int-or-string")
    end
    if name === Symbol("minAvailable")
        OpenAPI.validate_param(name, "IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec", :format, val, "int-or-string")
    end
end