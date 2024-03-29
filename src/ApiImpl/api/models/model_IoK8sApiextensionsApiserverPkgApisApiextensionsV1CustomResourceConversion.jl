# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.CustomResourceConversion
CustomResourceConversion describes how to convert different versions of a CR.

    IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion(;
        strategy=nothing,
        webhook=nothing,
    )

    - strategy::String : strategy specifies how custom resources are converted between versions. Allowed values are: - &#x60;None&#x60;: The converter only change the apiVersion and would not touch any other field in the custom resource. - &#x60;Webhook&#x60;: API Server will call to an external webhook to do the conversion. Additional information   is needed for this option. This requires spec.preserveUnknownFields to be false, and spec.conversion.webhook to be set.
    - webhook::IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion
"""
Base.@kwdef mutable struct IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion <: OpenAPI.APIModel
    strategy::Union{Nothing, String} = nothing
    webhook = nothing # spec type: Union{ Nothing, IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion }

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion(strategy, webhook, )
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion, Symbol("strategy"), strategy)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion, Symbol("webhook"), webhook)
        return new(strategy, webhook, )
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion

const _property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion = Dict{Symbol,String}(Symbol("strategy")=>"String", Symbol("webhook")=>"IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion", )
OpenAPI.property_type(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion[name]))}

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion)
    o.strategy === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion }, name::Symbol, val)
end
