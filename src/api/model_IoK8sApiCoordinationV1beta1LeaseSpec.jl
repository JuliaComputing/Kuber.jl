# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiCoordinationV1beta1LeaseSpec <: SwaggerModel
    acquireTime::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1MicroTime } # spec name: acquireTime
    holderIdentity::Any # spec type: Union{ Nothing, String } # spec name: holderIdentity
    leaseDurationSeconds::Any # spec type: Union{ Nothing, Int32 } # spec name: leaseDurationSeconds
    leaseTransitions::Any # spec type: Union{ Nothing, Int32 } # spec name: leaseTransitions
    renewTime::Any # spec type: Union{ Nothing, IoK8sApimachineryPkgApisMetaV1MicroTime } # spec name: renewTime

    function IoK8sApiCoordinationV1beta1LeaseSpec(;acquireTime=nothing, holderIdentity=nothing, leaseDurationSeconds=nothing, leaseTransitions=nothing, renewTime=nothing)
        o = new()
        validate_property(IoK8sApiCoordinationV1beta1LeaseSpec, Symbol("acquireTime"), acquireTime)
        setfield!(o, Symbol("acquireTime"), acquireTime)
        validate_property(IoK8sApiCoordinationV1beta1LeaseSpec, Symbol("holderIdentity"), holderIdentity)
        setfield!(o, Symbol("holderIdentity"), holderIdentity)
        validate_property(IoK8sApiCoordinationV1beta1LeaseSpec, Symbol("leaseDurationSeconds"), leaseDurationSeconds)
        setfield!(o, Symbol("leaseDurationSeconds"), leaseDurationSeconds)
        validate_property(IoK8sApiCoordinationV1beta1LeaseSpec, Symbol("leaseTransitions"), leaseTransitions)
        setfield!(o, Symbol("leaseTransitions"), leaseTransitions)
        validate_property(IoK8sApiCoordinationV1beta1LeaseSpec, Symbol("renewTime"), renewTime)
        setfield!(o, Symbol("renewTime"), renewTime)
        o
    end
end # type IoK8sApiCoordinationV1beta1LeaseSpec

const _property_map_IoK8sApiCoordinationV1beta1LeaseSpec = Dict{Symbol,Symbol}(Symbol("acquireTime")=>Symbol("acquireTime"), Symbol("holderIdentity")=>Symbol("holderIdentity"), Symbol("leaseDurationSeconds")=>Symbol("leaseDurationSeconds"), Symbol("leaseTransitions")=>Symbol("leaseTransitions"), Symbol("renewTime")=>Symbol("renewTime"))
const _property_types_IoK8sApiCoordinationV1beta1LeaseSpec = Dict{Symbol,String}(Symbol("acquireTime")=>"IoK8sApimachineryPkgApisMetaV1MicroTime", Symbol("holderIdentity")=>"String", Symbol("leaseDurationSeconds")=>"Int32", Symbol("leaseTransitions")=>"Int32", Symbol("renewTime")=>"IoK8sApimachineryPkgApisMetaV1MicroTime")
Base.propertynames(::Type{ IoK8sApiCoordinationV1beta1LeaseSpec }) = collect(keys(_property_map_IoK8sApiCoordinationV1beta1LeaseSpec))
Swagger.property_type(::Type{ IoK8sApiCoordinationV1beta1LeaseSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoordinationV1beta1LeaseSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiCoordinationV1beta1LeaseSpec }, property_name::Symbol) =  _property_map_IoK8sApiCoordinationV1beta1LeaseSpec[property_name]

function check_required(o::IoK8sApiCoordinationV1beta1LeaseSpec)
    true
end

function validate_property(::Type{ IoK8sApiCoordinationV1beta1LeaseSpec }, name::Symbol, val)
end
