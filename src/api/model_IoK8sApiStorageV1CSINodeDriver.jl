# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


mutable struct IoK8sApiStorageV1CSINodeDriver <: SwaggerModel
    allocatable::Any # spec type: Union{ Nothing, IoK8sApiStorageV1VolumeNodeResources } # spec name: allocatable
    name::Any # spec type: Union{ Nothing, String } # spec name: name
    nodeID::Any # spec type: Union{ Nothing, String } # spec name: nodeID
    topologyKeys::Any # spec type: Union{ Nothing, Vector{String} } # spec name: topologyKeys

    function IoK8sApiStorageV1CSINodeDriver(;allocatable=nothing, name=nothing, nodeID=nothing, topologyKeys=nothing)
        o = new()
        validate_property(IoK8sApiStorageV1CSINodeDriver, Symbol("allocatable"), allocatable)
        setfield!(o, Symbol("allocatable"), allocatable)
        validate_property(IoK8sApiStorageV1CSINodeDriver, Symbol("name"), name)
        setfield!(o, Symbol("name"), name)
        validate_property(IoK8sApiStorageV1CSINodeDriver, Symbol("nodeID"), nodeID)
        setfield!(o, Symbol("nodeID"), nodeID)
        validate_property(IoK8sApiStorageV1CSINodeDriver, Symbol("topologyKeys"), topologyKeys)
        setfield!(o, Symbol("topologyKeys"), topologyKeys)
        o
    end
end # type IoK8sApiStorageV1CSINodeDriver

const _property_map_IoK8sApiStorageV1CSINodeDriver = Dict{Symbol,Symbol}(Symbol("allocatable")=>Symbol("allocatable"), Symbol("name")=>Symbol("name"), Symbol("nodeID")=>Symbol("nodeID"), Symbol("topologyKeys")=>Symbol("topologyKeys"))
const _property_types_IoK8sApiStorageV1CSINodeDriver = Dict{Symbol,String}(Symbol("allocatable")=>"IoK8sApiStorageV1VolumeNodeResources", Symbol("name")=>"String", Symbol("nodeID")=>"String", Symbol("topologyKeys")=>"Vector{String}")
Base.propertynames(::Type{ IoK8sApiStorageV1CSINodeDriver }) = collect(keys(_property_map_IoK8sApiStorageV1CSINodeDriver))
Swagger.property_type(::Type{ IoK8sApiStorageV1CSINodeDriver }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiStorageV1CSINodeDriver[name]))}
Swagger.field_name(::Type{ IoK8sApiStorageV1CSINodeDriver }, property_name::Symbol) =  _property_map_IoK8sApiStorageV1CSINodeDriver[property_name]

function check_required(o::IoK8sApiStorageV1CSINodeDriver)
    (getproperty(o, Symbol("name")) === nothing) && (return false)
    (getproperty(o, Symbol("nodeID")) === nothing) && (return false)
    true
end

function validate_property(::Type{ IoK8sApiStorageV1CSINodeDriver }, name::Symbol, val)
end
