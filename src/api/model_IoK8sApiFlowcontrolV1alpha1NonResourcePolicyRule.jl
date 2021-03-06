# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule <: SwaggerModel
    nonResourceURLs::Any # spec type: Union{ Nothing, Vector{String} } # spec name: nonResourceURLs
    verbs::Any # spec type: Union{ Nothing, Vector{String} } # spec name: verbs

    function IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule(;nonResourceURLs=nothing, verbs=nothing)
        o = new()
        validate_property(IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule, Symbol("nonResourceURLs"), nonResourceURLs)
        setfield!(o, Symbol("nonResourceURLs"), nonResourceURLs)
        validate_property(IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule, Symbol("verbs"), verbs)
        setfield!(o, Symbol("verbs"), verbs)
        o
    end
end # type IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule

const _property_map_IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule = Dict{Symbol,Symbol}(Symbol("nonResourceURLs")=>Symbol("nonResourceURLs"), Symbol("verbs")=>Symbol("verbs"))
const _property_types_IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule = Dict{Symbol,String}(Symbol("nonResourceURLs")=>"Vector{String}", Symbol("verbs")=>"Vector{String}")
Base.propertynames(::Type{ IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule }) = collect(keys(_property_map_IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule))
Swagger.property_type(::Type{ IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule[name]))}
Swagger.field_name(::Type{ IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule }, property_name::Symbol) =  _property_map_IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule[property_name]

function check_required(o::IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule)
    (getproperty(o, Symbol("nonResourceURLs")) === nothing) && (return false)
    (getproperty(o, Symbol("verbs")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiFlowcontrolV1alpha1NonResourcePolicyRule }, name::Symbol, val)
end
