# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiCoreV1ScopedResourceSelectorRequirement <: SwaggerModel
    operator::Any # spec type: Union{ Nothing, String } # spec name: operator
    scopeName::Any # spec type: Union{ Nothing, String } # spec name: scopeName
    values::Any # spec type: Union{ Nothing, Vector{String} } # spec name: values

    function IoK8sApiCoreV1ScopedResourceSelectorRequirement(;operator=nothing, scopeName=nothing, values=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1ScopedResourceSelectorRequirement, Symbol("operator"), operator)
        setfield!(o, Symbol("operator"), operator)
        validate_property(IoK8sApiCoreV1ScopedResourceSelectorRequirement, Symbol("scopeName"), scopeName)
        setfield!(o, Symbol("scopeName"), scopeName)
        validate_property(IoK8sApiCoreV1ScopedResourceSelectorRequirement, Symbol("values"), values)
        setfield!(o, Symbol("values"), values)
        o
    end
end # type IoK8sApiCoreV1ScopedResourceSelectorRequirement

const _property_map_IoK8sApiCoreV1ScopedResourceSelectorRequirement = Dict{Symbol,Symbol}(Symbol("operator")=>Symbol("operator"), Symbol("scopeName")=>Symbol("scopeName"), Symbol("values")=>Symbol("values"))
const _property_types_IoK8sApiCoreV1ScopedResourceSelectorRequirement = Dict{Symbol,String}(Symbol("operator")=>"String", Symbol("scopeName")=>"String", Symbol("values")=>"Vector{String}")
Base.propertynames(::Type{ IoK8sApiCoreV1ScopedResourceSelectorRequirement }) = collect(keys(_property_map_IoK8sApiCoreV1ScopedResourceSelectorRequirement))
Swagger.property_type(::Type{ IoK8sApiCoreV1ScopedResourceSelectorRequirement }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoreV1ScopedResourceSelectorRequirement[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1ScopedResourceSelectorRequirement }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1ScopedResourceSelectorRequirement[property_name]

function check_required(o::IoK8sApiCoreV1ScopedResourceSelectorRequirement)
    (getproperty(o, Symbol("operator")) === nothing) && (return false)
    (getproperty(o, Symbol("scopeName")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1ScopedResourceSelectorRequirement }, name::Symbol, val)
end
