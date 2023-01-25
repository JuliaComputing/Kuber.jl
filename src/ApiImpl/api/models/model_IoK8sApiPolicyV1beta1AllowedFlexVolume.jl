# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.policy.v1beta1.AllowedFlexVolume
AllowedFlexVolume represents a single Flexvolume that is allowed to be used.

    IoK8sApiPolicyV1beta1AllowedFlexVolume(;
        driver=nothing,
    )

    - driver::String : driver is the name of the Flexvolume driver.
"""
Base.@kwdef mutable struct IoK8sApiPolicyV1beta1AllowedFlexVolume <: OpenAPI.APIModel
    driver::Union{Nothing, String} = nothing

    function IoK8sApiPolicyV1beta1AllowedFlexVolume(driver, )
        OpenAPI.validate_property(IoK8sApiPolicyV1beta1AllowedFlexVolume, Symbol("driver"), driver)
        return new(driver, )
    end
end # type IoK8sApiPolicyV1beta1AllowedFlexVolume

const _property_types_IoK8sApiPolicyV1beta1AllowedFlexVolume = Dict{Symbol,String}(Symbol("driver")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiPolicyV1beta1AllowedFlexVolume }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiPolicyV1beta1AllowedFlexVolume[name]))}

function check_required(o::IoK8sApiPolicyV1beta1AllowedFlexVolume)
    o.driver === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiPolicyV1beta1AllowedFlexVolume }, name::Symbol, val)
end