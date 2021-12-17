# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""describes the attributes of a scale subresource

    IoK8sApiExtensionsV1beta1ScaleSpec(;
        replicas=nothing,
    )

    - replicas::Int32 : desired number of instances for the scaled object.
"""
mutable struct IoK8sApiExtensionsV1beta1ScaleSpec <: SwaggerModel
    replicas::Any # spec type: Union{ Nothing, Int32 } # spec name: replicas

    function IoK8sApiExtensionsV1beta1ScaleSpec(;replicas=nothing)
        o = new()
        validate_property(IoK8sApiExtensionsV1beta1ScaleSpec, Symbol("replicas"), replicas)
        setfield!(o, Symbol("replicas"), replicas)
        o
    end
end # type IoK8sApiExtensionsV1beta1ScaleSpec

const _property_map_IoK8sApiExtensionsV1beta1ScaleSpec = Dict{Symbol,Symbol}(Symbol("replicas")=>Symbol("replicas"))
const _property_types_IoK8sApiExtensionsV1beta1ScaleSpec = Dict{Symbol,String}(Symbol("replicas")=>"Int32")
Base.propertynames(::Type{ IoK8sApiExtensionsV1beta1ScaleSpec }) = collect(keys(_property_map_IoK8sApiExtensionsV1beta1ScaleSpec))
Swagger.property_type(::Type{ IoK8sApiExtensionsV1beta1ScaleSpec }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1ScaleSpec[name]))}
Swagger.field_name(::Type{ IoK8sApiExtensionsV1beta1ScaleSpec }, property_name::Symbol) =  _property_map_IoK8sApiExtensionsV1beta1ScaleSpec[property_name]

function check_required(o::IoK8sApiExtensionsV1beta1ScaleSpec)
    true
end

function validate_property(::Type{ IoK8sApiExtensionsV1beta1ScaleSpec }, name::Symbol, val)
end
