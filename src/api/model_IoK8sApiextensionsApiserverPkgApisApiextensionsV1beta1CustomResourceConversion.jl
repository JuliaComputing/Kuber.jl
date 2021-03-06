# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion <: SwaggerModel
    conversionReviewVersions::Any # spec type: Union{ Nothing, Vector{String} } # spec name: conversionReviewVersions
    strategy::Any # spec type: Union{ Nothing, String } # spec name: strategy
    webhookClientConfig::Any # spec type: Union{ Nothing, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1WebhookClientConfig } # spec name: webhookClientConfig

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion(;conversionReviewVersions=nothing, strategy=nothing, webhookClientConfig=nothing)
        o = new()
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion, Symbol("conversionReviewVersions"), conversionReviewVersions)
        setfield!(o, Symbol("conversionReviewVersions"), conversionReviewVersions)
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion, Symbol("strategy"), strategy)
        setfield!(o, Symbol("strategy"), strategy)
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion, Symbol("webhookClientConfig"), webhookClientConfig)
        setfield!(o, Symbol("webhookClientConfig"), webhookClientConfig)
        o
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion

const _property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion = Dict{Symbol,Symbol}(Symbol("conversionReviewVersions")=>Symbol("conversionReviewVersions"), Symbol("strategy")=>Symbol("strategy"), Symbol("webhookClientConfig")=>Symbol("webhookClientConfig"))
const _property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion = Dict{Symbol,String}(Symbol("conversionReviewVersions")=>"Vector{String}", Symbol("strategy")=>"String", Symbol("webhookClientConfig")=>"IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1WebhookClientConfig")
Base.propertynames(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion }) = collect(keys(_property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion))
Swagger.property_type(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion[name]))}
Swagger.field_name(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion }, property_name::Symbol) =  _property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion[property_name]

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion)
    (getproperty(o, Symbol("strategy")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceConversion }, name::Symbol, val)
end
