# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.apps.v1beta1.StatefulSetSpec
A StatefulSetSpec is the specification of a StatefulSet.

    IoK8sApiAppsV1beta1StatefulSetSpec(;
        podManagementPolicy=nothing,
        replicas=nothing,
        revisionHistoryLimit=nothing,
        selector=nothing,
        serviceName=nothing,
        template=nothing,
        updateStrategy=nothing,
        volumeClaimTemplates=nothing,
    )

    - podManagementPolicy::String : podManagementPolicy controls how pods are created during initial scale up, when replacing pods on nodes, or when scaling down. The default policy is &#x60;OrderedReady&#x60;, where pods are created in increasing order (pod-0, then pod-1, etc) and the controller will wait until each pod is ready before continuing. When scaling down, the pods are removed in the opposite order. The alternative policy is &#x60;Parallel&#x60; which will create pods in parallel to match the desired scale without waiting, and on scale down will delete all pods at once.
    - replicas::Int64 : replicas is the desired number of replicas of the given Template. These are replicas in the sense that they are instantiations of the same Template, but individual replicas also have a consistent identity. If unspecified, defaults to 1.
    - revisionHistoryLimit::Int64 : revisionHistoryLimit is the maximum number of revisions that will be maintained in the StatefulSet&#39;s revision history. The revision history consists of all revisions not represented by a currently applied StatefulSetSpec version. The default value is 10.
    - selector::IoK8sApimachineryPkgApisMetaV1LabelSelector
    - serviceName::String : serviceName is the name of the service that governs this StatefulSet. This service must exist before the StatefulSet, and is responsible for the network identity of the set. Pods get DNS/hostnames that follow the pattern: pod-specific-string.serviceName.default.svc.cluster.local where \&quot;pod-specific-string\&quot; is managed by the StatefulSet controller.
    - template::IoK8sApiCoreV1PodTemplateSpec
    - updateStrategy::IoK8sApiAppsV1beta1StatefulSetUpdateStrategy
    - volumeClaimTemplates::Vector{IoK8sApiCoreV1PersistentVolumeClaim} : volumeClaimTemplates is a list of claims that pods are allowed to reference. The StatefulSet controller is responsible for mapping network identities to claims in a way that maintains the identity of a pod. Every claim in this list must have at least one matching (by name) volumeMount in one container in the template. A claim in this list takes precedence over any volumes in the template, with the same name.
"""
Base.@kwdef mutable struct IoK8sApiAppsV1beta1StatefulSetSpec <: OpenAPI.APIModel
    podManagementPolicy::Union{Nothing, String} = nothing
    replicas::Union{Nothing, Int64} = nothing
    revisionHistoryLimit::Union{Nothing, Int64} = nothing
    selector = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector }
    serviceName::Union{Nothing, String} = nothing
    template = nothing # spec type: Union{ Nothing, IoK8sApiCoreV1PodTemplateSpec }
    updateStrategy = nothing # spec type: Union{ Nothing, IoK8sApiAppsV1beta1StatefulSetUpdateStrategy }
    volumeClaimTemplates::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1PersistentVolumeClaim} }

    function IoK8sApiAppsV1beta1StatefulSetSpec(podManagementPolicy, replicas, revisionHistoryLimit, selector, serviceName, template, updateStrategy, volumeClaimTemplates, )
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetSpec, Symbol("podManagementPolicy"), podManagementPolicy)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetSpec, Symbol("replicas"), replicas)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetSpec, Symbol("revisionHistoryLimit"), revisionHistoryLimit)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetSpec, Symbol("selector"), selector)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetSpec, Symbol("serviceName"), serviceName)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetSpec, Symbol("template"), template)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetSpec, Symbol("updateStrategy"), updateStrategy)
        OpenAPI.validate_property(IoK8sApiAppsV1beta1StatefulSetSpec, Symbol("volumeClaimTemplates"), volumeClaimTemplates)
        return new(podManagementPolicy, replicas, revisionHistoryLimit, selector, serviceName, template, updateStrategy, volumeClaimTemplates, )
    end
end # type IoK8sApiAppsV1beta1StatefulSetSpec

const _property_types_IoK8sApiAppsV1beta1StatefulSetSpec = Dict{Symbol,String}(Symbol("podManagementPolicy")=>"String", Symbol("replicas")=>"Int64", Symbol("revisionHistoryLimit")=>"Int64", Symbol("selector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("serviceName")=>"String", Symbol("template")=>"IoK8sApiCoreV1PodTemplateSpec", Symbol("updateStrategy")=>"IoK8sApiAppsV1beta1StatefulSetUpdateStrategy", Symbol("volumeClaimTemplates")=>"Vector{IoK8sApiCoreV1PersistentVolumeClaim}", )
OpenAPI.property_type(::Type{ IoK8sApiAppsV1beta1StatefulSetSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1beta1StatefulSetSpec[name]))}

function check_required(o::IoK8sApiAppsV1beta1StatefulSetSpec)
    o.serviceName === nothing && (return false)
    o.template === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAppsV1beta1StatefulSetSpec }, name::Symbol, val)
    if name === Symbol("replicas")
        OpenAPI.validate_param(name, "IoK8sApiAppsV1beta1StatefulSetSpec", :format, val, "int32")
    end
    if name === Symbol("revisionHistoryLimit")
        OpenAPI.validate_param(name, "IoK8sApiAppsV1beta1StatefulSetSpec", :format, val, "int32")
    end
end
