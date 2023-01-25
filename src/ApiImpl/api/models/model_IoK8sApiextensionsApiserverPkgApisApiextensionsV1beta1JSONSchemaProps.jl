# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSONSchemaProps
JSONSchemaProps is a JSON-Schema following Specification Draft 4 (http://json-schema.org/).

    IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps(;
        var"$ref"=nothing,
        var"$schema"=nothing,
        additionalItems=nothing,
        additionalProperties=nothing,
        allOf=nothing,
        anyOf=nothing,
        default=nothing,
        definitions=nothing,
        dependencies=nothing,
        description=nothing,
        enum=nothing,
        example=nothing,
        exclusiveMaximum=nothing,
        exclusiveMinimum=nothing,
        externalDocs=nothing,
        format=nothing,
        id=nothing,
        items=nothing,
        maxItems=nothing,
        maxLength=nothing,
        maxProperties=nothing,
        maximum=nothing,
        minItems=nothing,
        minLength=nothing,
        minProperties=nothing,
        minimum=nothing,
        multipleOf=nothing,
        not=nothing,
        nullable=nothing,
        oneOf=nothing,
        pattern=nothing,
        patternProperties=nothing,
        properties=nothing,
        required=nothing,
        title=nothing,
        type=nothing,
        uniqueItems=nothing,
        var"x-kubernetes-embedded-resource"=nothing,
        var"x-kubernetes-int-or-string"=nothing,
        var"x-kubernetes-list-map-keys"=nothing,
        var"x-kubernetes-list-type"=nothing,
        var"x-kubernetes-map-type"=nothing,
        var"x-kubernetes-preserve-unknown-fields"=nothing,
    )

    - var"$ref"::String
    - var"$schema"::String
    - additionalItems::Any : JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value. Defaults to true for the boolean property.
    - additionalProperties::Any : JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value. Defaults to true for the boolean property.
    - allOf::Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}
    - anyOf::Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}
    - default::Any : JSON represents any valid JSON value. These types are supported: bool, int64, float64, string, []interface{}, map[string]interface{} and nil.
    - definitions::Dict{String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}
    - dependencies::Dict{String, Any}
    - description::String
    - enum::Vector{Any}
    - example::Any : JSON represents any valid JSON value. These types are supported: bool, int64, float64, string, []interface{}, map[string]interface{} and nil.
    - exclusiveMaximum::Bool
    - exclusiveMinimum::Bool
    - externalDocs::IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1ExternalDocumentation
    - format::String : format is an OpenAPI v3 format string. Unknown formats are ignored. The following formats are validated:  - bsonobjectid: a bson object ID, i.e. a 24 characters hex string - uri: an URI as parsed by Golang net/url.ParseRequestURI - email: an email address as parsed by Golang net/mail.ParseAddress - hostname: a valid representation for an Internet host name, as defined by RFC 1034, section 3.1 [RFC1034]. - ipv4: an IPv4 IP as parsed by Golang net.ParseIP - ipv6: an IPv6 IP as parsed by Golang net.ParseIP - cidr: a CIDR as parsed by Golang net.ParseCIDR - mac: a MAC address as parsed by Golang net.ParseMAC - uuid: an UUID that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?[0-9a-f]{4}-?[0-9a-f]{4}-?[0-9a-f]{12}$ - uuid3: an UUID3 that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?3[0-9a-f]{3}-?[0-9a-f]{4}-?[0-9a-f]{12}$ - uuid4: an UUID4 that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?4[0-9a-f]{3}-?[89ab][0-9a-f]{3}-?[0-9a-f]{12}$ - uuid5: an UUID5 that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?5[0-9a-f]{3}-?[89ab][0-9a-f]{3}-?[0-9a-f]{12}$ - isbn: an ISBN10 or ISBN13 number string like \&quot;0321751043\&quot; or \&quot;978-0321751041\&quot; - isbn10: an ISBN10 number string like \&quot;0321751043\&quot; - isbn13: an ISBN13 number string like \&quot;978-0321751041\&quot; - creditcard: a credit card number defined by the regex ^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\\d{3})\\d{11})$ with any non digit characters mixed in - ssn: a U.S. social security number following the regex ^\\d{3}[- ]?\\d{2}[- ]?\\d{4}$ - hexcolor: an hexadecimal color code like \&quot;#FFFFFF: following the regex ^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$ - rgbcolor: an RGB color code like rgb like \&quot;rgb(255,255,2559\&quot; - byte: base64 encoded binary data - password: any kind of string - date: a date string like \&quot;2006-01-02\&quot; as defined by full-date in RFC3339 - duration: a duration string like \&quot;22 ns\&quot; as parsed by Golang time.ParseDuration or compatible with Scala duration format - datetime: a date time string like \&quot;2014-12-15T19:30:20.000Z\&quot; as defined by date-time in RFC3339.
    - id::String
    - items::Any : JSONSchemaPropsOrArray represents a value that can either be a JSONSchemaProps or an array of JSONSchemaProps. Mainly here for serialization purposes.
    - maxItems::Int64
    - maxLength::Int64
    - maxProperties::Int64
    - maximum::Float64
    - minItems::Int64
    - minLength::Int64
    - minProperties::Int64
    - minimum::Float64
    - multipleOf::Float64
    - not::IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps
    - nullable::Bool
    - oneOf::Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}
    - pattern::String
    - patternProperties::Dict{String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}
    - properties::Dict{String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}
    - required::Vector{String}
    - title::String
    - type::String
    - uniqueItems::Bool
    - var"x-kubernetes-embedded-resource"::Bool : x-kubernetes-embedded-resource defines that the value is an embedded Kubernetes runtime.Object, with TypeMeta and ObjectMeta. The type must be object. It is allowed to further restrict the embedded object. kind, apiVersion and metadata are validated automatically. x-kubernetes-preserve-unknown-fields is allowed to be true, but does not have to be if the object is fully specified (up to kind, apiVersion, metadata).
    - var"x-kubernetes-int-or-string"::Bool : x-kubernetes-int-or-string specifies that this value is either an integer or a string. If this is true, an empty type is allowed and type as child of anyOf is permitted if following one of the following patterns:  1) anyOf:    - type: integer    - type: string 2) allOf:    - anyOf:      - type: integer      - type: string    - ... zero or more
    - var"x-kubernetes-list-map-keys"::Vector{String} : x-kubernetes-list-map-keys annotates an array with the x-kubernetes-list-type &#x60;map&#x60; by specifying the keys used as the index of the map.  This tag MUST only be used on lists that have the \&quot;x-kubernetes-list-type\&quot; extension set to \&quot;map\&quot;. Also, the values specified for this attribute must be a scalar typed field of the child structure (no nesting is supported).
    - var"x-kubernetes-list-type"::String : x-kubernetes-list-type annotates an array to further describe its topology. This extension must only be used on lists and may have 3 possible values:  1) &#x60;atomic&#x60;: the list is treated as a single entity, like a scalar.      Atomic lists will be entirely replaced when updated. This extension      may be used on any type of list (struct, scalar, ...). 2) &#x60;set&#x60;:      Sets are lists that must not have multiple items with the same value. Each      value must be a scalar, an object with x-kubernetes-map-type &#x60;atomic&#x60; or an      array with x-kubernetes-list-type &#x60;atomic&#x60;. 3) &#x60;map&#x60;:      These lists are like maps in that their elements have a non-index key      used to identify them. Order is preserved upon merge. The map tag      must only be used on a list with elements of type object. Defaults to atomic for arrays.
    - var"x-kubernetes-map-type"::String : x-kubernetes-map-type annotates an object to further describe its topology. This extension must only be used when type is object and may have 2 possible values:  1) &#x60;granular&#x60;:      These maps are actual maps (key-value pairs) and each fields are independent      from each other (they can each be manipulated by separate actors). This is      the default behaviour for all maps. 2) &#x60;atomic&#x60;: the list is treated as a single entity, like a scalar.      Atomic maps will be entirely replaced when updated.
    - var"x-kubernetes-preserve-unknown-fields"::Bool : x-kubernetes-preserve-unknown-fields stops the API server decoding step from pruning fields which are not specified in the validation schema. This affects fields recursively, but switches back to normal pruning behaviour if nested properties or additionalProperties are specified in the schema. This can either be true or undefined. False is forbidden.
