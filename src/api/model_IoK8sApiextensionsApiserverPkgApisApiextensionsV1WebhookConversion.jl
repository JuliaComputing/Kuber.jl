# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""WebhookConversion describes how to call a conversion webhook

    IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion(;
        clientConfig=nothing,
        conversionReviewVersions=nothing,
    )

    - clientConfig::IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookClientConfig : clientConfig is the instructions for how to call the webhook if strategy is &#x60;Webhook&#x60;.
    - conversionReviewVersions::Vector{String} : conversionReviewVersions is an ordered list of preferred &#x60;ConversionReview&#x60; versions the Webhook expects. The API server will use the first version in the list which it supports. If none of the versions specified in this list are supported by API server, conversion will fail for the custom resource. If a persisted Webhook configuration specifies allowed versions and does not include any versions known to the API Server, calls to the webhook will fail.
"""
mutable struct IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion <: SwaggerModel
    clientConfig::Any # spec type: Union{ Nothing, IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookClientConfig } # spec name: clientConfig
    conversionReviewVersions::Any # spec type: Union{ Nothing, Vector{String} } # spec name: conversionReviewVersions

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion(;clientConfig=nothing, conversionReviewVersions=nothing)
        o = new()
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion, Symbol("clientConfig"), clientConfig)
        setfield!(o, Symbol("clientConfig"), clientConfig)
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion, Symbol("conversionReviewVersions"), conversionReviewVersions)
        setfield!(o, Symbol("conversionReviewVersions"), conversionReviewVersions)
        o
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion

const _property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion = Dict{Symbol,Symbol}(Symbol("clientConfig")=>Symbol("clientConfig"), Symbol("conversionReviewVersions")=>Symbol("conversionReviewVersions"))
const _property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion = Dict{Symbol,String}(Symbol("clientConfig")=>"IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookClientConfig", Symbol("conversionReviewVersions")=>"Vector{String}")
Base.propertynames(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion }) = collect(keys(_property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion))
Swagger.property_type(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion[name]))}
Swagger.field_name(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion }, property_name::Symbol) =  _property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion[property_name]

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion)
    (getproperty(o, Symbol("conversionReviewVersions")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1WebhookConversion }, name::Symbol, val)
end
