# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.coordination.v1.LeaseSpec
LeaseSpec is a specification of a Lease.

    IoK8sApiCoordinationV1LeaseSpec(;
        acquireTime=nothing,
        holderIdentity=nothing,
        leaseDurationSeconds=nothing,
        leaseTransitions=nothing,
        renewTime=nothing,
    )

    - acquireTime::ZonedDateTime : MicroTime is version of Time with microsecond level precision.
    - holderIdentity::String : holderIdentity contains the identity of the holder of a current lease.
    - leaseDurationSeconds::Int64 : leaseDurationSeconds is a duration that candidates for a lease need to wait to force acquire it. This is measure against time of last observed RenewTime.
    - leaseTransitions::Int64 : leaseTransitions is the number of transitions of a lease between holders.
    - renewTime::ZonedDateTime : MicroTime is version of Time with microsecond level precision.
"""
Base.@kwdef mutable struct IoK8sApiCoordinationV1LeaseSpec <: OpenAPI.APIModel
    acquireTime::Union{Nothing, ZonedDateTime} = nothing
    holderIdentity::Union{Nothing, String} = nothing
    leaseDurationSeconds::Union{Nothing, Int64} = nothing
    leaseTransitions::Union{Nothing, Int64} = nothing
    renewTime::Union{Nothing, ZonedDateTime} = nothing

    function IoK8sApiCoordinationV1LeaseSpec(acquireTime, holderIdentity, leaseDurationSeconds, leaseTransitions, renewTime, )
        OpenAPI.validate_property(IoK8sApiCoordinationV1LeaseSpec, Symbol("acquireTime"), acquireTime)
        OpenAPI.validate_property(IoK8sApiCoordinationV1LeaseSpec, Symbol("holderIdentity"), holderIdentity)
        OpenAPI.validate_property(IoK8sApiCoordinationV1LeaseSpec, Symbol("leaseDurationSeconds"), leaseDurationSeconds)
        OpenAPI.validate_property(IoK8sApiCoordinationV1LeaseSpec, Symbol("leaseTransitions"), leaseTransitions)
        OpenAPI.validate_property(IoK8sApiCoordinationV1LeaseSpec, Symbol("renewTime"), renewTime)
        return new(acquireTime, holderIdentity, leaseDurationSeconds, leaseTransitions, renewTime, )
    end
end # type IoK8sApiCoordinationV1LeaseSpec

const _property_types_IoK8sApiCoordinationV1LeaseSpec = Dict{Symbol,String}(Symbol("acquireTime")=>"ZonedDateTime", Symbol("holderIdentity")=>"String", Symbol("leaseDurationSeconds")=>"Int64", Symbol("leaseTransitions")=>"Int64", Symbol("renewTime")=>"ZonedDateTime", )
OpenAPI.property_type(::Type{ IoK8sApiCoordinationV1LeaseSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiCoordinationV1LeaseSpec[name]))}

function check_required(o::IoK8sApiCoordinationV1LeaseSpec)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiCoordinationV1LeaseSpec }, name::Symbol, val)
    if name === Symbol("acquireTime")
        OpenAPI.validate_param(name, "IoK8sApiCoordinationV1LeaseSpec", :format, val, "date-time")
    end
    if name === Symbol("leaseDurationSeconds")
        OpenAPI.validate_param(name, "IoK8sApiCoordinationV1LeaseSpec", :format, val, "int32")
    end
    if name === Symbol("leaseTransitions")
        OpenAPI.validate_param(name, "IoK8sApiCoordinationV1LeaseSpec", :format, val, "int32")
    end
    if name === Symbol("renewTime")
        OpenAPI.validate_param(name, "IoK8sApiCoordinationV1LeaseSpec", :format, val, "date-time")
    end
end
