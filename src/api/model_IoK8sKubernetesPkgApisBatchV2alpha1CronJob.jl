# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApisBatchV2alpha1CronJob <: SwaggerModel

    function IoK8sKubernetesPkgApisBatchV2alpha1CronJob(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApisBatchV2alpha1CronJob

const _property_map_IoK8sKubernetesPkgApisBatchV2alpha1CronJob = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApisBatchV2alpha1CronJob = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApisBatchV2alpha1CronJob }) = collect(keys(_property_map_IoK8sKubernetesPkgApisBatchV2alpha1CronJob))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApisBatchV2alpha1CronJob }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApisBatchV2alpha1CronJob[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApisBatchV2alpha1CronJob }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApisBatchV2alpha1CronJob[property_name]

function check_required(o::IoK8sKubernetesPkgApisBatchV2alpha1CronJob)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApisBatchV2alpha1CronJob }, name::Symbol, val)
end