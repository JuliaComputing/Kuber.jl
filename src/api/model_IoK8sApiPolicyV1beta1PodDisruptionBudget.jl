# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiPolicyV1beta1PodDisruptionBudget <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    spec::Any # spec type: Union{ Nothing, IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec } # spec name: spec
    status::Any # spec type: Union{ Nothing, IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus } # spec name: status

    function IoK8sApiPolicyV1beta1PodDisruptionBudget(;apiVersion=nothing, kind=nothing, metadata=nothing, spec=nothing, status=nothing)
        o = new()
        validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudget, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudget, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudget, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudget, Symbol("spec"), spec)
        setfield!(o, Symbol("spec"), spec)
        validate_property(IoK8sApiPolicyV1beta1PodDisruptionBudget, Symbol("status"), status)
        setfield!(o, Symbol("status"), status)
        o
    end
end # type IoK8sApiPolicyV1beta1PodDisruptionBudget

const _property_map_IoK8sApiPolicyV1beta1PodDisruptionBudget = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("spec")=>Symbol("spec"), Symbol("status")=>Symbol("status"))
const _property_types_IoK8sApiPolicyV1beta1PodDisruptionBudget = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiPolicyV1beta1PodDisruptionBudgetSpec", Symbol("status")=>"IoK8sApiPolicyV1beta1PodDisruptionBudgetStatus")
Base.propertynames(::Type{ IoK8sApiPolicyV1beta1PodDisruptionBudget }) = collect(keys(_property_map_IoK8sApiPolicyV1beta1PodDisruptionBudget))
Swagger.property_type(::Type{ IoK8sApiPolicyV1beta1PodDisruptionBudget }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiPolicyV1beta1PodDisruptionBudget[name]))}
Swagger.field_name(::Type{ IoK8sApiPolicyV1beta1PodDisruptionBudget }, property_name::Symbol) =  _property_map_IoK8sApiPolicyV1beta1PodDisruptionBudget[property_name]

function check_required(o::IoK8sApiPolicyV1beta1PodDisruptionBudget)
    true
end

function validate_property(::Type{ IoK8sApiPolicyV1beta1PodDisruptionBudget }, name::Symbol, val)
end
