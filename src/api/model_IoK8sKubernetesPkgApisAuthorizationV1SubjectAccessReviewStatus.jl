# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus <: SwaggerModel

    function IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus

const _property_map_IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus }) = collect(keys(_property_map_IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus[property_name]

function check_required(o::IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisAuthorizationV1SubjectAccessReviewStatus }, name::Symbol, val)
end