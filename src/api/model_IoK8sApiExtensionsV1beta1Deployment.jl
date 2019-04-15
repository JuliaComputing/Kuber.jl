# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiExtensionsV1beta1Deployment <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    spec::Any # spec type: Union{ Nothing, IoK8sApiExtensionsV1beta1DeploymentSpec } # spec name: spec
    status::Any # spec type: Union{ Nothing, IoK8sApiExtensionsV1beta1DeploymentStatus } # spec name: status

    function IoK8sApiExtensionsV1beta1Deployment(;apiVersion=nothing, kind=nothing, metadata=nothing, spec=nothing, status=nothing)
        o = new()
        validate_property(IoK8sApiExtensionsV1beta1Deployment, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiExtensionsV1beta1Deployment, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiExtensionsV1beta1Deployment, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiExtensionsV1beta1Deployment, Symbol("spec"), spec)
        setfield!(o, Symbol("spec"), spec)
        validate_property(IoK8sApiExtensionsV1beta1Deployment, Symbol("status"), status)
        setfield!(o, Symbol("status"), status)
        o
    end
end # type IoK8sApiExtensionsV1beta1Deployment

const _property_map_IoK8sApiExtensionsV1beta1Deployment = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("spec")=>Symbol("spec"), Symbol("status")=>Symbol("status"))
const _property_types_IoK8sApiExtensionsV1beta1Deployment = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiExtensionsV1beta1DeploymentSpec", Symbol("status")=>"IoK8sApiExtensionsV1beta1DeploymentStatus")
Base.propertynames(::Type{ IoK8sApiExtensionsV1beta1Deployment }) = collect(keys(_property_map_IoK8sApiExtensionsV1beta1Deployment))
Swagger.property_type(::Type{ IoK8sApiExtensionsV1beta1Deployment }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiExtensionsV1beta1Deployment[name]))}
Swagger.field_name(::Type{ IoK8sApiExtensionsV1beta1Deployment }, property_name::Symbol) =  _property_map_IoK8sApiExtensionsV1beta1Deployment[property_name]

function check_required(o::IoK8sApiExtensionsV1beta1Deployment)
    true
end

function validate_property(::Type{ IoK8sApiExtensionsV1beta1Deployment }, name::Symbol, val)
end
