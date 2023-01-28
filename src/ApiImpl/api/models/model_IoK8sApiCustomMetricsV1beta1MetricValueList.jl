# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.custom.metrics.v1beta1.MetricValueList
a list of values for a given metric for some set of objects

    IoK8sApiCustomMetricsV1beta1MetricValueList(;
        apiVersion=nothing,
        items=nothing,
        kind=nothing,
        metadata=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - items::Vector{IoK8sApiCustomMetricsV1beta1MetricValue} : the value of the metric across the described objects
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ListMeta
"""
Base.@kwdef mutable struct IoK8sApiCustomMetricsV1beta1MetricValueList <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    items::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiCustomMetricsV1beta1MetricValue} }
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ListMeta }

    function IoK8sApiCustomMetricsV1beta1MetricValueList(apiVersion, items, kind, metadata, )
        OpenAPI.validate_property(IoK8sApiCustomMetricsV1beta1MetricValueList, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiCustomMetricsV1beta1MetricValueList, Symbol("items"), items)
        OpenAPI.validate_property(IoK8sApiCustomMetricsV1beta1MetricValueList, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiCustomMetricsV1beta1MetricValueList, Symbol("metadata"), metadata)
        return new(apiVersion, items, kind, metadata, )
    end
end # type IoK8sApiCustomMetricsV1beta1MetricValueList

const _property_types_IoK8sApiCustomMetricsV1beta1MetricValueList = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("items")=>"Vector{IoK8sApiCustomMetricsV1beta1MetricValue}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ListMeta", )
OpenAPI.property_type(::Type{ IoK8sApiCustomMetricsV1beta1MetricValueList }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCustomMetricsV1beta1MetricValueList[name]))}

function check_required(o::IoK8sApiCustomMetricsV1beta1MetricValueList)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCustomMetricsV1beta1MetricValueList }, name::Symbol, val)
end
