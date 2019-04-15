# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.



mutable struct IoK8sApiNetworkingV1IPBlock <: SwaggerModel
    cidr::Any # spec type: Union{ Nothing, String } # spec name: cidr
    except::Any # spec type: Union{ Nothing, Vector{String} } # spec name: except

    function IoK8sApiNetworkingV1IPBlock(;cidr=nothing, except=nothing)
        o = new()
        validate_property(IoK8sApiNetworkingV1IPBlock, Symbol("cidr"), cidr)
        setfield!(o, Symbol("cidr"), cidr)
        validate_property(IoK8sApiNetworkingV1IPBlock, Symbol("except"), except)
        setfield!(o, Symbol("except"), except)
        o
    end
end # type IoK8sApiNetworkingV1IPBlock

const _property_map_IoK8sApiNetworkingV1IPBlock = Dict{Symbol,Symbol}(Symbol("cidr")=>Symbol("cidr"), Symbol("except")=>Symbol("except"))
const _property_types_IoK8sApiNetworkingV1IPBlock = Dict{Symbol,String}(Symbol("cidr")=>"String", Symbol("except")=>"Vector{String}")
Base.propertynames(::Type{ IoK8sApiNetworkingV1IPBlock }) = collect(keys(_property_map_IoK8sApiNetworkingV1IPBlock))
Swagger.property_type(::Type{ IoK8sApiNetworkingV1IPBlock }, name::Symbol) = Union{Nothing,eval(Meta.parse(_property_types_IoK8sApiNetworkingV1IPBlock[name]))}
Swagger.field_name(::Type{ IoK8sApiNetworkingV1IPBlock }, property_name::Symbol) =  _property_map_IoK8sApiNetworkingV1IPBlock[property_name]

function check_required(o::IoK8sApiNetworkingV1IPBlock)
    (getproperty(o, Symbol("cidr")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiNetworkingV1IPBlock }, name::Symbol, val)
end
