# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiFlowcontrolV1alpha1QueuingConfiguration <: SwaggerModel
    handSize::Any # spec type: Union{ Nothing, Int32 } # spec name: handSize
    queueLengthLimit::Any # spec type: Union{ Nothing, Int32 } # spec name: queueLengthLimit
    queues::Any # spec type: Union{ Nothing, Int32 } # spec name: queues

    function IoK8sApiFlowcontrolV1alpha1QueuingConfiguration(;handSize=nothing, queueLengthLimit=nothing, queues=nothing)
        o = new()
        validate_property(IoK8sApiFlowcontrolV1alpha1QueuingConfiguration, Symbol("handSize"), handSize)
        setfield!(o, Symbol("handSize"), handSize)
        validate_property(IoK8sApiFlowcontrolV1alpha1QueuingConfiguration, Symbol("queueLengthLimit"), queueLengthLimit)
        setfield!(o, Symbol("queueLengthLimit"), queueLengthLimit)
        validate_property(IoK8sApiFlowcontrolV1alpha1QueuingConfiguration, Symbol("queues"), queues)
        setfield!(o, Symbol("queues"), queues)
        o
    end
end # type IoK8sApiFlowcontrolV1alpha1QueuingConfiguration

const _property_map_IoK8sApiFlowcontrolV1alpha1QueuingConfiguration = Dict{Symbol,Symbol}(Symbol("handSize")=>Symbol("handSize"), Symbol("queueLengthLimit")=>Symbol("queueLengthLimit"), Symbol("queues")=>Symbol("queues"))
const _property_types_IoK8sApiFlowcontrolV1alpha1QueuingConfiguration = Dict{Symbol,String}(Symbol("handSize")=>"Int32", Symbol("queueLengthLimit")=>"Int32", Symbol("queues")=>"Int32")
Base.propertynames(::Type{ IoK8sApiFlowcontrolV1alpha1QueuingConfiguration }) = collect(keys(_property_map_IoK8sApiFlowcontrolV1alpha1QueuingConfiguration))
Swagger.property_type(::Type{ IoK8sApiFlowcontrolV1alpha1QueuingConfiguration }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiFlowcontrolV1alpha1QueuingConfiguration[name]))}
Swagger.field_name(::Type{ IoK8sApiFlowcontrolV1alpha1QueuingConfiguration }, property_name::Symbol) =  _property_map_IoK8sApiFlowcontrolV1alpha1QueuingConfiguration[property_name]

function check_required(o::IoK8sApiFlowcontrolV1alpha1QueuingConfiguration)
    true
end

function validate_property(::Type{ IoK8sApiFlowcontrolV1alpha1QueuingConfiguration }, name::Symbol, val)
end