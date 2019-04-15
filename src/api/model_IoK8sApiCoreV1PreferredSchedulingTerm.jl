# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiCoreV1PreferredSchedulingTerm <: SwaggerModel
    preference::Any # spec type: Union{ Nothing, IoK8sApiCoreV1NodeSelectorTerm } # spec name: preference
    weight::Any # spec type: Union{ Nothing, Int32 } # spec name: weight

    function IoK8sApiCoreV1PreferredSchedulingTerm(;preference=nothing, weight=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1PreferredSchedulingTerm, Symbol("preference"), preference)
        setfield!(o, Symbol("preference"), preference)
        validate_property(IoK8sApiCoreV1PreferredSchedulingTerm, Symbol("weight"), weight)
        setfield!(o, Symbol("weight"), weight)
        o
    end
end # type IoK8sApiCoreV1PreferredSchedulingTerm

const _property_map_IoK8sApiCoreV1PreferredSchedulingTerm = Dict{Symbol,Symbol}(Symbol("preference")=>Symbol("preference"), Symbol("weight")=>Symbol("weight"))
const _property_types_IoK8sApiCoreV1PreferredSchedulingTerm = Dict{Symbol,String}(Symbol("preference")=>"IoK8sApiCoreV1NodeSelectorTerm", Symbol("weight")=>"Int32")
Base.propertynames(::Type{ IoK8sApiCoreV1PreferredSchedulingTerm }) = collect(keys(_property_map_IoK8sApiCoreV1PreferredSchedulingTerm))
Swagger.property_type(::Type{ IoK8sApiCoreV1PreferredSchedulingTerm }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiCoreV1PreferredSchedulingTerm[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1PreferredSchedulingTerm }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1PreferredSchedulingTerm[property_name]

function check_required(o::IoK8sApiCoreV1PreferredSchedulingTerm)
    (getproperty(o, Symbol("preference")) === nothing) && (return false)
    (getproperty(o, Symbol("weight")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1PreferredSchedulingTerm }, name::Symbol, val)
end