"""
Base.@kwdef mutable struct IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps <: OpenAPI.APIModel
    var"$ref"::Union{Nothing, String} = nothing
    var"$schema"::Union{Nothing, String} = nothing
    additionalItems::Union{Nothing, Any} = nothing
    additionalProperties::Union{Nothing, Any} = nothing
    allOf::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps} }
    anyOf::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps} }
    default::Union{Nothing, Any} = nothing
    definitions::Union{Nothing, Dict} = nothing # spec type: Union{ Nothing, Dict{String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps} }
    dependencies::Union{Nothing, Dict{String, Any}} = nothing
    description::Union{Nothing, String} = nothing
    enum::Union{Nothing, Vector{Any}} = nothing
    example::Union{Nothing, Any} = nothing
    exclusiveMaximum::Union{Nothing, Bool} = nothing
    exclusiveMinimum::Union{Nothing, Bool} = nothing
    externalDocs = nothing # spec type: Union{ Nothing, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1ExternalDocumentation }
    format::Union{Nothing, String} = nothing
    id::Union{Nothing, String} = nothing
    items::Union{Nothing, Any} = nothing
    maxItems::Union{Nothing, Int64} = nothing
    maxLength::Union{Nothing, Int64} = nothing
    maxProperties::Union{Nothing, Int64} = nothing
    maximum::Union{Nothing, Float64} = nothing
    minItems::Union{Nothing, Int64} = nothing
    minLength::Union{Nothing, Int64} = nothing
    minProperties::Union{Nothing, Int64} = nothing
    minimum::Union{Nothing, Float64} = nothing
    multipleOf::Union{Nothing, Float64} = nothing
    not = nothing # spec type: Union{ Nothing, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps }
    nullable::Union{Nothing, Bool} = nothing
    oneOf::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps} }
    pattern::Union{Nothing, String} = nothing
    patternProperties::Union{Nothing, Dict} = nothing # spec type: Union{ Nothing, Dict{String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps} }
    properties::Union{Nothing, Dict} = nothing # spec type: Union{ Nothing, Dict{String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps} }
    required::Union{Nothing, Vector{String}} = nothing
    title::Union{Nothing, String} = nothing
    type::Union{Nothing, String} = nothing
    uniqueItems::Union{Nothing, Bool} = nothing
    var"x-kubernetes-embedded-resource"::Union{Nothing, Bool} = nothing
    var"x-kubernetes-int-or-string"::Union{Nothing, Bool} = nothing
    var"x-kubernetes-list-map-keys"::Union{Nothing, Vector{String}} = nothing
    var"x-kubernetes-list-type"::Union{Nothing, String} = nothing
    var"x-kubernetes-map-type"::Union{Nothing, String} = nothing
    var"x-kubernetes-preserve-unknown-fields"::Union{Nothing, Bool} = nothing

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps(var"$ref", var"$schema", additionalItems, additionalProperties, allOf, anyOf, default, definitions, dependencies, description, enum, example, exclusiveMaximum, exclusiveMinimum, externalDocs, format, id, items, maxItems, maxLength, maxProperties, maximum, minItems, minLength, minProperties, minimum, multipleOf, not, nullable, oneOf, pattern, patternProperties, properties, required, title, type, uniqueItems, var"x-kubernetes-embedded-resource", var"x-kubernetes-int-or-string", var"x-kubernetes-list-map-keys", var"x-kubernetes-list-type", var"x-kubernetes-map-type", var"x-kubernetes-preserve-unknown-fields", )
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("\$ref"), var"$ref")
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("\$schema"), var"$schema")
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("additionalItems"), additionalItems)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("additionalProperties"), additionalProperties)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("allOf"), allOf)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("anyOf"), anyOf)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("default"), default)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("definitions"), definitions)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("dependencies"), dependencies)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("description"), description)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("enum"), enum)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("example"), example)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("exclusiveMaximum"), exclusiveMaximum)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("exclusiveMinimum"), exclusiveMinimum)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("externalDocs"), externalDocs)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("format"), format)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("id"), id)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("items"), items)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("maxItems"), maxItems)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("maxLength"), maxLength)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("maxProperties"), maxProperties)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("maximum"), maximum)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("minItems"), minItems)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("minLength"), minLength)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("minProperties"), minProperties)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("minimum"), minimum)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("multipleOf"), multipleOf)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("not"), not)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("nullable"), nullable)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("oneOf"), oneOf)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("pattern"), pattern)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("patternProperties"), patternProperties)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("properties"), properties)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("required"), required)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("title"), title)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("type"), type)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("uniqueItems"), uniqueItems)
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("x-kubernetes-embedded-resource"), var"x-kubernetes-embedded-resource")
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("x-kubernetes-int-or-string"), var"x-kubernetes-int-or-string")
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("x-kubernetes-list-map-keys"), var"x-kubernetes-list-map-keys")
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("x-kubernetes-list-type"), var"x-kubernetes-list-type")
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("x-kubernetes-map-type"), var"x-kubernetes-map-type")
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps, Symbol("x-kubernetes-preserve-unknown-fields"), var"x-kubernetes-preserve-unknown-fields")
        return new(var"$ref", var"$schema", additionalItems, additionalProperties, allOf, anyOf, default, definitions, dependencies, description, enum, example, exclusiveMaximum, exclusiveMinimum, externalDocs, format, id, items, maxItems, maxLength, maxProperties, maximum, minItems, minLength, minProperties, minimum, multipleOf, not, nullable, oneOf, pattern, patternProperties, properties, required, title, type, uniqueItems, var"x-kubernetes-embedded-resource", var"x-kubernetes-int-or-string", var"x-kubernetes-list-map-keys", var"x-kubernetes-list-type", var"x-kubernetes-map-type", var"x-kubernetes-preserve-unknown-fields", )
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps

const _property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps = Dict{Symbol,String}(Symbol("\$ref")=>"String", Symbol("\$schema")=>"String", Symbol("additionalItems")=>"Any", Symbol("additionalProperties")=>"Any", Symbol("allOf")=>"Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}", Symbol("anyOf")=>"Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}", Symbol("default")=>"Any", Symbol("definitions")=>"Dict{String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}", Symbol("dependencies")=>"Dict{String, Any}", Symbol("description")=>"String", Symbol("enum")=>"Vector{Any}", Symbol("example")=>"Any", Symbol("exclusiveMaximum")=>"Bool", Symbol("exclusiveMinimum")=>"Bool", Symbol("externalDocs")=>"IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1ExternalDocumentation", Symbol("format")=>"String", Symbol("id")=>"String", Symbol("items")=>"Any", Symbol("maxItems")=>"Int64", Symbol("maxLength")=>"Int64", Symbol("maxProperties")=>"Int64", Symbol("maximum")=>"Float64", Symbol("minItems")=>"Int64", Symbol("minLength")=>"Int64", Symbol("minProperties")=>"Int64", Symbol("minimum")=>"Float64", Symbol("multipleOf")=>"Float64", Symbol("not")=>"IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps", Symbol("nullable")=>"Bool", Symbol("oneOf")=>"Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}", Symbol("pattern")=>"String", Symbol("patternProperties")=>"Dict{String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}", Symbol("properties")=>"Dict{String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps}", Symbol("required")=>"Vector{String}", Symbol("title")=>"String", Symbol("type")=>"String", Symbol("uniqueItems")=>"Bool", Symbol("x-kubernetes-embedded-resource")=>"Bool", Symbol("x-kubernetes-int-or-string")=>"Bool", Symbol("x-kubernetes-list-map-keys")=>"Vector{String}", Symbol("x-kubernetes-list-type")=>"String", Symbol("x-kubernetes-map-type")=>"String", Symbol("x-kubernetes-preserve-unknown-fields")=>"Bool", )
OpenAPI.property_type(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps[name]))}

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps }, name::Symbol, val)
    if name === Symbol("maxItems")
        OpenAPI.validate_param(name, "IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps", :format, val, "int64")
    end
    if name === Symbol("maxLength")
        OpenAPI.validate_param(name, "IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps", :format, val, "int64")
    end
    if name === Symbol("maxProperties")
        OpenAPI.validate_param(name, "IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps", :format, val, "int64")
    end
    if name === Symbol("maximum")
        OpenAPI.validate_param(name, "IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps", :format, val, "double")
    end
    if name === Symbol("minItems")
        OpenAPI.validate_param(name, "IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps", :format, val, "int64")
    end
    if name === Symbol("minLength")
        OpenAPI.validate_param(name, "IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps", :format, val, "int64")
    end
    if name === Symbol("minProperties")
        OpenAPI.validate_param(name, "IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps", :format, val, "int64")
    end
    if name === Symbol("minimum")
        OpenAPI.validate_param(name, "IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps", :format, val, "double")
    end
    if name === Symbol("multipleOf")
        OpenAPI.validate_param(name, "IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1JSONSchemaProps", :format, val, "double")
    end
end