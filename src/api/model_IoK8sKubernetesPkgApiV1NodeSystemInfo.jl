# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sKubernetesPkgApiV1NodeSystemInfo <: SwaggerModel

    function IoK8sKubernetesPkgApiV1NodeSystemInfo(;)
        o = new()
        o
    end
end # type IoK8sKubernetesPkgApiV1NodeSystemInfo

const _property_map_IoK8sKubernetesPkgApiV1NodeSystemInfo = Dict{Symbol,Symbol}()
const _property_types_IoK8sKubernetesPkgApiV1NodeSystemInfo = Dict{Symbol,String}()
Base.propertynames(::Type{ IoK8sKubernetesPkgApiV1NodeSystemInfo }) = collect(keys(_property_map_IoK8sKubernetesPkgApiV1NodeSystemInfo))
Swagger.property_type(::Type{ IoK8sKubernetesPkgApiV1NodeSystemInfo }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sKubernetesPkgApiV1NodeSystemInfo[name]))}
Swagger.field_name(::Type{ IoK8sKubernetesPkgApiV1NodeSystemInfo }, property_name::Symbol) =  _property_map_IoK8sKubernetesPkgApiV1NodeSystemInfo[property_name]

function check_required(o::IoK8sKubernetesPkgApiV1NodeSystemInfo)
    true
end

function validate_property(::Type{ IoK8sKubernetesPkgApiV1NodeSystemInfo }, name::Symbol, val)
end
