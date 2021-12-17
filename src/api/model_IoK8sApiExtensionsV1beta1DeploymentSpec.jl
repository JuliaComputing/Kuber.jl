# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""DeploymentSpec is the specification of the desired behavior of the Deployment.

    IoK8sApiExtensionsV1beta1DeploymentSpec(;
        minReadySeconds=nothing,
        paused=nothing,
        progressDeadlineSeconds=nothing,
        replicas=nothing,
        revisionHistoryLimit=nothing,
        rollbackTo=nothing,
        selector=nothing,
        strategy=nothing,
        template=nothing,
    )

    - minReadySeconds::Int32 : Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
    - paused::Bool : Indicates that the deployment is paused and will not be processed by the deployment controller.
    - progressDeadlineSeconds::Int32 : The maximum time in seconds for a deployment to make progress before it is considered to be failed. The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status. Note that progress will not be estimated during the time a deployment is paused. This is set to the max value of int32 (i.e. 2147483647) by default, which means \&quot;no deadline\&quot;.
    - replicas::Int32 : Number of desired pods. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.
    - revisionHistoryLimit::Int32 : The number of old ReplicaSets to retain to allow rollback. This is a pointer to distinguish between explicit zero and not specified. This is set to the max value of int32 (i.e. 2147483647) by default, which means \&quot;retaining all old RelicaSets\&quot;.
    - rollbackTo::IoK8sApiExtensionsV1beta1RollbackConfig : DEPRECATED. The config this deployment is rolling back to. Will be cleared after rollback is done.
    - selector::IoK8sApimachineryPkgApisMetaV1LabelSelector : Label selector for pods. Existing ReplicaSets whose pods are selected by this will be the ones affected by this deployment.
    - strategy::IoK8sApiExtensionsV1beta1DeploymentStrategy : The deployment strategy to use to replace existing pods with new ones.
    - template::IoK8sApiCoreV1PodTemplateSpec : Template describes the pods that will be created.
"""
mutable struct IoK8sApiExtensionsV1beta1DeploymentSpec <: SwaggerModel
    minReadySeconds::Any # spec type: Union{ Nothing, Int32 } # spec name: minReadySeconds
    paused::Any # spec type: Union{ Nothing, Bool } # spec name: paused
    progressDeadlineSeconds::Any # spec type: Union{ Nothing, Int32 } # spec name: progressDeadlineSeconds
    replicas::Any # spec type: Union{ Nothing, Int32 } # spec name: replicas
    revisionHistoryLimit::Any # spec type: Union{ Nothing, Int32 } # spec name: revisionHistoryLimit
    rollbackTo::Any # spec type: Union{ Nothing, IoK8sApiExtensionsV1beta1RollbackConfig } # spec name: rollbackTo
    selector::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector } # spec name: selector
    strategy::Any # spec type: Union{ Nothing, IoK8sApiExtensionsV1beta1DeploymentStrategy } # spec name: strategy
    template::Any # spec type: Union{ Nothing, IoK8sApiCoreV1PodTemplateSpec } # spec name: template

    function IoK8sApiExtensionsV1beta1DeploymentSpec(;minReadySeconds=nothing, paused=nothing, progressDeadlineSeconds=nothing, replicas=nothing, revisionHistoryLimit=nothing, rollbackTo=nothing, selector=nothing, strategy=nothing, template=nothing)
        o = new()
        validate_property(IoK8sApiExtensionsV1beta1DeploymentSpec, Symbol("minReadySeconds"), minReadySeconds)
        setfield!(o, Symbol("minReadySeconds"), minReadySeconds)
        validate_property(IoK8sApiExtensionsV1beta1DeploymentSpec, Symbol("paused"), paused)
        setfield!(o, Symbol("paused"), paused)
        validate_property(IoK8sApiExtensionsV1beta1DeploymentSpec, Symbol("progressDeadlineSeconds"), progressDeadlineSeconds)
        setfield!(o, Symbol("progressDeadlineSeconds"), progressDeadlineSeconds)
        validate_property(IoK8sApiExtensionsV1beta1DeploymentSpec, Symbol("replicas"), replicas)
        setfield!(o, Symbol("replicas"), replicas)
        validate_property(IoK8sApiExtensionsV1beta1DeploymentSpec, Symbol("revisionHistoryLimit"), revisionHistoryLimit)
        setfield!(o, Symbol("revisionHistoryLimit"), revisionHistoryLimit)
        validate_property(IoK8sApiExtensionsV1beta1DeploymentSpec, Symbol("rollbackTo"), rollbackTo)
        setfield!(o, Symbol("rollbackTo"), rollbackTo)
        validate_property(IoK8sApiExtensionsV1beta1DeploymentSpec, Symbol("selector"), selector)
        setfield!(o, Symbol("selector"), selector)
        validate_property(IoK8sApiExtensionsV1beta1DeploymentSpec, Symbol("strategy"), strategy)
        setfield!(o, Symbol("strategy"), strategy)
        validate_property(IoK8sApiExtensionsV1beta1DeploymentSpec, Symbol("template"), template)
        setfield!(o, Symbol("template"), template)
        o
    end
end # type IoK8sApiExtensionsV1beta1DeploymentSpec

const _property_map_IoK8sApiExtensionsV1beta1DeploymentSpec = Dict{Symbol,Symbol}(Symbol("minReadySeconds")=>Symbol("minReadySeconds"), Symbol("paused")=>Symbol("paused"), Symbol("progressDeadlineSeconds")=>Symbol("progressDeadlineSeconds"), Symbol("replicas")=>Symbol("replicas"), Symbol("revisionHistoryLimit")=>Symbol("revisionHistoryLimit"), Symbol("rollbackTo")=>Symbol("rollbackTo"), Symbol("selector")=>Symbol("selector"), Symbol("strategy")=>Symbol("strategy"), Symbol("template")=>Symbol("template"))
const _property_types_IoK8sApiExtensionsV1beta1DeploymentSpec = Dict{Symbol,String}(Symbol("minReadySeconds")=>"Int32", Symbol("paused")=>"Bool", Symbol("progressDeadlineSeconds")=>"Int32", Symbol("replicas")=>"Int32", Symbol("revisionHistoryLimit")=>"Int32", Symbol("rollbackTo")=>"IoK8sApiExtensionsV1beta1RollbackConfig", Symbol("selector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("strategy")=>"IoK8sApiExtensionsV1beta1DeploymentStrategy", Symbol("template")=>"IoK8sApiCoreV1PodTemplateSpec")
Base.propertynames(::Type{ IoK8sApiExtensionsV1beta1DeploymentSpec }) = collect(keys(_property_map_IoK8sApiExtensionsV1beta1DeploymentSpec))
Swagger.property_type(::Type{ IoK8sApiExtensionsV1beta1DeploymentSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1DeploymentSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiExtensionsV1beta1DeploymentSpec }, property_name::Symbol) =  _property_map_IoK8sApiExtensionsV1beta1DeploymentSpec[property_name]

function check_required(o::IoK8sApiExtensionsV1beta1DeploymentSpec)
    (getproperty(o, Symbol("template")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiExtensionsV1beta1DeploymentSpec }, name::Symbol, val)
end
