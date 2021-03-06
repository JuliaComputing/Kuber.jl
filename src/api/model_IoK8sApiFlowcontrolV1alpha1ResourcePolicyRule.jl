# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule <: SwaggerModel
    apiGroups::Any # spec type: Union{ Nothing, Vector{String} } # spec name: apiGroups
    clusterScope::Any # spec type: Union{ Nothing, Bool } # spec name: clusterScope
    namespaces::Any # spec type: Union{ Nothing, Vector{String} } # spec name: namespaces
    resources::Any # spec type: Union{ Nothing, Vector{String} } # spec name: resources
    verbs::Any # spec type: Union{ Nothing, Vector{String} } # spec name: verbs

    function IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule(;apiGroups=nothing, clusterScope=nothing, namespaces=nothing, resources=nothing, verbs=nothing)
        o = new()
        validate_property(IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule, Symbol("apiGroups"), apiGroups)
        setfield!(o, Symbol("apiGroups"), apiGroups)
        validate_property(IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule, Symbol("clusterScope"), clusterScope)
        setfield!(o, Symbol("clusterScope"), clusterScope)
        validate_property(IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule, Symbol("namespaces"), namespaces)
        setfield!(o, Symbol("namespaces"), namespaces)
        validate_property(IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule, Symbol("resources"), resources)
        setfield!(o, Symbol("resources"), resources)
        validate_property(IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule, Symbol("verbs"), verbs)
        setfield!(o, Symbol("verbs"), verbs)
        o
    end
end # type IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule

const _property_map_IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule = Dict{Symbol,Symbol}(Symbol("apiGroups")=>Symbol("apiGroups"), Symbol("clusterScope")=>Symbol("clusterScope"), Symbol("namespaces")=>Symbol("namespaces"), Symbol("resources")=>Symbol("resources"), Symbol("verbs")=>Symbol("verbs"))
const _property_types_IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule = Dict{Symbol,String}(Symbol("apiGroups")=>"Vector{String}", Symbol("clusterScope")=>"Bool", Symbol("namespaces")=>"Vector{String}", Symbol("resources")=>"Vector{String}", Symbol("verbs")=>"Vector{String}")
Base.propertynames(::Type{ IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule }) = collect(keys(_property_map_IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule))
Swagger.property_type(::Type{ IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule[name]))}
Swagger.field_name(::Type{ IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule }, property_name::Symbol) =  _property_map_IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule[property_name]

function check_required(o::IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule)
    (getproperty(o, Symbol("apiGroups")) === nothing) && (return false)
    (getproperty(o, Symbol("resources")) === nothing) && (return false)
    (getproperty(o, Symbol("verbs")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiFlowcontrolV1alpha1ResourcePolicyRule }, name::Symbol, val)
end
