# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiAuthorizationV1beta1NonResourceAttributes <: SwaggerModel
    path::Any # spec type: Union{ Nothing, String } # spec name: path
    verb::Any # spec type: Union{ Nothing, String } # spec name: verb

    function IoK8sApiAuthorizationV1beta1NonResourceAttributes(;path=nothing, verb=nothing)
        o = new()
        validate_property(IoK8sApiAuthorizationV1beta1NonResourceAttributes, Symbol("path"), path)
        setfield!(o, Symbol("path"), path)
        validate_property(IoK8sApiAuthorizationV1beta1NonResourceAttributes, Symbol("verb"), verb)
        setfield!(o, Symbol("verb"), verb)
        o
    end
end # type IoK8sApiAuthorizationV1beta1NonResourceAttributes

const _property_map_IoK8sApiAuthorizationV1beta1NonResourceAttributes = Dict{Symbol,Symbol}(Symbol("path")=>Symbol("path"), Symbol("verb")=>Symbol("verb"))
const _property_types_IoK8sApiAuthorizationV1beta1NonResourceAttributes = Dict{Symbol,String}(Symbol("path")=>"String", Symbol("verb")=>"String")
Base.propertynames(::Type{ IoK8sApiAuthorizationV1beta1NonResourceAttributes }) = collect(keys(_property_map_IoK8sApiAuthorizationV1beta1NonResourceAttributes))
Swagger.property_type(::Type{ IoK8sApiAuthorizationV1beta1NonResourceAttributes }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAuthorizationV1beta1NonResourceAttributes[name]))}
Swagger.field_name(::Type{ IoK8sApiAuthorizationV1beta1NonResourceAttributes }, property_name::Symbol) =  _property_map_IoK8sApiAuthorizationV1beta1NonResourceAttributes[property_name]

function check_required(o::IoK8sApiAuthorizationV1beta1NonResourceAttributes)
    true
end

function validate_property(::Type{ IoK8sApiAuthorizationV1beta1NonResourceAttributes }, name::Symbol, val)
end
