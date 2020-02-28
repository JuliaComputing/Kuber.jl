# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiAppsV1beta2DaemonSet <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    spec::Any # spec type: Union{ Nothing, IoK8sApiAppsV1beta2DaemonSetSpec } # spec name: spec
    status::Any # spec type: Union{ Nothing, IoK8sApiAppsV1beta2DaemonSetStatus } # spec name: status

    function IoK8sApiAppsV1beta2DaemonSet(;apiVersion=nothing, kind=nothing, metadata=nothing, spec=nothing, status=nothing)
        o = new()
        validate_property(IoK8sApiAppsV1beta2DaemonSet, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiAppsV1beta2DaemonSet, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiAppsV1beta2DaemonSet, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiAppsV1beta2DaemonSet, Symbol("spec"), spec)
        setfield!(o, Symbol("spec"), spec)
        validate_property(IoK8sApiAppsV1beta2DaemonSet, Symbol("status"), status)
        setfield!(o, Symbol("status"), status)
        o
    end
end # type IoK8sApiAppsV1beta2DaemonSet

const _property_map_IoK8sApiAppsV1beta2DaemonSet = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("spec")=>Symbol("spec"), Symbol("status")=>Symbol("status"))
const _property_types_IoK8sApiAppsV1beta2DaemonSet = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiAppsV1beta2DaemonSetSpec", Symbol("status")=>"IoK8sApiAppsV1beta2DaemonSetStatus")
Base.propertynames(::Type{ IoK8sApiAppsV1beta2DaemonSet }) = collect(keys(_property_map_IoK8sApiAppsV1beta2DaemonSet))
Swagger.property_type(::Type{ IoK8sApiAppsV1beta2DaemonSet }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1beta2DaemonSet[name]))}
Swagger.field_name(::Type{ IoK8sApiAppsV1beta2DaemonSet }, property_name::Symbol) =  _property_map_IoK8sApiAppsV1beta2DaemonSet[property_name]

function check_required(o::IoK8sApiAppsV1beta2DaemonSet)
    true
end

function validate_property(::Type{ IoK8sApiAppsV1beta2DaemonSet }, name::Symbol, val)
end
