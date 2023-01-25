# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.storage.v1beta1.CSIDriver
CSIDriver captures information about a Container Storage Interface (CSI) volume driver deployed on the cluster. CSI drivers do not need to create the CSIDriver object directly. Instead they may use the cluster-driver-registrar sidecar container. When deployed with a CSI driver it automatically creates a CSIDriver object representing the driver. Kubernetes attach detach controller uses this object to determine whether attach is required. Kubelet uses this object to determine whether pod information needs to be passed on mount. CSIDriver objects are non-namespaced.

    IoK8sApiStorageV1beta1CSIDriver(;
        apiVersion=nothing,
        kind=nothing,
        metadata=nothing,
        spec=nothing,
    )

    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta
    - spec::IoK8sApiStorageV1beta1CSIDriverSpec
"""
Base.@kwdef mutable struct IoK8sApiStorageV1beta1CSIDriver <: OpenAPI.APIModel
    apiVersion::Union{Nothing, String} = nothing
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta }
    spec = nothing # spec type: Union{ Nothing, IoK8sApiStorageV1beta1CSIDriverSpec }

    function IoK8sApiStorageV1beta1CSIDriver(apiVersion, kind, metadata, spec, )
        OpenAPI.validate_property(IoK8sApiStorageV1beta1CSIDriver, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1CSIDriver, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1CSIDriver, Symbol("metadata"), metadata)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1CSIDriver, Symbol("spec"), spec)
        return new(apiVersion, kind, metadata, spec, )
    end
end # type IoK8sApiStorageV1beta1CSIDriver

const _property_types_IoK8sApiStorageV1beta1CSIDriver = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("spec")=>"IoK8sApiStorageV1beta1CSIDriverSpec", )
OpenAPI.property_type(::Type{ IoK8sApiStorageV1beta1CSIDriver }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiStorageV1beta1CSIDriver[name]))}

function check_required(o::IoK8sApiStorageV1beta1CSIDriver)
    o.spec === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiStorageV1beta1CSIDriver }, name::Symbol, val)
end