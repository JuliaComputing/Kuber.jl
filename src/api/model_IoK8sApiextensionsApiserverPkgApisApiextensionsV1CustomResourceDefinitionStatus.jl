# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus <: SwaggerModel
    acceptedNames::Any # spec type: Union{ Nothing, IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames } # spec name: acceptedNames
    conditions::Any # spec type: Union{ Nothing, Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionCondition} } # spec name: conditions
    storedVersions::Any # spec type: Union{ Nothing, Vector{String} } # spec name: storedVersions

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus(;acceptedNames=nothing, conditions=nothing, storedVersions=nothing)
        o = new()
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus, Symbol("acceptedNames"), acceptedNames)
        setfield!(o, Symbol("acceptedNames"), acceptedNames)
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus, Symbol("conditions"), conditions)
        setfield!(o, Symbol("conditions"), conditions)
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus, Symbol("storedVersions"), storedVersions)
        setfield!(o, Symbol("storedVersions"), storedVersions)
        o
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus

const _property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus = Dict{Symbol,Symbol}(Symbol("acceptedNames")=>Symbol("acceptedNames"), Symbol("conditions")=>Symbol("conditions"), Symbol("storedVersions")=>Symbol("storedVersions"))
const _property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus = Dict{Symbol,String}(Symbol("acceptedNames")=>"IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionNames", Symbol("conditions")=>"Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionCondition}", Symbol("storedVersions")=>"Vector{String}")
Base.propertynames(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus }) = collect(keys(_property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus))
Swagger.property_type(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus[name]))}
Swagger.field_name(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus }, property_name::Symbol) =  _property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus[property_name]

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus)
    (getproperty(o, Symbol("acceptedNames")) === nothing) && (return false)
    (getproperty(o, Symbol("storedVersions")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionStatus }, name::Symbol, val)
end
