# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""QueuingConfiguration holds the configuration parameters for queuing

    IoK8sApiFlowcontrolV1alpha1QueuingConfiguration(;
        handSize=nothing,
        queueLengthLimit=nothing,
        queues=nothing,
    )

    - handSize::Int32 : &#x60;handSize&#x60; is a small positive number that configures the shuffle sharding of requests into queues.  When enqueuing a request at this priority level the request&#39;s flow identifier (a string pair) is hashed and the hash value is used to shuffle the list of queues and deal a hand of the size specified here.  The request is put into one of the shortest queues in that hand. &#x60;handSize&#x60; must be no larger than &#x60;queues&#x60;, and should be significantly smaller (so that a few heavy flows do not saturate most of the queues).  See the user-facing documentation for more extensive guidance on setting this field.  This field has a default value of 8.
    - queueLengthLimit::Int32 : &#x60;queueLengthLimit&#x60; is the maximum number of requests allowed to be waiting in a given queue of this priority level at a time; excess requests are rejected.  This value must be positive.  If not specified, it will be defaulted to 50.
    - queues::Int32 : &#x60;queues&#x60; is the number of queues for this priority level. The queues exist independently at each apiserver. The value must be positive.  Setting it to 1 effectively precludes shufflesharding and thus makes the distinguisher method of associated flow schemas irrelevant.  This field has a default value of 64.
"""
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
