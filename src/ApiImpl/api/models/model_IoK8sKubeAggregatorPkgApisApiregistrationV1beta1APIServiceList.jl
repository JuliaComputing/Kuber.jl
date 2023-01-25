# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.kube-aggregator.pkg.apis.apiregistration.v1beta1.APIServiceList
APIServiceList is a list of APIService objects.

    IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList(;
        apiVersion=nothing,
        items=nothing,
        kind=nothing,
        metadata=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - items::Vector{IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIService}
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ListMeta
"""
Base.@kwdef mutable struct IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    items::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIService} }
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ListMeta }

    function IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList(apiVersion, items, kind, metadata, )
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList, Symbol("items"), items)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList, Symbol("metadata"), metadata)
        return new(apiVersion, items, kind, metadata, )
    end
end # type IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList

const _property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("items")=>"Vector{IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIService}", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ListMeta", )
OpenAPI.property_type(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList[name]))}

function check_required(o::IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList)
    o.items === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceList }, name::Symbol, val)
end