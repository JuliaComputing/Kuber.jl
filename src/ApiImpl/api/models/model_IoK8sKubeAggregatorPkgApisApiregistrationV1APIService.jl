# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.kube-aggregator.pkg.apis.apiregistration.v1.APIService
APIService represents a server for a particular GroupVersion. Name must be \&quot;version.group\&quot;.

    IoK8sKubeAggregatorPkgApisApiregistrationV1APIService(;
        apiVersion=nothing,
        kind=nothing,
        metadata=nothing,
        spec=nothing,
        status=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta
    - spec::IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec
    - status::IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceStatus
"""
Base.@kwdef mutable struct IoK8sKubeAggregatorPkgApisApiregistrationV1APIService <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta }
    spec = nothing # spec type: Union{ Nothing, IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec }
    status = nothing # spec type: Union{ Nothing, IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceStatus }

    function IoK8sKubeAggregatorPkgApisApiregistrationV1APIService(apiVersion, kind, metadata, spec, status, )
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIService, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIService, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIService, Symbol("metadata"), metadata)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIService, Symbol("spec"), spec)
        OpenAPI.validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1APIService, Symbol("status"), status)
        return new(apiVersion, kind, metadata, spec, status, )
    end
end # type IoK8sKubeAggregatorPkgApisApiregistrationV1APIService

const _property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1APIService = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec", Symbol("status")=>"IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceStatus", )
OpenAPI.property_type(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1APIService }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1APIService[name]))}

function check_required(o::IoK8sKubeAggregatorPkgApisApiregistrationV1APIService)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1APIService }, name::Symbol, val)
end
