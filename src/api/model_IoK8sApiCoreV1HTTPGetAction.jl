# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiCoreV1HTTPGetAction <: SwaggerModel
    host::Any # spec type: Union{ Nothing, String } # spec name: host
    httpHeaders::Any # spec type: Union{ Nothing, Vector{IoK8sApiCoreV1HTTPHeader} } # spec name: httpHeaders
    path::Any # spec type: Union{ Nothing, String } # spec name: path
    port::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgUtilIntstrIntOrString } # spec name: port
    scheme::Any # spec type: Union{ Nothing, String } # spec name: scheme

    function IoK8sApiCoreV1HTTPGetAction(;host=nothing, httpHeaders=nothing, path=nothing, port=nothing, scheme=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1HTTPGetAction, Symbol("host"), host)
        setfield!(o, Symbol("host"), host)
        validate_property(IoK8sApiCoreV1HTTPGetAction, Symbol("httpHeaders"), httpHeaders)
        setfield!(o, Symbol("httpHeaders"), httpHeaders)
        validate_property(IoK8sApiCoreV1HTTPGetAction, Symbol("path"), path)
        setfield!(o, Symbol("path"), path)
        validate_property(IoK8sApiCoreV1HTTPGetAction, Symbol("port"), port)
        setfield!(o, Symbol("port"), port)
        validate_property(IoK8sApiCoreV1HTTPGetAction, Symbol("scheme"), scheme)
        setfield!(o, Symbol("scheme"), scheme)
        o
    end
end # type IoK8sApiCoreV1HTTPGetAction

const _property_map_IoK8sApiCoreV1HTTPGetAction = Dict{Symbol,Symbol}(Symbol("host")=>Symbol("host"), Symbol("httpHeaders")=>Symbol("httpHeaders"), Symbol("path")=>Symbol("path"), Symbol("port")=>Symbol("port"), Symbol("scheme")=>Symbol("scheme"))
const _property_types_IoK8sApiCoreV1HTTPGetAction = Dict{Symbol,String}(Symbol("host")=>"String", Symbol("httpHeaders")=>"Vector{IoK8sApiCoreV1HTTPHeader}", Symbol("path")=>"String", Symbol("port")=>"IoK8sApimachineryPkgUtilIntstrIntOrString", Symbol("scheme")=>"String")
Base.propertynames(::Type{ IoK8sApiCoreV1HTTPGetAction }) = collect(keys(_property_map_IoK8sApiCoreV1HTTPGetAction))
Swagger.property_type(::Type{ IoK8sApiCoreV1HTTPGetAction }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiCoreV1HTTPGetAction[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1HTTPGetAction }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1HTTPGetAction[property_name]

function check_required(o::IoK8sApiCoreV1HTTPGetAction)
    (getproperty(o, Symbol("port")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1HTTPGetAction }, name::Symbol, val)
end