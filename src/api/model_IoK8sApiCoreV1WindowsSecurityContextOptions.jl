# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiCoreV1WindowsSecurityContextOptions <: SwaggerModel
    gmsaCredentialSpec::Any # spec type: Union{ Nothing, String } # spec name: gmsaCredentialSpec
    gmsaCredentialSpecName::Any # spec type: Union{ Nothing, String } # spec name: gmsaCredentialSpecName
    runAsUserName::Any # spec type: Union{ Nothing, String } # spec name: runAsUserName

    function IoK8sApiCoreV1WindowsSecurityContextOptions(;gmsaCredentialSpec=nothing, gmsaCredentialSpecName=nothing, runAsUserName=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1WindowsSecurityContextOptions, Symbol("gmsaCredentialSpec"), gmsaCredentialSpec)
        setfield!(o, Symbol("gmsaCredentialSpec"), gmsaCredentialSpec)
        validate_property(IoK8sApiCoreV1WindowsSecurityContextOptions, Symbol("gmsaCredentialSpecName"), gmsaCredentialSpecName)
        setfield!(o, Symbol("gmsaCredentialSpecName"), gmsaCredentialSpecName)
        validate_property(IoK8sApiCoreV1WindowsSecurityContextOptions, Symbol("runAsUserName"), runAsUserName)
        setfield!(o, Symbol("runAsUserName"), runAsUserName)
        o
    end
end # type IoK8sApiCoreV1WindowsSecurityContextOptions

const _property_map_IoK8sApiCoreV1WindowsSecurityContextOptions = Dict{Symbol,Symbol}(Symbol("gmsaCredentialSpec")=>Symbol("gmsaCredentialSpec"), Symbol("gmsaCredentialSpecName")=>Symbol("gmsaCredentialSpecName"), Symbol("runAsUserName")=>Symbol("runAsUserName"))
const _property_types_IoK8sApiCoreV1WindowsSecurityContextOptions = Dict{Symbol,String}(Symbol("gmsaCredentialSpec")=>"String", Symbol("gmsaCredentialSpecName")=>"String", Symbol("runAsUserName")=>"String")
Base.propertynames(::Type{ IoK8sApiCoreV1WindowsSecurityContextOptions }) = collect(keys(_property_map_IoK8sApiCoreV1WindowsSecurityContextOptions))
Swagger.property_type(::Type{ IoK8sApiCoreV1WindowsSecurityContextOptions }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1WindowsSecurityContextOptions[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1WindowsSecurityContextOptions }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1WindowsSecurityContextOptions[property_name]

function check_required(o::IoK8sApiCoreV1WindowsSecurityContextOptions)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1WindowsSecurityContextOptions }, name::Symbol, val)
end