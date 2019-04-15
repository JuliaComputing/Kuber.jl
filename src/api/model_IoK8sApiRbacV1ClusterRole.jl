# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiRbacV1ClusterRole <: SwaggerModel
    aggregationRule::Any # spec type: Union{ Nothing, IoK8sApiRbacV1AggregationRule } # spec name: aggregationRule
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    rules::Any # spec type: Union{ Nothing, Vector{IoK8sApiRbacV1PolicyRule} } # spec name: rules

    function IoK8sApiRbacV1ClusterRole(;aggregationRule=nothing, apiVersion=nothing, kind=nothing, metadata=nothing, rules=nothing)
        o = new()
        validate_property(IoK8sApiRbacV1ClusterRole, Symbol("aggregationRule"), aggregationRule)
        setfield!(o, Symbol("aggregationRule"), aggregationRule)
        validate_property(IoK8sApiRbacV1ClusterRole, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiRbacV1ClusterRole, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiRbacV1ClusterRole, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiRbacV1ClusterRole, Symbol("rules"), rules)
        setfield!(o, Symbol("rules"), rules)
        o
    end
end # type IoK8sApiRbacV1ClusterRole

const _property_map_IoK8sApiRbacV1ClusterRole = Dict{Symbol,Symbol}(Symbol("aggregationRule")=>Symbol("aggregationRule"), Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("kind")=>Symbol("kind"), Symbol("metadata")=>Symbol("metadata"), Symbol("rules")=>Symbol("rules"))
const _property_types_IoK8sApiRbacV1ClusterRole = Dict{Symbol,String}(Symbol("aggregationRule")=>"IoK8sApiRbacV1AggregationRule", Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("rules")=>"Vector{IoK8sApiRbacV1PolicyRule}")
Base.propertynames(::Type{ IoK8sApiRbacV1ClusterRole }) = collect(keys(_property_map_IoK8sApiRbacV1ClusterRole))
Swagger.property_type(::Type{ IoK8sApiRbacV1ClusterRole }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiRbacV1ClusterRole[name]))}
Swagger.field_name(::Type{ IoK8sApiRbacV1ClusterRole }, property_name::Symbol) =  _property_map_IoK8sApiRbacV1ClusterRole[property_name]

function check_required(o::IoK8sApiRbacV1ClusterRole)
    (getproperty(o, Symbol("rules")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiRbacV1ClusterRole }, name::Symbol, val)
end