# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.extensions.v1beta1.SELinuxStrategyOptions
SELinuxStrategyOptions defines the strategy type and any options used to create the strategy. Deprecated: use SELinuxStrategyOptions from policy API Group instead.

    IoK8sApiExtensionsV1beta1SELinuxStrategyOptions(;
        rule=nothing,
        seLinuxOptions=nothing,
    )

    - rule::String : rule is the strategy that will dictate the allowable labels that may be set.
    - seLinuxOptions::IoK8sApiCoreV1SELinuxOptions
"""
Base.@kwdef mutable struct IoK8sApiExtensionsV1beta1SELinuxStrategyOptions <: OpenAPI.APIModel
    rule::Union{Nothing, String} = nothing
    seLinuxOptions = nothing # spec type: Union{ Nothing, IoK8sApiCoreV1SELinuxOptions }

    function IoK8sApiExtensionsV1beta1SELinuxStrategyOptions(rule, seLinuxOptions, )
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1SELinuxStrategyOptions, Symbol("rule"), rule)
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1SELinuxStrategyOptions, Symbol("seLinuxOptions"), seLinuxOptions)
        return new(rule, seLinuxOptions, )
    end
end # type IoK8sApiExtensionsV1beta1SELinuxStrategyOptions

const _property_types_IoK8sApiExtensionsV1beta1SELinuxStrategyOptions = Dict{Symbol,String}(Symbol("rule")=>"String", Symbol("seLinuxOptions")=>"IoK8sApiCoreV1SELinuxOptions", )
OpenAPI.property_type(::Type{ IoK8sApiExtensionsV1beta1SELinuxStrategyOptions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1SELinuxStrategyOptions[name]))}

function check_required(o::IoK8sApiExtensionsV1beta1SELinuxStrategyOptions)
    o.rule === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiExtensionsV1beta1SELinuxStrategyOptions }, name::Symbol, val)
end
