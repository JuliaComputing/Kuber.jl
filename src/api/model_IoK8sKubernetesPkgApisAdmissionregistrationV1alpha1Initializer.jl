# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer <: SwaggerModel

    function IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer

const _property_map_IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer }) = collect(keys(_property_map_IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer[property_name]

function check_required(o::IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisAdmissionregistrationV1alpha1Initializer }, name::Symbol, val)
end