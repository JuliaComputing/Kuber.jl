# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec <: SwaggerModel

    function IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec

const _property_map_IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec }) = collect(keys(_property_map_IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec[property_name]

function check_required(o::IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisSettingsV1alpha1PodPresetSpec }, name::Symbol, val)
end