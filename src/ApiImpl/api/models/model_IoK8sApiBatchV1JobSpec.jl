# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.batch.v1.JobSpec
JobSpec describes how the job execution will look like.

    IoK8sApiBatchV1JobSpec(;
        activeDeadlineSeconds=nothing,
        backoffLimit=nothing,
        completions=nothing,
        manualSelector=nothing,
        parallelism=nothing,
        selector=nothing,
        template=nothing,
        ttlSecondsAfterFinished=nothing,
    )

    - activeDeadlineSeconds::Int64 : Specifies the duration in seconds relative to the startTime that the job may be active before the system tries to terminate it; value must be positive integer
    - backoffLimit::Int64 : Specifies the number of retries before marking this job failed. Defaults to 6
    - completions::Int64 : Specifies the desired number of successfully finished pods the job should be run with.  Setting to nil means that the success of any pod signals the success of all pods, and allows parallelism to have any positive value.  Setting to 1 means that parallelism is limited to 1 and the success of that pod signals the success of the job. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
    - manualSelector::Bool : manualSelector controls generation of pod labels and pod selectors. Leave &#x60;manualSelector&#x60; unset unless you are certain what you are doing. When false or unset, the system pick labels unique to this job and appends those labels to the pod template.  When true, the user is responsible for picking unique labels and specifying the selector.  Failure to pick a unique label may cause this and other jobs to not function correctly.  However, You may see &#x60;manualSelector&#x3D;true&#x60; in jobs that were created with the old &#x60;extensions/v1beta1&#x60; API. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/#specifying-your-own-pod-selector
    - parallelism::Int64 : Specifies the maximum desired number of pods the job should run at any given time. The actual number of pods running in steady state will be less than this number when ((.spec.completions - .status.successful) &lt; .spec.parallelism), i.e. when the work left to do is less than max parallelism. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
    - selector::IoK8sApimachineryPkgApisMetaV1LabelSelector
    - template::IoK8sApiCoreV1PodTemplateSpec
    - ttlSecondsAfterFinished::Int64 : ttlSecondsAfterFinished limits the lifetime of a Job that has finished execution (either Complete or Failed). If this field is set, ttlSecondsAfterFinished after the Job finishes, it is eligible to be automatically deleted. When the Job is being deleted, its lifecycle guarantees (e.g. finalizers) will be honored. If this field is unset, the Job won&#39;t be automatically deleted. If this field is set to zero, the Job becomes eligible to be deleted immediately after it finishes. This field is alpha-level and is only honored by servers that enable the TTLAfterFinished feature.
"""
Base.@kwdef mutable struct IoK8sApiBatchV1JobSpec <: OpenAPI.APIModel
    activeDeadlineSeconds::Union{Nothing, Int64} = nothing
    backoffLimit::Union{Nothing, Int64} = nothing
    completions::Union{Nothing, Int64} = nothing
    manualSelector::Union{Nothing, Bool} = nothing
    parallelism::Union{Nothing, Int64} = nothing
    selector = nothing # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1LabelSelector }
    template = nothing # spec type: Union{ Nothing, IoK8sApiCoreV1PodTemplateSpec }
    ttlSecondsAfterFinished::Union{Nothing, Int64} = nothing

    function IoK8sApiBatchV1JobSpec(activeDeadlineSeconds, backoffLimit, completions, manualSelector, parallelism, selector, template, ttlSecondsAfterFinished, )
        OpenAPI.validate_property(IoK8sApiBatchV1JobSpec, Symbol("activeDeadlineSeconds"), activeDeadlineSeconds)
        OpenAPI.validate_property(IoK8sApiBatchV1JobSpec, Symbol("backoffLimit"), backoffLimit)
        OpenAPI.validate_property(IoK8sApiBatchV1JobSpec, Symbol("completions"), completions)
        OpenAPI.validate_property(IoK8sApiBatchV1JobSpec, Symbol("manualSelector"), manualSelector)
        OpenAPI.validate_property(IoK8sApiBatchV1JobSpec, Symbol("parallelism"), parallelism)
        OpenAPI.validate_property(IoK8sApiBatchV1JobSpec, Symbol("selector"), selector)
        OpenAPI.validate_property(IoK8sApiBatchV1JobSpec, Symbol("template"), template)
        OpenAPI.validate_property(IoK8sApiBatchV1JobSpec, Symbol("ttlSecondsAfterFinished"), ttlSecondsAfterFinished)
        return new(activeDeadlineSeconds, backoffLimit, completions, manualSelector, parallelism, selector, template, ttlSecondsAfterFinished, )
    end
end # type IoK8sApiBatchV1JobSpec

const _property_types_IoK8sApiBatchV1JobSpec = Dict{Symbol,String}(Symbol("activeDeadlineSeconds")=>"Int64", Symbol("backoffLimit")=>"Int64", Symbol("completions")=>"Int64", Symbol("manualSelector")=>"Bool", Symbol("parallelism")=>"Int64", Symbol("selector")=>"IoK8sApimachineryPkgApisMetaV1LabelSelector", Symbol("template")=>"IoK8sApiCoreV1PodTemplateSpec", Symbol("ttlSecondsAfterFinished")=>"Int64", )
OpenAPI.property_type(::Type{ IoK8sApiBatchV1JobSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiBatchV1JobSpec[name]))}

function check_required(o::IoK8sApiBatchV1JobSpec)
    o.template === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiBatchV1JobSpec }, name::Symbol, val)
    if name === Symbol("activeDeadlineSeconds")
        OpenAPI.validate_param(name, "IoK8sApiBatchV1JobSpec", :format, val, "int64")
    end
    if name === Symbol("backoffLimit")
        OpenAPI.validate_param(name, "IoK8sApiBatchV1JobSpec", :format, val, "int32")
    end
    if name === Symbol("completions")
        OpenAPI.validate_param(name, "IoK8sApiBatchV1JobSpec", :format, val, "int32")
    end
    if name === Symbol("parallelism")
        OpenAPI.validate_param(name, "IoK8sApiBatchV1JobSpec", :format, val, "int32")
    end
    if name === Symbol("ttlSecondsAfterFinished")
        OpenAPI.validate_param(name, "IoK8sApiBatchV1JobSpec", :format, val, "int32")
    end
end