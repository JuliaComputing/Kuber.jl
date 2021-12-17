# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


@doc raw"""APIServiceStatus contains derived information about an API server

    IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus(;
        conditions=nothing,
    )

    - conditions::Vector{IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition} : Current service state of apiService.
"""
mutable struct IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus <: SwaggerModel
    conditions::Any # spec type: Union{ Nothing, Vector{IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition} } # spec name: conditions

    function IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus(;conditions=nothing)
        o = new()
        validate_property(IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus, Symbol("conditions"), conditions)
        setfield!(o, Symbol("conditions"), conditions)
        o
    end
end # type IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus

const _property_map_IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus = Dict{Symbol,Symbol}(Symbol("conditions")=>Symbol("conditions"))
const _property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus = Dict{Symbol,String}(Symbol("conditions")=>"Vector{IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceCondition}")
Base.propertynames(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus }) = collect(keys(_property_map_IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus))
Swagger.property_type(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus[name]))}
Swagger.field_name(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus }, property_name::Symbol) =  _property_map_IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus[property_name]

function check_required(o::IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus)
    true
end

function validate_property(::Type{ IoK8sKubeAggregatorPkgApisApiregistrationV1beta1APIServiceStatus }, name::Symbol, val)
end
