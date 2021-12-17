# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""CronJobStatus represents the current state of a cron job.

    IoK8sApiBatchV1beta1CronJobStatus(;
        active=nothing,
        lastScheduleTime=nothing,
    )

    - active::Vector{IoK8sApiCoreV1ObjectReference} : A list of pointers to currently running jobs.
    - lastScheduleTime::IoK8sApimachineryPkgApisMetaV1Time : Information when was the last time the job was successfully scheduled.
"""
mutable struct IoK8sApiBatchV1beta1CronJobStatus <: SwaggerModel
    active::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1ObjectReference} } # spec name: active
    lastScheduleTime::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1Time } # spec name: lastScheduleTime

    function IoK8sApiBatchV1beta1CronJobStatus(;active=nothing, lastScheduleTime=nothing)
        o = new()
        validate_property(IoK8sApiBatchV1beta1CronJobStatus, Symbol("active"), active)
        setfield!(o, Symbol("active"), active)
        validate_property(IoK8sApiBatchV1beta1CronJobStatus, Symbol("lastScheduleTime"), lastScheduleTime)
        setfield!(o, Symbol("lastScheduleTime"), lastScheduleTime)
        o
    end
end # type IoK8sApiBatchV1beta1CronJobStatus

const _property_map_IoK8sApiBatchV1beta1CronJobStatus = Dict{Symbol,Symbol}(Symbol("active")=>Symbol("active"), Symbol("lastScheduleTime")=>Symbol("lastScheduleTime"))
const _property_types_IoK8sApiBatchV1beta1CronJobStatus = Dict{Symbol,String}(Symbol("active")=>"Vector{IoK8sApiCoreV1ObjectReference}", Symbol("lastScheduleTime")=>"IoK8sApimachineryPkgApisMetaV1Time")
Base.propertynames(::Type{ IoK8sApiBatchV1beta1CronJobStatus }) = collect(keys(_property_map_IoK8sApiBatchV1beta1CronJobStatus))
Swagger.property_type(::Type{ IoK8sApiBatchV1beta1CronJobStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiBatchV1beta1CronJobStatus[name]))}
Swagger.field_name(::Type{ IoK8sApiBatchV1beta1CronJobStatus }, property_name::Symbol) =  _property_map_IoK8sApiBatchV1beta1CronJobStatus[property_name]

function check_required(o::IoK8sApiBatchV1beta1CronJobStatus)
    true
end

function validate_property(::Type{ IoK8sApiBatchV1beta1CronJobStatus }, name::Symbol, val)
end
