# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus <: SwaggerModel

    function IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus

const _property_map_IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus }) = collect(keys(_property_map_IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus[property_name]

function check_required(o::IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisBatchV2alpha1CronJobStatus }, name::Symbol, val)
end
