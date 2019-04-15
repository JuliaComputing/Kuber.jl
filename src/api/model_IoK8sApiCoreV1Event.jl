# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiCoreV1Event <: SwaggerModel
    action::Any # spec type: Union{ Nothing, String } # spec name: action
    apiVersion::Any # spec type: Union{ Nothing, String } # spec name: apiVersion
    count::Any # spec type: Union{ Nothing, Int32 } # spec name: count
    eventTime::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1MicroTime } # spec name: eventTime
    firstTimestamp::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1Time } # spec name: firstTimestamp
    involvedObject::Any # spec type: Union{ Nothing, IoK8sApiCoreV1ObjectReference } # spec name: involvedObject
    kind::Any # spec type: Union{ Nothing, String } # spec name: kind
    lastTimestamp::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1Time } # spec name: lastTimestamp
    message::Any # spec type: Union{ Nothing, String } # spec name: message
    metadata::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1ObjectMeta } # spec name: metadata
    reason::Any # spec type: Union{ Nothing, String } # spec name: reason
    related::Any # spec type: Union{ Nothing, IoK8sApiCoreV1ObjectReference } # spec name: related
    reportingComponent::Any # spec type: Union{ Nothing, String } # spec name: reportingComponent
    reportingInstance::Any # spec type: Union{ Nothing, String } # spec name: reportingInstance
    series::Any # spec type: Union{ Nothing, IoK8sApiCoreV1EventSeries } # spec name: series
    source::Any # spec type: Union{ Nothing, IoK8sApiCoreV1EventSource } # spec name: source
    type::Any # spec type: Union{ Nothing, String } # spec name: type

    function IoK8sApiCoreV1Event(;action=nothing, apiVersion=nothing, count=nothing, eventTime=nothing, firstTimestamp=nothing, involvedObject=nothing, kind=nothing, lastTimestamp=nothing, message=nothing, metadata=nothing, reason=nothing, related=nothing, reportingComponent=nothing, reportingInstance=nothing, series=nothing, source=nothing, type=nothing)
        o = new()
        validate_property(IoK8sApiCoreV1Event, Symbol("action"), action)
        setfield!(o, Symbol("action"), action)
        validate_property(IoK8sApiCoreV1Event, Symbol("apiVersion"), apiVersion)
        setfield!(o, Symbol("apiVersion"), apiVersion)
        validate_property(IoK8sApiCoreV1Event, Symbol("count"), count)
        setfield!(o, Symbol("count"), count)
        validate_property(IoK8sApiCoreV1Event, Symbol("eventTime"), eventTime)
        setfield!(o, Symbol("eventTime"), eventTime)
        validate_property(IoK8sApiCoreV1Event, Symbol("firstTimestamp"), firstTimestamp)
        setfield!(o, Symbol("firstTimestamp"), firstTimestamp)
        validate_property(IoK8sApiCoreV1Event, Symbol("involvedObject"), involvedObject)
        setfield!(o, Symbol("involvedObject"), involvedObject)
        validate_property(IoK8sApiCoreV1Event, Symbol("kind"), kind)
        setfield!(o, Symbol("kind"), kind)
        validate_property(IoK8sApiCoreV1Event, Symbol("lastTimestamp"), lastTimestamp)
        setfield!(o, Symbol("lastTimestamp"), lastTimestamp)
        validate_property(IoK8sApiCoreV1Event, Symbol("message"), message)
        setfield!(o, Symbol("message"), message)
        validate_property(IoK8sApiCoreV1Event, Symbol("metadata"), metadata)
        setfield!(o, Symbol("metadata"), metadata)
        validate_property(IoK8sApiCoreV1Event, Symbol("reason"), reason)
        setfield!(o, Symbol("reason"), reason)
        validate_property(IoK8sApiCoreV1Event, Symbol("related"), related)
        setfield!(o, Symbol("related"), related)
        validate_property(IoK8sApiCoreV1Event, Symbol("reportingComponent"), reportingComponent)
        setfield!(o, Symbol("reportingComponent"), reportingComponent)
        validate_property(IoK8sApiCoreV1Event, Symbol("reportingInstance"), reportingInstance)
        setfield!(o, Symbol("reportingInstance"), reportingInstance)
        validate_property(IoK8sApiCoreV1Event, Symbol("series"), series)
        setfield!(o, Symbol("series"), series)
        validate_property(IoK8sApiCoreV1Event, Symbol("source"), source)
        setfield!(o, Symbol("source"), source)
        validate_property(IoK8sApiCoreV1Event, Symbol("type"), type)
        setfield!(o, Symbol("type"), type)
        o
    end
end # type IoK8sApiCoreV1Event

const _property_map_IoK8sApiCoreV1Event = Dict{Symbol,Symbol}(Symbol("action")=>Symbol("action"), Symbol("apiVersion")=>Symbol("apiVersion"), Symbol("count")=>Symbol("count"), Symbol("eventTime")=>Symbol("eventTime"), Symbol("firstTimestamp")=>Symbol("firstTimestamp"), Symbol("involvedObject")=>Symbol("involvedObject"), Symbol("kind")=>Symbol("kind"), Symbol("lastTimestamp")=>Symbol("lastTimestamp"), Symbol("message")=>Symbol("message"), Symbol("metadata")=>Symbol("metadata"), Symbol("reason")=>Symbol("reason"), Symbol("related")=>Symbol("related"), Symbol("reportingComponent")=>Symbol("reportingComponent"), Symbol("reportingInstance")=>Symbol("reportingInstance"), Symbol("series")=>Symbol("series"), Symbol("source")=>Symbol("source"), Symbol("type")=>Symbol("type"))
const _property_types_IoK8sApiCoreV1Event = Dict{Symbol,String}(Symbol("action")=>"String", Symbol("apiVersion")=>"String", Symbol("count")=>"Int32", Symbol("eventTime")=>"IoK8sApimachineryPkgApisMetaV1MicroTime", Symbol("firstTimestamp")=>"IoK8sApimachineryPkgApisMetaV1Time", Symbol("involvedObject")=>"IoK8sApiCoreV1ObjectReference", Symbol("kind")=>"String", Symbol("lastTimestamp")=>"IoK8sApimachineryPkgApisMetaV1Time", Symbol("message")=>"String", Symbol("metadata")=>"IoK8sApimachineryPkgApisMetaV1ObjectMeta", Symbol("reason")=>"String", Symbol("related")=>"IoK8sApiCoreV1ObjectReference", Symbol("reportingComponent")=>"String", Symbol("reportingInstance")=>"String", Symbol("series")=>"IoK8sApiCoreV1EventSeries", Symbol("source")=>"IoK8sApiCoreV1EventSource", Symbol("type")=>"String")
Base.propertynames(::Type{ IoK8sApiCoreV1Event }) = collect(keys(_property_map_IoK8sApiCoreV1Event))
Swagger.property_type(::Type{ IoK8sApiCoreV1Event }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiCoreV1Event[name]))}
Swagger.field_name(::Type{ IoK8sApiCoreV1Event }, property_name::Symbol) =  _property_map_IoK8sApiCoreV1Event[property_name]

function check_required(o::IoK8sApiCoreV1Event)
    (getproperty(o, Symbol("involvedObject")) === nothing) && (return false)
    (getproperty(o, Symbol("metadata")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiCoreV1Event }, name::Symbol, val)
end
