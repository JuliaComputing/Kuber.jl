# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiBatchV1JobSpec <: SwaggerModel
    activeDeadlineSeconds::Any # spec type: Union{ Nothing, Int64 } # spec name: activeDeadlineSeconds
    backoffLimit::Any # spec type: Union{ Nothing, Int32 } # spec name: backoffLimit
    completions::Any # spec type: Union{ Nothing, Int32 } # spec name: completions
    manualSelector::Any # spec type: Union{ Nothing, Bool } # spec name: manualSelector
    parallelism::Any # spec type: Union{ Nothing, Int32 } # spec name: parallelism
    selector::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector } # spec name: selector
    template::Any # spec type: Union{ Nothing, IoK8sApiCoreV1PodTemplateSpec } # spec name: template
    ttlSecondsAfterFinished::Any # spec type: Union{ Nothing, Int32 } # spec name: ttlSecondsAfterFinished

    function IoK8sApiBatchV1JobSpec(;activeDeadlineSeconds=nothing, backoffLimit=nothing, completions=nothing, manualSelector=nothing, parallelism=nothing, selector=nothing, template=nothing, ttlSecondsAfterFinished=nothing)
        o = new()
        validate_property(IoK8sApiBatchV1JobSpec, Symbol("activeDeadlineSeconds"), activeDeadlineSeconds)
        setfield!(o, Symbol("activeDeadlineSeconds"), activeDeadlineSeconds)
        validate_property(IoK8sApiBatchV1JobSpec, Symbol("backoffLimit"), backoffLimit)
        setfield!(o, Symbol("backoffLimit"), backoffLimit)
        validate_property(IoK8sApiBatchV1JobSpec, Symbol("completions"), completions)
        setfield!(o, Symbol("completions"), completions)
        validate_property(IoK8sApiBatchV1JobSpec, Symbol("manualSelector"), manualSelector)
        setfield!(o, Symbol("manualSelector"), manualSelector)
        validate_property(IoK8sApiBatchV1JobSpec, Symbol("parallelism"), parallelism)
        setfield!(o, Symbol("parallelism"), parallelism)
        validate_property(IoK8sApiBatchV1JobSpec, Symbol("selector"), selector)
        setfield!(o, Symbol("selector"), selector)
        validate_property(IoK8sApiBatchV1JobSpec, Symbol("template"), template)
        setfield!(o, Symbol("template"), template)
        validate_property(IoK8sApiBatchV1JobSpec, Symbol("ttlSecondsAfterFinished"), ttlSecondsAfterFinished)
        setfield!(o, Symbol("ttlSecondsAfterFinished"), ttlSecondsAfterFinished)
        o
    end
end # type IoK8sApiBatchV1JobSpec

const _property_map_IoK8sApiBatchV1JobSpec = Dict{Symbol,Symbol}(Symbol("activeDeadlineSeconds")=>Symbol("activeDeadlineSeconds"), Symbol("backoffLimit")=>Symbol("backoffLimit"), Symbol("completions")=>Symbol("completions"), Symbol("manualSelector")=>Symbol("manualSelector"), Symbol("parallelism")=>Symbol("parallelism"), Symbol("selector")=>Symbol("selector"), Symbol("template")=>Symbol("template"), Symbol("ttlSecondsAfterFinished")=>Symbol("ttlSecondsAfterFinished"))
const _property_types_IoK8sApiBatchV1JobSpec = Dict{Symbol,String}(Symbol("activeDeadlineSeconds")=>"Int64", Symbol("backoffLimit")=>"Int32", Symbol("completions")=>"Int32", Symbol("manualSelector")=>"Bool", Symbol("parallelism")=>"Int32", Symbol("selector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("template")=>"IoK8sApiCoreV1PodTemplateSpec", Symbol("ttlSecondsAfterFinished")=>"Int32")
Base.propertynames(::Type{ IoK8sApiBatchV1JobSpec }) = collect(keys(_property_map_IoK8sApiBatchV1JobSpec))
Swagger.property_type(::Type{ IoK8sApiBatchV1JobSpec }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiBatchV1JobSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiBatchV1JobSpec }, property_name::Symbol) =  _property_map_IoK8sApiBatchV1JobSpec[property_name]

function check_required(o::IoK8sApiBatchV1JobSpec)
    (getproperty(o, Symbol("template")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiBatchV1JobSpec }, name::Symbol, val)
end