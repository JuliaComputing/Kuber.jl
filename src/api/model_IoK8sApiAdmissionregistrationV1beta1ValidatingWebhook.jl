# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook <: SwaggerModel
    admissionReviewVersions::Any # spec type: Union{ Nothing, Vector{String} } # spec name: admissionReviewVersions
    clientConfig::Any # spec type: Union{ Nothing, IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig } # spec name: clientConfig
    failurePolicy::Any # spec type: Union{ Nothing, String } # spec name: failurePolicy
    matchPolicy::Any # spec type: Union{ Nothing, String } # spec name: matchPolicy
    name::Any # spec type: Union{ Nothing, String } # spec name: name
    namespaceSelector::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector } # spec name: namespaceSelector
    objectSelector::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector } # spec name: objectSelector
    rules::Any # spec type: Union{ Nothing, Vector{IoK8sApiAdmissionregistrationV1beta1RuleWithOperations} } # spec name: rules
    sideEffects::Any # spec type: Union{ Nothing, String } # spec name: sideEffects
    timeoutSeconds::Any # spec type: Union{ Nothing, Int32 } # spec name: timeoutSeconds

    function IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook(;admissionReviewVersions=nothing, clientConfig=nothing, failurePolicy=nothing, matchPolicy=nothing, name=nothing, namespaceSelector=nothing, objectSelector=nothing, rules=nothing, sideEffects=nothing, timeoutSeconds=nothing)
        o = new()
        validate_property(IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook, Symbol("admissionReviewVersions"), admissionReviewVersions)
        setfield!(o, Symbol("admissionReviewVersions"), admissionReviewVersions)
        validate_property(IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook, Symbol("clientConfig"), clientConfig)
        setfield!(o, Symbol("clientConfig"), clientConfig)
        validate_property(IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook, Symbol("failurePolicy"), failurePolicy)
        setfield!(o, Symbol("failurePolicy"), failurePolicy)
        validate_property(IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook, Symbol("matchPolicy"), matchPolicy)
        setfield!(o, Symbol("matchPolicy"), matchPolicy)
        validate_property(IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook, Symbol("name"), name)
        setfield!(o, Symbol("name"), name)
        validate_property(IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook, Symbol("namespaceSelector"), namespaceSelector)
        setfield!(o, Symbol("namespaceSelector"), namespaceSelector)
        validate_property(IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook, Symbol("objectSelector"), objectSelector)
        setfield!(o, Symbol("objectSelector"), objectSelector)
        validate_property(IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook, Symbol("rules"), rules)
        setfield!(o, Symbol("rules"), rules)
        validate_property(IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook, Symbol("sideEffects"), sideEffects)
        setfield!(o, Symbol("sideEffects"), sideEffects)
        validate_property(IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook, Symbol("timeoutSeconds"), timeoutSeconds)
        setfield!(o, Symbol("timeoutSeconds"), timeoutSeconds)
        o
    end
end # type IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook

const _property_map_IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook = Dict{Symbol,Symbol}(Symbol("admissionReviewVersions")=>Symbol("admissionReviewVersions"), Symbol("clientConfig")=>Symbol("clientConfig"), Symbol("failurePolicy")=>Symbol("failurePolicy"), Symbol("matchPolicy")=>Symbol("matchPolicy"), Symbol("name")=>Symbol("name"), Symbol("namespaceSelector")=>Symbol("namespaceSelector"), Symbol("objectSelector")=>Symbol("objectSelector"), Symbol("rules")=>Symbol("rules"), Symbol("sideEffects")=>Symbol("sideEffects"), Symbol("timeoutSeconds")=>Symbol("timeoutSeconds"))
const _property_types_IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook = Dict{Symbol,String}(Symbol("admissionReviewVersions")=>"Vector{String}", Symbol("clientConfig")=>"IoK8sApiAdmissionregistrationV1beta1WebhookClientConfig", Symbol("failurePolicy")=>"String", Symbol("matchPolicy")=>"String", Symbol("name")=>"String", Symbol("namespaceSelector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("objectSelector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("rules")=>"Vector{IoK8sApiAdmissionregistrationV1beta1RuleWithOperations}", Symbol("sideEffects")=>"String", Symbol("timeoutSeconds")=>"Int32")
Base.propertynames(::Type{ IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook }) = collect(keys(_property_map_IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook))
Swagger.property_type(::Type{ IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook[name]))}
Swagger.field_name(::Type{ IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook }, property_name::Symbol) =  _property_map_IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook[property_name]

function check_required(o::IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook)
    (getproperty(o, Symbol("clientConfig")) === nothing) && (return false)
    (getproperty(o, Symbol("name")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAdmissionregistrationV1beta1ValidatingWebhook }, name::Symbol, val)
end
