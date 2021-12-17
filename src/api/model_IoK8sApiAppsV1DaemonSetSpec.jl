# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""DaemonSetSpec is the specification of a daemon set.

    IoK8sApiAppsV1DaemonSetSpec(;
        minReadySeconds=nothing,
        revisionHistoryLimit=nothing,
        selector=nothing,
        template=nothing,
        updateStrategy=nothing,
    )

    - minReadySeconds::Int32 : The minimum number of seconds for which a newly created DaemonSet pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready).
    - revisionHistoryLimit::Int32 : The number of old history to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. Defaults to 10.
    - selector::IoK8sApimachineryPkgApisMetaV1LabelSelector : A label query over pods that are managed by the daemon set. Must match in order to be controlled. It must match the pod template&#39;s labels. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
    - template::IoK8sApiCoreV1PodTemplateSpec : An object that describes the pod that will be created. The DaemonSet will create exactly one copy of this pod on every node that matches the template&#39;s node selector (or on every node if no node selector is specified). More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
    - updateStrategy::IoK8sApiAppsV1DaemonSetUpdateStrategy : An update strategy to replace existing DaemonSet pods with new pods.
"""
mutable struct IoK8sApiAppsV1DaemonSetSpec <: SwaggerModel
    minReadySeconds::Any # spec type: Union{ Nothing, Int32 } # spec name: minReadySeconds
    revisionHistoryLimit::Any # spec type: Union{ Nothing, Int32 } # spec name: revisionHistoryLimit
    selector::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector } # spec name: selector
    template::Any # spec type: Union{ Nothing, IoK8sApiCoreV1PodTemplateSpec } # spec name: template
    updateStrategy::Any # spec type: Union{ Nothing, IoK8sApiAppsV1DaemonSetUpdateStrategy } # spec name: updateStrategy

    function IoK8sApiAppsV1DaemonSetSpec(;minReadySeconds=nothing, revisionHistoryLimit=nothing, selector=nothing, template=nothing, updateStrategy=nothing)
        o = new()
        validate_property(IoK8sApiAppsV1DaemonSetSpec, Symbol("minReadySeconds"), minReadySeconds)
        setfield!(o, Symbol("minReadySeconds"), minReadySeconds)
        validate_property(IoK8sApiAppsV1DaemonSetSpec, Symbol("revisionHistoryLimit"), revisionHistoryLimit)
        setfield!(o, Symbol("revisionHistoryLimit"), revisionHistoryLimit)
        validate_property(IoK8sApiAppsV1DaemonSetSpec, Symbol("selector"), selector)
        setfield!(o, Symbol("selector"), selector)
        validate_property(IoK8sApiAppsV1DaemonSetSpec, Symbol("template"), template)
        setfield!(o, Symbol("template"), template)
        validate_property(IoK8sApiAppsV1DaemonSetSpec, Symbol("updateStrategy"), updateStrategy)
        setfield!(o, Symbol("updateStrategy"), updateStrategy)
        o
    end
end # type IoK8sApiAppsV1DaemonSetSpec

const _property_map_IoK8sApiAppsV1DaemonSetSpec = Dict{Symbol,Symbol}(Symbol("minReadySeconds")=>Symbol("minReadySeconds"), Symbol("revisionHistoryLimit")=>Symbol("revisionHistoryLimit"), Symbol("selector")=>Symbol("selector"), Symbol("template")=>Symbol("template"), Symbol("updateStrategy")=>Symbol("updateStrategy"))
const _property_types_IoK8sApiAppsV1DaemonSetSpec = Dict{Symbol,String}(Symbol("minReadySeconds")=>"Int32", Symbol("revisionHistoryLimit")=>"Int32", Symbol("selector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("template")=>"IoK8sApiCoreV1PodTemplateSpec", Symbol("updateStrategy")=>"IoK8sApiAppsV1DaemonSetUpdateStrategy")
Base.propertynames(::Type{ IoK8sApiAppsV1DaemonSetSpec }) = collect(keys(_property_map_IoK8sApiAppsV1DaemonSetSpec))
Swagger.property_type(::Type{ IoK8sApiAppsV1DaemonSetSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1DaemonSetSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiAppsV1DaemonSetSpec }, property_name::Symbol) =  _property_map_IoK8sApiAppsV1DaemonSetSpec[property_name]

function check_required(o::IoK8sApiAppsV1DaemonSetSpec)
    (getproperty(o, Symbol("selector")) === nothing) && (return false)
    (getproperty(o, Symbol("template")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAppsV1DaemonSetSpec }, name::Symbol, val)
end
