# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiCoreV1DaemonEndpoint <: SwaggerModel
    Port::Any # spec type: Union{ Nothing, Int32 } # spec name: Port

    function IoK8sApiCoreV1DaemonEndpoint(;Port=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1DaemonEndpoint, Symbol("Port"), Port)
        setfield!(o, Symbol("Port"), Port)
        o
    end
end # type IoK8sApiCoreV1DaemonEndpoint

const _property_map_IoK8sApiCoreV1DaemonEndpoint = Dict{Symbol,Symbol}(Symbol("Port")=>Symbol("Port"))
const _property_types_IoK8sApiCoreV1DaemonEndpoint = Dict{Symbol,String}(Symbol("Port")=>"Int32")
Base.propertynames(::Type{ IoK8sApiCoreV1DaemonEndpoint }) = collect(keys(_property_map_IoK8sApiCoreV1DaemonEndpoint))
Swagger.property_type(::Type{ IoK8sApiCoreV1DaemonEndpoint }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1DaemonEndpoint[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1DaemonEndpoint }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1DaemonEndpoint[property_name]

function check_required(o::IoK8sApiCoreV1DaemonEndpoint)
    (getproperty(o, Symbol("Port")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1DaemonEndpoint }, name::Symbol, val)
end
