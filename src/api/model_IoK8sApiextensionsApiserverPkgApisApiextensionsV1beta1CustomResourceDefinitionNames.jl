# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames <: SwaggerModel
    categories::Any # spec type: Union{ Nothing, Vector{String} } # spec name: categories
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    listKind::Any # spec type: Union{ Nothing, String } # spec name: listKind
    plural::Any # spec type: Union{ Nothing, String } # spec name: plural
    shortNames::Any # spec type: Union{ Nothing, Vector{String} } # spec name: shortNames
    singular::Any # spec type: Union{ Nothing, String } # spec name: singular

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames(;categories=nothing, kind=nothing, listKind=nothing, plural=nothing, shortNames=nothing, singular=nothing)
        o = new()
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames, Symbol("categories"), categories)
        setfield!(o, Symbol("categories"), categories)
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames, Symbol("listKind"), listKind)
        setfield!(o, Symbol("listKind"), listKind)
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames, Symbol("plural"), plural)
        setfield!(o, Symbol("plural"), plural)
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames, Symbol("shortNames"), shortNames)
        setfield!(o, Symbol("shortNames"), shortNames)
        validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames, Symbol("singular"), singular)
        setfield!(o, Symbol("singular"), singular)
        o
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames

const _property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames = Dict{Symbol,Symbol}(Symbol("categories")=>Symbol("categories"), Symbol("kind")=>Symbol("kind"), Symbol("listKind")=>Symbol("listKind"), Symbol("plural")=>Symbol("plural"), Symbol("shortNames")=>Symbol("shortNames"), Symbol("singular")=>Symbol("singular"))
const _property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames = Dict{Symbol,String}(Symbol("categories")=>"Vector{String}", Symbol("kind")=>"String", Symbol("listKind")=>"String", Symbol("plural")=>"String", Symbol("shortNames")=>"Vector{String}", Symbol("singular")=>"String")
Base.propertynames(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames }) = collect(keys(_property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames))
Swagger.property_type(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames[name]))}
Swagger.field_name(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames }, property_name::Symbol) =  _property_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames[property_name]

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames)
    (getproperty(o, Symbol("kind")) === nothing) && (return false)
    (getproperty(o, Symbol("plural")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames }, name::Symbol, val)
end
