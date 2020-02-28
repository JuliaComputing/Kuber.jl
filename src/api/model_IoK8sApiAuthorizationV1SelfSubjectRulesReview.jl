# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiAuthorizationV1SelfSubjectRulesReview <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    spec::Any # spec type: Union{ Nothing, IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec } # spec name: spec
    status::Any # spec type: Union{ Nothing, IoK8sApiAuthorizationV1SubjectRulesReviewStatus } # spec name: status

    function IoK8sApiAuthorizationV1SelfSubjectRulesReview(;apiVersion=nothing, kind=nothing, metadata=nothing, spec=nothing, status=nothing)
        o = new()
        validate_property(IoK8sApiAuthorizationV1SelfSubjectRulesReview, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiAuthorizationV1SelfSubjectRulesReview, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiAuthorizationV1SelfSubjectRulesReview, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiAuthorizationV1SelfSubjectRulesReview, Symbol("spec"), spec)
        setfield!(o, Symbol("spec"), spec)
        validate_property(IoK8sApiAuthorizationV1SelfSubjectRulesReview, Symbol("status"), status)
        setfield!(o, Symbol("status"), status)
        o
    end
end # type IoK8sApiAuthorizationV1SelfSubjectRulesReview

const _property_map_IoK8sApiAuthorizationV1SelfSubjectRulesReview = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("spec")=>Symbol("spec"), Symbol("status")=>Symbol("status"))
const _property_types_IoK8sApiAuthorizationV1SelfSubjectRulesReview = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiAuthorizationV1SelfSubjectRulesReviewSpec", Symbol("status")=>"IoK8sApiAuthorizationV1SubjectRulesReviewStatus")
Base.propertynames(::Type{ IoK8sApiAuthorizationV1SelfSubjectRulesReview }) = collect(keys(_property_map_IoK8sApiAuthorizationV1SelfSubjectRulesReview))
Swagger.property_type(::Type{ IoK8sApiAuthorizationV1SelfSubjectRulesReview }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthorizationV1SelfSubjectRulesReview[name]))}
Swagger.field_name(::Type{ IoK8sApiAuthorizationV1SelfSubjectRulesReview }, property_name::Symbol) =  _property_map_IoK8sApiAuthorizationV1SelfSubjectRulesReview[property_name]

function check_required(o::IoK8sApiAuthorizationV1SelfSubjectRulesReview)
    (getproperty(o, Symbol("spec")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAuthorizationV1SelfSubjectRulesReview }, name::Symbol, val)
end
