# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""SelfSubjectAccessReview checks whether or the current user can perform an action.  Not filling in a spec.namespace means \&quot;in all namespaces\&quot;.  Self is a special case, because users should always be able to check whether they can perform an action

    IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview(;
        apiVersion=nothing,
        kind=nothing,
        metadata=nothing,
        spec=nothing,
        status=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta
    - spec::IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec : Spec holds information about the request being evaluated.  user and groups must be empty
    - status::IoK8sApiAuthorizationV1beta1SubjectAccessReviewStatus : Status is filled in by the server and indicates whether the request is allowed or not
"""
mutable struct IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    spec::Any # spec type: Union{ Nothing, IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec } # spec name: spec
    status::Any # spec type: Union{ Nothing, IoK8sApiAuthorizationV1beta1SubjectAccessReviewStatus } # spec name: status

    function IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview(;apiVersion=nothing, kind=nothing, metadata=nothing, spec=nothing, status=nothing)
        o = new()
        validate_property(IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview, Symbol("spec"), spec)
        setfield!(o, Symbol("spec"), spec)
        validate_property(IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview, Symbol("status"), status)
        setfield!(o, Symbol("status"), status)
        o
    end
end # type IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview

const _property_map_IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("spec")=>Symbol("spec"), Symbol("status")=>Symbol("status"))
const _property_types_IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiAuthorizationV1beta1SelfSubjectAccessReviewSpec", Symbol("status")=>"IoK8sApiAuthorizationV1beta1SubjectAccessReviewStatus")
Base.propertynames(::Type{ IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview }) = collect(keys(_property_map_IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview))
Swagger.property_type(::Type{ IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview[name]))}
Swagger.field_name(::Type{ IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview }, property_name::Symbol) =  _property_map_IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview[property_name]

function check_required(o::IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview)
    (getproperty(o, Symbol("spec")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAuthorizationV1beta1SelfSubjectAccessReview }, name::Symbol, val)
end
