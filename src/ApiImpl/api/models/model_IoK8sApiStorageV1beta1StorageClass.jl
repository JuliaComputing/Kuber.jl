# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.storage.v1beta1.StorageClass
StorageClass describes the parameters for a class of storage for which PersistentVolumes can be dynamically provisioned.  StorageClasses are non-namespaced; the name of the storage class according to etcd is in ObjectMeta.Name.

    IoK8sApiStorageV1beta1StorageClass(;
        allowVolumeExpansion=nothing,
        allowedTopologies=nothing,
        apiVersion=nothing,
        kind=nothing,
        metadata=nothing,
        mountOptions=nothing,
        parameters=nothing,
        provisioner=nothing,
        reclaimPolicy=nothing,
        volumeBindingMode=nothing,
    )

    - allowVolumeExpansion::Bool : AllowVolumeExpansion shows whether the storage class allow volume expand
    - allowedTopologies::Vector{IoK8sApiCoreV1TopologySelectorTerm} : Restrict the node topologies where volumes can be dynamically provisioned. Each volume plugin defines its own supported topology specifications. An empty TopologySelectorTerm list means there is no topology restriction. This field is only honored by servers that enable the VolumeScheduling feature.
    - apiVersion::String : APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    - kind::String : Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    - metadata::IoK8sApimachineryPkgApisMetaV1ObjectMeta
    - mountOptions::Vector{String} : Dynamically provisioned PersistentVolumes of this storage class are created with these mountOptions, e.g. [\&quot;ro\&quot;, \&quot;soft\&quot;]. Not validated - mount of the PVs will simply fail if one is invalid.
    - parameters::Dict{String, String} : Parameters holds the parameters for the provisioner that should create volumes of this storage class.
    - provisioner::String : Provisioner indicates the type of the provisioner.
    - reclaimPolicy::String : Dynamically provisioned PersistentVolumes of this storage class are created with this reclaimPolicy. Defaults to Delete.
    - volumeBindingMode::String : VolumeBindingMode indicates how PersistentVolumeClaims should be provisioned and bound.  When unset, VolumeBindingImmediate is used. This field is only honored by servers that enable the VolumeScheduling feature.
"""
Base.@kwdef mutable struct IoK8sApiStorageV1beta1StorageClass <: OpenAPI.APIModel
    allowVolumeExpansion::Union{Nothing, Bool} = nothing
    allowedTopologies::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1TopologySelectorTerm} }
    apiVersion::Union{Nothing, String} = nothing
    kind::Union{Nothing, String} = nothing
    metadata = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta }
    mountOptions::Union{Nothing, Vector{String}} = nothing
    parameters::Union{Nothing, Dict{String, String}} = nothing
    provisioner::Union{Nothing, String} = nothing
    reclaimPolicy::Union{Nothing, String} = nothing
    volumeBindingMode::Union{Nothing, String} = nothing

    function IoK8sApiStorageV1beta1StorageClass(allowVolumeExpansion, allowedTopologies, apiVersion, kind, metadata, mountOptions, parameters, provisioner, reclaimPolicy, volumeBindingMode, )
        OpenAPI.validate_property(IoK8sApiStorageV1beta1StorageClass, Symbol("allowVolumeExpansion"), allowVolumeExpansion)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1StorageClass, Symbol("allowedTopologies"), allowedTopologies)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1StorageClass, Symbol("apiVersion"), apiVersion)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1StorageClass, Symbol("kind"), kind)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1StorageClass, Symbol("metadata"), metadata)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1StorageClass, Symbol("mountOptions"), mountOptions)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1StorageClass, Symbol("parameters"), parameters)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1StorageClass, Symbol("provisioner"), provisioner)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1StorageClass, Symbol("reclaimPolicy"), reclaimPolicy)
        OpenAPI.validate_property(IoK8sApiStorageV1beta1StorageClass, Symbol("volumeBindingMode"), volumeBindingMode)
        return new(allowVolumeExpansion, allowedTopologies, apiVersion, kind, metadata, mountOptions, parameters, provisioner, reclaimPolicy, volumeBindingMode, )
    end
end # type IoK8sApiStorageV1beta1StorageClass

const _property_types_IoK8sApiStorageV1beta1StorageClass = Dict{Symbol,String}(Symbol("allowVolumeExpansion")=>"Bool", Symbol("allowedTopologies")=>"Vector{IoK8sApiCoreV1TopologySelectorTerm}", Symbol("apiVersion")=>"String", Symbol("kind")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("mountOptions")=>"Vector{String}", Symbol("parameters")=>"Dict{String, String}", Symbol("provisioner")=>"String", Symbol("reclaimPolicy")=>"String", Symbol("volumeBindingMode")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiStorageV1beta1StorageClass }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiStorageV1beta1StorageClass[name]))}

function check_required(o::IoK8sApiStorageV1beta1StorageClass)
    o.provisioner === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiStorageV1beta1StorageClass }, name::Symbol, val)
end
