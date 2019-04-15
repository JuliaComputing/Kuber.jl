# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApimachineryPkgApisMetaV1APIGroupList <: SwaggerModel
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    groups::Any # spec type: Union{ Nothing, Vector{IoK8sApimachineryPkgApisMetaV1APIGroup} } # spec name: groups
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind

    function IoK8sApimachineryPkgApisMetaV1APIGroupList(;apiVersion=nothing, groups=nothing, kind=nothing)
        o = new()
        validate_property(IoK8sApimachineryPkgApisMetaV1APIGroupList, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApimachineryPkgApisMetaV1APIGroupList, Symbol("groups"), groups)
        setfield!(o, Symbol("groups"), groups)
        validate_property(IoK8sApimachineryPkgApisMetaV1APIGroupList, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        o
    end
end # type IoK8sApimachineryPkgApisMetaV1APIGroupList

const _property_map_IoK8sApimachineryPkgApisMetaV1APIGroupList = Dict{Symbol,Symbol}(Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("groups")=>Symbol("groups"), Symbol("kind")=>Symbol("kind"))
const _property_types_IoK8sApimachineryPkgApisMetaV1APIGroupList = Dict{Symbol,String}(Symbol("apiVersion")=>"String", Symbol("groups")=>"Vector{IoK8sApimachineryPkgApisMetaV1APIGroup}", Symbol("kind")=>"String")
Base.propertynames(::Type{ IoK8sApimachineryPkgApisMetaV1APIGroupList }) = collect(keys(_property_map_IoK8sApimachineryPkgApisMetaV1APIGroupList))
Swagger.property_type(::Type{ IoK8sApimachineryPkgApisMetaV1APIGroupList }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApimachineryPkgApisMetaV1APIGroupList[name]))}
Swagger.field_name(::Type{ IoK8sApimachineryPkgApisMetaV1APIGroupList }, property_name::Symbol) =  _property_map_IoK8sApimachineryPkgApisMetaV1APIGroupList[property_name]

function check_required(o::IoK8sApimachineryPkgApisMetaV1APIGroupList)
    (getproperty(o, Symbol("groups")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApimachineryPkgApisMetaV1APIGroupList }, name::Symbol, val)
end
