# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.CustomResourceSubresourceScale
CustomResourceSubresourceScale defines how to serve the scale subresource for CustomResources.

    IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale(;
        labelSelectorPath=nothing,
        specReplicasPath=nothing,
        statusReplicasPath=nothing,
    )

    - labelSelectorPath::String : labelSelectorPath defines the JSON path inside of a custom resource that corresponds to Scale &#x60;status.selector&#x60;. Only JSON paths without the array notation are allowed. Must be a JSON Path under &#x60;.status&#x60; or &#x60;.spec&#x60;. Must be set to work with HorizontalPodAutoscaler. The field pointed by this JSON path must be a string field (not a complex selector struct) which contains a serialized label selector in string form. More info: https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions#scale-subresource If there is no value under the given path in the custom resource, the &#x60;status.selector&#x60; value in the &#x60;/scale&#x60; subresource will default to the empty string.
    - specReplicasPath::String : specReplicasPath defines the JSON path inside of a custom resource that corresponds to Scale &#x60;spec.replicas&#x60;. Only JSON paths without the array notation are allowed. Must be a JSON Path under &#x60;.spec&#x60;. If there is no value under the given path in the custom resource, the &#x60;/scale&#x60; subresource will return an error on GET.
    - statusReplicasPath::String : statusReplicasPath defines the JSON path inside of a custom resource that corresponds to Scale &#x60;status.replicas&#x60;. Only JSON paths without the array notation are allowed. Must be a JSON Path under &#x60;.status&#x60;. If there is no value under the given path in the custom resource, the &#x60;status.replicas&#x60; value in the &#x60;/scale&#x60; subresource will default to 0.
"""
Base.@kwdef mutable struct IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale <: OpenAPI.APIModel
    labelSelectorPath::Union{Nothing, String} = nothing
    specReplicasPath::Union{Nothing, String} = nothing
    statusReplicasPath::Union{Nothing, String} = nothing

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale(labelSelectorPath, specReplicasPath, statusReplicasPath, )
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale, Symbol("labelSelectorPath"), labelSelectorPath)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale, Symbol("specReplicasPath"), specReplicasPath)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale, Symbol("statusReplicasPath"), statusReplicasPath)
        return new(labelSelectorPath, specReplicasPath, statusReplicasPath, )
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale

const _property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale = Dict{Symbol,String}(Symbol("labelSelectorPath")=>"String", Symbol("specReplicasPath")=>"String", Symbol("statusReplicasPath")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale[name]))}

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale)
    o.specReplicasPath === nothing && (return false)
    o.statusReplicasPath === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceSubresourceScale }, name::Symbol, val)
end