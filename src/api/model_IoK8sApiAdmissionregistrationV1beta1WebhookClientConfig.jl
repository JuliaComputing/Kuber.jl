# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig <: SwaggerModel
    caBundle::Any # spec type: Union{ Nothing, Vector{UInt8} } # spec name: caBundle
    service::Any # spec type: Union{ Nothing, IoK8sApiAdmissionregistrationV1beta1ServiceReference } # spec name: service
    url::Any # spec type: Union{ Nothing, String } # spec name: url

    function IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig(;caBundle=nothing, service=nothing, url=nothing)
        o = new()
        validate_property(IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig, Symbol("caBundle"), caBundle)
        setfield!(o, Symbol("caBundle"), caBundle)
        validate_property(IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig, Symbol("service"), service)
        setfield!(o, Symbol("service"), service)
        validate_property(IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig, Symbol("url"), url)
        setfield!(o, Symbol("url"), url)
        o
    end
end # type IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig

const _property_map_IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig = Dict{Symbol,Symbol}(Symbol("caBundle")=>Symbol("caBundle"), Symbol("service")=>Symbol("service"), Symbol("url")=>Symbol("url"))
const _property_types_IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig = Dict{Symbol,String}(Symbol("caBundle")=>"Vector{UInt8}", Symbol("service")=>"IoK8sApiAdmissionregistrationV1beta1ServiceReference", Symbol("url")=>"String")
Base.propertynames(::Type{ IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig }) = collect(keys(_property_map_IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig))
Swagger.property_type(::Type{ IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig[name]))}
Swagger.field_name(::Type{ IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig }, property_name::Symbol) =  _property_map_IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig[property_name]

function check_required(o::IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig)
    (getproperty(o, Symbol("caBundle")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig }, name::Symbol, val)
    if name === Symbol("caBundle")
    end
end
