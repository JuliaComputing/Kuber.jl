# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview <: SwaggerModel

    function IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview

const _property_map_IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview }) = collect(keys(_property_map_IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview[property_name]

function check_required(o::IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisAuthorizationV1beta1SubjectAccessReview }, name::Symbol, val)
end