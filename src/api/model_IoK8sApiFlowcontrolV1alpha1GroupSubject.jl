# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiFlowcontrolV1alpha1GroupSubject <: SwaggerModel
    name::Any # spec type: Union{ Nothing, String } # spec name: name

    function IoK8sApiFlowcontrolV1alpha1GroupSubject(;name=nothing)
        o = new()
        validate_property(IoK8sApiFlowcontrolV1alpha1GroupSubject, Symbol("name"), name)
        setfield!(o, Symbol("name"), name)
        o
    end
end # type IoK8sApiFlowcontrolV1alpha1GroupSubject

const _property_map_IoK8sApiFlowcontrolV1alpha1GroupSubject = Dict{Symbol,Symbol}(Symbol("name")=>Symbol("name"))
const _property_types_IoK8sApiFlowcontrolV1alpha1GroupSubject = Dict{Symbol,String}(Symbol("name")=>"String")
Base.propertynames(::Type{ IoK8sApiFlowcontrolV1alpha1GroupSubject }) = collect(keys(_property_map_IoK8sApiFlowcontrolV1alpha1GroupSubject))
Swagger.property_type(::Type{ IoK8sApiFlowcontrolV1alpha1GroupSubject }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiFlowcontrolV1alpha1GroupSubject[name]))}
Swagger.field_name(::Type{ IoK8sApiFlowcontrolV1alpha1GroupSubject }, property_name::Symbol) =  _property_map_IoK8sApiFlowcontrolV1alpha1GroupSubject[property_name]

function check_required(o::IoK8sApiFlowcontrolV1alpha1GroupSubject)
    (getproperty(o, Symbol("name")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiFlowcontrolV1alpha1GroupSubject }, name::Symbol, val)
end
