# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiBatchV1beta1CronJob <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    spec::Any # spec type: Union{ Nothing, IoK8sApiBatchV1beta1CronJobSpec } # spec name: spec
    status::Any # spec type: Union{ Nothing, IoK8sApiBatchV1beta1CronJobStatus } # spec name: status

    function IoK8sApiBatchV1beta1CronJob(;apiVersion=nothing, kind=nothing, metadata=nothing, spec=nothing, status=nothing)
        o = new()
        validate_property(IoK8sApiBatchV1beta1CronJob, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiBatchV1beta1CronJob, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiBatchV1beta1CronJob, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiBatchV1beta1CronJob, Symbol("spec"), spec)
        setfield!(o, Symbol("spec"), spec)
        validate_property(IoK8sApiBatchV1beta1CronJob, Symbol("status"), status)
        setfield!(o, Symbol("status"), status)
        o
    end
end # type IoK8sApiBatchV1beta1CronJob

const _property_map_IoK8sApiBatchV1beta1CronJob = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("spec")=>Symbol("spec"), Symbol("status")=>Symbol("status"))
const _property_types_IoK8sApiBatchV1beta1CronJob = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiBatchV1beta1CronJobSpec", Symbol("status")=>"IoK8sApiBatchV1beta1CronJobStatus")
Base.propertynames(::Type{ IoK8sApiBatchV1beta1CronJob }) = collect(keys(_property_map_IoK8sApiBatchV1beta1CronJob))
Swagger.property_type(::Type{ IoK8sApiBatchV1beta1CronJob }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiBatchV1beta1CronJob[name]))}
Swagger.field_name(::Type{ IoK8sApiBatchV1beta1CronJob }, property_name::Symbol) =  _property_map_IoK8sApiBatchV1beta1CronJob[property_name]

function check_required(o::IoK8sApiBatchV1beta1CronJob)
    true
end

function validate_property(::Type{ IoK8sApiBatchV1beta1CronJob }, name::Symbol, val)
end
