# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""Handler defines a specific action that should be taken

    IoK8sApiCoreV1Handler(;
        exec=nothing,
        httpGet=nothing,
        tcpSocket=nothing,
    )

    - exec::IoK8sApiCoreV1ExecAction : One and only one of the following should be specified. Exec specifies the action to take.
    - httpGet::IoK8sApiCoreV1HTTPGetAction : HTTPGet specifies the http request to perform.
    - tcpSocket::IoK8sApiCoreV1TCPSocketAction : TCPSocket specifies an action involving a TCP port. TCP hooks not yet supported
"""
mutable struct IoK8sApiCoreV1Handler <: SwaggerModel
    exec::Any # spec type: Union{ Nothing, IoK8sApiCoreV1ExecAction } # spec name: exec
    httpGet::Any # spec type: Union{ Nothing, IoK8sApiCoreV1HTTPGetAction } # spec name: httpGet
    tcpSocket::Any # spec type: Union{ Nothing, IoK8sApiCoreV1TCPSocketAction } # spec name: tcpSocket

    function IoK8sApiCoreV1Handler(;exec=nothing, httpGet=nothing, tcpSocket=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1Handler, Symbol("exec"), exec)
        setfield!(o, Symbol("exec"), exec)
        validate_property(IoK8sApiCoreV1Handler, Symbol("httpGet"), httpGet)
        setfield!(o, Symbol("httpGet"), httpGet)
        validate_property(IoK8sApiCoreV1Handler, Symbol("tcpSocket"), tcpSocket)
        setfield!(o, Symbol("tcpSocket"), tcpSocket)
        o
    end
end # type IoK8sApiCoreV1Handler

const _property_map_IoK8sApiCoreV1Handler = Dict{Symbol,Symbol}(Symbol("exec")=>Symbol("exec"), Symbol("httpGet")=>Symbol("httpGet"), Symbol("tcpSocket")=>Symbol("tcpSocket"))
const _property_types_IoK8sApiCoreV1Handler = Dict{Symbol,String}(Symbol("exec")=>"IoK8sApiCoreV1ExecAction", Symbol("httpGet")=>"IoK8sApiCoreV1HTTPGetAction", Symbol("tcpSocket")=>"IoK8sApiCoreV1TCPSocketAction")
Base.propertynames(::Type{ IoK8sApiCoreV1Handler }) = collect(keys(_property_map_IoK8sApiCoreV1Handler))
Swagger.property_type(::Type{ IoK8sApiCoreV1Handler }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1Handler[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1Handler }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1Handler[property_name]

function check_required(o::IoK8sApiCoreV1Handler)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1Handler }, name::Symbol, val)
end