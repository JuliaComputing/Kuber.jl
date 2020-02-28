# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiAppsV1beta1ControllerRevision <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    data::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgRuntimeRawExtension } # spec name: data
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    revision::Any # spec type: Union{ Nothing, Int64 } # spec name: revision

    function IoK8sApiAppsV1beta1ControllerRevision(;apiVersion=nothing, data=nothing, kind=nothing, metadata=nothing, revision=nothing)
        o = new()
        validate_property(IoK8sApiAppsV1beta1ControllerRevision, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiAppsV1beta1ControllerRevision, Symbol("data"), data)
        setfield!(o, Symbol("data"), data)
        validate_property(IoK8sApiAppsV1beta1ControllerRevision, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiAppsV1beta1ControllerRevision, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiAppsV1beta1ControllerRevision, Symbol("revision"), revision)
        setfield!(o, Symbol("revision"), revision)
        o
    end
end # type IoK8sApiAppsV1beta1ControllerRevision

const _property_map_IoK8sApiAppsV1beta1ControllerRevision = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("data")=>Symbol("data"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("revision")=>Symbol("revision"))
const _property_types_IoK8sApiAppsV1beta1ControllerRevision = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("data")=>"IoK8sApimachineryPkgRuntimeRawExtension", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("revision")=>"Int64")
Base.propertynames(::Type{ IoK8sApiAppsV1beta1ControllerRevision }) = collect(keys(_property_map_IoK8sApiAppsV1beta1ControllerRevision))
Swagger.property_type(::Type{ IoK8sApiAppsV1beta1ControllerRevision }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1beta1ControllerRevision[name]))}
Swagger.field_name(::Type{ IoK8sApiAppsV1beta1ControllerRevision }, property_name::Symbol) =  _property_map_IoK8sApiAppsV1beta1ControllerRevision[property_name]

function check_required(o::IoK8sApiAppsV1beta1ControllerRevision)
    (getproperty(o, Symbol("revision")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAppsV1beta1ControllerRevision }, name::Symbol, val)
end
