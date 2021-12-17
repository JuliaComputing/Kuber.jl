# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""CSINodeSpec holds information about the specification of all CSI drivers installed on a node

    IoK8sApiStorageV1beta1CSINodeSpec(;
        drivers=nothing,
    )

    - drivers::Vector{IoK8sApiStorageV1beta1CSINodeDriver} : drivers is a list of information of all CSI Drivers existing on a node. If all drivers in the list are uninstalled, this can become empty.
"""
mutable struct IoK8sApiStorageV1beta1CSINodeSpec <: SwaggerModel
    drivers::Any # spec type: Union{ Nothing, Vector{IoK8sApiStorageV1beta1CSINodeDriver} } # spec name: drivers

    function IoK8sApiStorageV1beta1CSINodeSpec(;drivers=nothing)
        o = new()
        validate_property(IoK8sApiStorageV1beta1CSINodeSpec, Symbol("drivers"), drivers)
        setfield!(o, Symbol("drivers"), drivers)
        o
    end
end # type IoK8sApiStorageV1beta1CSINodeSpec

const _property_map_IoK8sApiStorageV1beta1CSINodeSpec = Dict{Symbol,Symbol}(Symbol("drivers")=>Symbol("drivers"))
const _property_types_IoK8sApiStorageV1beta1CSINodeSpec = Dict{Symbol,String}(Symbol("drivers")=>"Vector{IoK8sApiStorageV1beta1CSINodeDriver}")
Base.propertynames(::Type{ IoK8sApiStorageV1beta1CSINodeSpec }) = collect(keys(_property_map_IoK8sApiStorageV1beta1CSINodeSpec))
Swagger.property_type(::Type{ IoK8sApiStorageV1beta1CSINodeSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiStorageV1beta1CSINodeSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiStorageV1beta1CSINodeSpec }, property_name::Symbol) =  _property_map_IoK8sApiStorageV1beta1CSINodeSpec[property_name]

function check_required(o::IoK8sApiStorageV1beta1CSINodeSpec)
    (getproperty(o, Symbol("drivers")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiStorageV1beta1CSINodeSpec }, name::Symbol, val)
end
