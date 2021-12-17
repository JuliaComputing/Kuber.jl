# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""Lifecycle describes actions that the management system should take in response to container lifecycle events. For the PostStart and PreStop lifecycle handlers, management of the container blocks until the action is complete, unless the container process fails, in which case the handler is aborted.

    IoK8sApiCoreV1Lifecycle(;
        postStart=nothing,
        preStop=nothing,
    )

    - postStart::IoK8sApiCoreV1Handler : PostStart is called immediately after a container is created. If the handler fails, the container is terminated and restarted according to its restart policy. Other management of the container blocks until the hook completes. More info: https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/#container-hooks
    - preStop::IoK8sApiCoreV1Handler : PreStop is called immediately before a container is terminated due to an API request or management event such as liveness/startup probe failure, preemption, resource contention, etc. The handler is not called if the container crashes or exits. The reason for termination is passed to the handler. The Pod&#39;s termination grace period countdown begins before the PreStop hooked is executed. Regardless of the outcome of the handler, the container will eventually terminate within the Pod&#39;s termination grace period. Other management of the container blocks until the hook completes or until the termination grace period is reached. More info: https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/#container-hooks
"""
mutable struct IoK8sApiCoreV1Lifecycle <: SwaggerModel
    postStart::Any # spec type: Union{ Nothing, IoK8sApiCoreV1Handler } # spec name: postStart
    preStop::Any # spec type: Union{ Nothing, IoK8sApiCoreV1Handler } # spec name: preStop

    function IoK8sApiCoreV1Lifecycle(;postStart=nothing, preStop=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1Lifecycle, Symbol("postStart"), postStart)
        setfield!(o, Symbol("postStart"), postStart)
        validate_property(IoK8sApiCoreV1Lifecycle, Symbol("preStop"), preStop)
        setfield!(o, Symbol("preStop"), preStop)
        o
    end
end # type IoK8sApiCoreV1Lifecycle

const _property_map_IoK8sApiCoreV1Lifecycle = Dict{Symbol,Symbol}(Symbol("postStart")=>Symbol("postStart"), Symbol("preStop")=>Symbol("preStop"))
const _property_types_IoK8sApiCoreV1Lifecycle = Dict{Symbol,String}(Symbol("postStart")=>"IoK8sApiCoreV1Handler", Symbol("preStop")=>"IoK8sApiCoreV1Handler")
Base.propertynames(::Type{ IoK8sApiCoreV1Lifecycle }) = collect(keys(_property_map_IoK8sApiCoreV1Lifecycle))
Swagger.property_type(::Type{ IoK8sApiCoreV1Lifecycle }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1Lifecycle[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1Lifecycle }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1Lifecycle[property_name]

function check_required(o::IoK8sApiCoreV1Lifecycle)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1Lifecycle }, name::Symbol, val)
end
