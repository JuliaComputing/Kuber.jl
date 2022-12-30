# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.CustomResourceColumnDefinition
CustomResourceColumnDefinition specifies a column for server side printing.

    IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition(;
        description=nothing,
        format=nothing,
        jsonPath=nothing,
        name=nothing,
        priority=nothing,
        type=nothing,
    )

    - description::String : description is a human readable description of this column.
    - format::String : format is an optional OpenAPI type definition for this column. The &#39;name&#39; format is applied to the primary identifier column to assist in clients identifying column is the resource name. See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
    - jsonPath::String : jsonPath is a simple JSON path (i.e. with array notation) which is evaluated against each custom resource to produce the value for this column.
    - name::String : name is a human readable name for the column.
    - priority::Int64 : priority is an integer defining the relative importance of this column compared to others. Lower numbers are considered higher priority. Columns that may be omitted in limited space scenarios should be given a priority greater than 0.
    - type::String : type is an OpenAPI type definition for this column. See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types for details.
"""
Base.@kwdef mutable struct IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition <: OpenAPI.APIModel
    description::Union{Nothing, String} = nothing
    format::Union{Nothing, String} = nothing
    jsonPath::Union{Nothing, String} = nothing
    name::Union{Nothing, String} = nothing
    priority::Union{Nothing, Int64} = nothing
    type::Union{Nothing, String} = nothing

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition(description, format, jsonPath, name, priority, type, )
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition, Symbol("description"), description)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition, Symbol("format"), format)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition, Symbol("jsonPath"), jsonPath)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition, Symbol("name"), name)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition, Symbol("priority"), priority)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition, Symbol("type"), type)
        return new(description, format, jsonPath, name, priority, type, )
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition

const _property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition = Dict{Symbol,String}(Symbol("description")=>"String", Symbol("format")=>"String", Symbol("jsonPath")=>"String", Symbol("name")=>"String", Symbol("priority")=>"Int64", Symbol("type")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition[name]))}

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition)
    o.jsonPath === nothing && (return false)
    o.name === nothing && (return false)
    o.type === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition }, name::Symbol, val)
    if name === Symbol("priority")
        OpenAPI.validate_param(name, "IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition", :format, val, "int32")
    end
end
