# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.storage.v1.CSINodeSpec
CSINodeSpec holds information about the specification of all CSI drivers installed on a node

    IoK8sApiStorageV1CSINodeSpec(;
        drivers=nothing,
    )

    - drivers::Vector{IoK8sApiStorageV1CSINodeDriver} : drivers is a list of information of all CSI Drivers existing on a node. If all drivers in the list are uninstalled, this can become empty.
"""
Base.@kwdef mutable struct IoK8sApiStorageV1CSINodeSpec <: OpenAPI.APIModel
    drivers::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiStorageV1CSINodeDriver} }

    function IoK8sApiStorageV1CSINodeSpec(drivers, )
        OpenAPI.validate_property(IoK8sApiStorageV1CSINodeSpec, Symbol("drivers"), drivers)
        return new(drivers, )
    end
end # type IoK8sApiStorageV1CSINodeSpec

const _property_types_IoK8sApiStorageV1CSINodeSpec = Dict{Symbol,String}(Symbol("drivers")=>"Vector{IoK8sApiStorageV1CSINodeDriver}", )
OpenAPI.property_type(::Type{ IoK8sApiStorageV1CSINodeSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiStorageV1CSINodeSpec[name]))}

function check_required(o::IoK8sApiStorageV1CSINodeSpec)
    o.drivers === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiStorageV1CSINodeSpec }, name::Symbol, val)
end
