# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1ResourceQuotaStatus <: SwaggerModel

    function IoK8sKubernetesPkgApiV1ResourceQuotaStatus(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1ResourceQuotaStatus

const _property_map_IoK8sKubernetesPkgApiV1ResourceQuotaStatus = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1ResourceQuotaStatus = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1ResourceQuotaStatus }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1ResourceQuotaStatus))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1ResourceQuotaStatus }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1ResourceQuotaStatus[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1ResourceQuotaStatus }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1ResourceQuotaStatus[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1ResourceQuotaStatus)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1ResourceQuotaStatus }, name::Symbol, val)
end