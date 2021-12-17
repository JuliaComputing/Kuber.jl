# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""CustomResourceConversion describes how to convert different versions of a CR.

    IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion(;
        strategy=nothing,
        webhook=nothing,
    )

    - strategy::String : strategy specifies how custom resources are converted between versions. Allowed values are: - &#x60;None&#x60;: The converter only change the apiVersion and would not touch any other field in the custom resource. - &#x60;Webhook&#x60;: API Server will call to an external webhook to do the conversion. Additional information   is needed for this option. This requires spec.preserveUnknownFields to be false, and spec.conversion.webhook to be set.
    - webhook::IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion : webhook describes how to call the conversion webhook. Required when &#x60;strategy&#x60; is set to &#x60;Webhook&#x60;.
"""
mutable struct IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion <: SwaggerModel
    strategy::Any # spec type: Union{ Nothing, String } # spec name: strategy
    webhook::Any # spec type: Union{ Nothing, IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion } # spec name: webhook

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion(;strategy=nothing, webhook=nothing)
        o = new()
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion, Symbol("strategy"), strategy)
        setfield!(o, Symbol("strategy"), strategy)
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion, Symbol("webhook"), webhook)
        setfield!(o, Symbol("webhook"), webhook)
        o
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion

const _property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion = Dict{Symbol,Symbol}(Symbol("strategy")=>Symbol("strategy"), Symbol("webhook")=>Symbol("webhook"))
const _property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion = Dict{Symbol,String}(Symbol("strategy")=>"String", Symbol("webhook")=>"IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion")
Base.propertynames(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion }) = collect(keys(_property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion))
Swagger.property_type(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion[name]))}
Swagger.field_name(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion }, property_name::Symbol) =  _property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion[property_name]

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion)
    (getproperty(o, Symbol("strategy")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceConversion }, name::Symbol, val)
end
