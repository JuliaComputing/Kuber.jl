# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiSettingsV1alpha1PodPreset <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    spec::Any # spec type: Union{ Nothing, IoK8sApiSettingsV1alpha1PodPresetSpec } # spec name: spec

    function IoK8sApiSettingsV1alpha1PodPreset(;apiVersion=nothing, kind=nothing, metadata=nothing, spec=nothing)
        o = new()
        validate_property(IoK8sApiSettingsV1alpha1PodPreset, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiSettingsV1alpha1PodPreset, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiSettingsV1alpha1PodPreset, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiSettingsV1alpha1PodPreset, Symbol("spec"), spec)
        setfield!(o, Symbol("spec"), spec)
        o
    end
end # type IoK8sApiSettingsV1alpha1PodPreset

const _property_map_IoK8sApiSettingsV1alpha1PodPreset = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("spec")=>Symbol("spec"))
const _property_types_IoK8sApiSettingsV1alpha1PodPreset = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiSettingsV1alpha1PodPresetSpec")
Base.propertynames(::Type{ IoK8sApiSettingsV1alpha1PodPreset }) = collect(keys(_property_map_IoK8sApiSettingsV1alpha1PodPreset))
Swagger.property_type(::Type{ IoK8sApiSettingsV1alpha1PodPreset }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiSettingsV1alpha1PodPreset[name]))}
Swagger.field_name(::Type{ IoK8sApiSettingsV1alpha1PodPreset }, property_name::Symbol) =  _property_map_IoK8sApiSettingsV1alpha1PodPreset[property_name]

function check_required(o::IoK8sApiSettingsV1alpha1PodPreset)
    true
end

function validate_property(::Type{ IoK8sApiSettingsV1alpha1PodPreset }, name::Symbol, val)
end
