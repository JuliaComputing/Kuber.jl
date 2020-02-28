# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiAppsV1DeploymentSpec <: SwaggerModel
    minReadySeconds::Any # spec type: Union{ Nothing, Int32 } # spec name: minReadySeconds
    paused::Any # spec type: Union{ Nothing, Bool } # spec name: paused
    progressDeadlineSeconds::Any # spec type: Union{ Nothing, Int32 } # spec name: progressDeadlineSeconds
    replicas::Any # spec type: Union{ Nothing, Int32 } # spec name: replicas
    revisionHistoryLimit::Any # spec type: Union{ Nothing, Int32 } # spec name: revisionHistoryLimit
    selector::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector } # spec name: selector
    strategy::Any # spec type: Union{ Nothing, IoK8sApiAppsV1DeploymentStrategy } # spec name: strategy
    template::Any # spec type: Union{ Nothing, IoK8sApiCoreV1PodTemplateSpec } # spec name: template

    function IoK8sApiAppsV1DeploymentSpec(;minReadySeconds=nothing, paused=nothing, progressDeadlineSeconds=nothing, replicas=nothing, revisionHistoryLimit=nothing, selector=nothing, strategy=nothing, template=nothing)
        o = new()
        validate_property(IoK8sApiAppsV1DeploymentSpec, Symbol("minReadySeconds"), minReadySeconds)
        setfield!(o, Symbol("minReadySeconds"), minReadySeconds)
        validate_property(IoK8sApiAppsV1DeploymentSpec, Symbol("paused"), paused)
        setfield!(o, Symbol("paused"), paused)
        validate_property(IoK8sApiAppsV1DeploymentSpec, Symbol("progressDeadlineSeconds"), progressDeadlineSeconds)
        setfield!(o, Symbol("progressDeadlineSeconds"), progressDeadlineSeconds)
        validate_property(IoK8sApiAppsV1DeploymentSpec, Symbol("replicas"), replicas)
        setfield!(o, Symbol("replicas"), replicas)
        validate_property(IoK8sApiAppsV1DeploymentSpec, Symbol("revisionHistoryLimit"), revisionHistoryLimit)
        setfield!(o, Symbol("revisionHistoryLimit"), revisionHistoryLimit)
        validate_property(IoK8sApiAppsV1DeploymentSpec, Symbol("selector"), selector)
        setfield!(o, Symbol("selector"), selector)
        validate_property(IoK8sApiAppsV1DeploymentSpec, Symbol("strategy"), strategy)
        setfield!(o, Symbol("strategy"), strategy)
        validate_property(IoK8sApiAppsV1DeploymentSpec, Symbol("template"), template)
        setfield!(o, Symbol("template"), template)
        o
    end
end # type IoK8sApiAppsV1DeploymentSpec

const _property_map_IoK8sApiAppsV1DeploymentSpec = Dict{Symbol,Symbol}(Symbol("minReadySeconds")=>Symbol("minReadySeconds"), Symbol("paused")=>Symbol("paused"), Symbol("progressDeadlineSeconds")=>Symbol("progressDeadlineSeconds"), Symbol("replicas")=>Symbol("replicas"), Symbol("revisionHistoryLimit")=>Symbol("revisionHistoryLimit"), Symbol("selector")=>Symbol("selector"), Symbol("strategy")=>Symbol("strategy"), Symbol("template")=>Symbol("template"))
const _property_types_IoK8sApiAppsV1DeploymentSpec = Dict{Symbol,String}(Symbol("minReadySeconds")=>"Int32", Symbol("paused")=>"Bool", Symbol("progressDeadlineSeconds")=>"Int32", Symbol("replicas")=>"Int32", Symbol("revisionHistoryLimit")=>"Int32", Symbol("selector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("strategy")=>"IoK8sApiAppsV1DeploymentStrategy", Symbol("template")=>"IoK8sApiCoreV1PodTemplateSpec")
Base.propertynames(::Type{ IoK8sApiAppsV1DeploymentSpec }) = collect(keys(_property_map_IoK8sApiAppsV1DeploymentSpec))
Swagger.property_type(::Type{ IoK8sApiAppsV1DeploymentSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAppsV1DeploymentSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiAppsV1DeploymentSpec }, property_name::Symbol) =  _property_map_IoK8sApiAppsV1DeploymentSpec[property_name]

function check_required(o::IoK8sApiAppsV1DeploymentSpec)
    (getproperty(o, Symbol("selector")) === nothing) && (return false)
    (getproperty(o, Symbol("template")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiAppsV1DeploymentSpec }, name::Symbol, val)
end
