# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.autoscaling.v2beta2.MetricTarget
MetricTarget defines the target value, average value, or average utilization of a specific metric

    IoK8sApiAutoscalingV2beta2MetricTarget(;
        averageUtilization=nothing,
        averageValue=nothing,
        type=nothing,
        value=nothing,
    )

    - averageUtilization::Int64 : averageUtilization is the target value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods. Currently only valid for Resource metric source type
    - averageValue::String : Quantity is a fixed-point representation of a number. It provides convenient marshaling/unmarshaling in JSON and YAML, in addition to String() and AsInt64() accessors.  The serialization format is:  &lt;quantity&gt;        ::&#x3D; &lt;signedNumber&gt;&lt;suffix&gt;   (Note that &lt;suffix&gt; may be empty, from the \&quot;\&quot; case in &lt;decimalSI&gt;.) &lt;digit&gt;           ::&#x3D; 0 | 1 | ... | 9 &lt;digits&gt;          ::&#x3D; &lt;digit&gt; | &lt;digit&gt;&lt;digits&gt; &lt;number&gt;          ::&#x3D; &lt;digits&gt; | &lt;digits&gt;.&lt;digits&gt; | &lt;digits&gt;. | .&lt;digits&gt; &lt;sign&gt;            ::&#x3D; \&quot;+\&quot; | \&quot;-\&quot; &lt;signedNumber&gt;    ::&#x3D; &lt;number&gt; | &lt;sign&gt;&lt;number&gt; &lt;suffix&gt;          ::&#x3D; &lt;binarySI&gt; | &lt;decimalExponent&gt; | &lt;decimalSI&gt; &lt;binarySI&gt;        ::&#x3D; Ki | Mi | Gi | Ti | Pi | Ei   (International System of units; See: http://physics.nist.gov/cuu/Units/binary.html) &lt;decimalSI&gt;       ::&#x3D; m | \&quot;\&quot; | k | M | G | T | P | E   (Note that 1024 &#x3D; 1Ki but 1000 &#x3D; 1k; I didn&#39;t choose the capitalization.) &lt;decimalExponent&gt; ::&#x3D; \&quot;e\&quot; &lt;signedNumber&gt; | \&quot;E\&quot; &lt;signedNumber&gt;  No matter which of the three exponent forms is used, no quantity may represent a number greater than 2^63-1 in magnitude, nor may it have more than 3 decimal places. Numbers larger or more precise will be capped or rounded up. (E.g.: 0.1m will rounded up to 1m.) This may be extended in the future if we require larger or smaller quantities.  When a Quantity is parsed from a string, it will remember the type of suffix it had, and will use the same type again when it is serialized.  Before serializing, Quantity will be put in \&quot;canonical form\&quot;. This means that Exponent/suffix will be adjusted up or down (with a corresponding increase or decrease in Mantissa) such that:   a. No precision is lost   b. No fractional digits will be emitted   c. The exponent (or suffix) is as large as possible. The sign will be omitted unless the number is negative.  Examples:   1.5 will be serialized as \&quot;1500m\&quot;   1.5Gi will be serialized as \&quot;1536Mi\&quot;  Note that the quantity will NEVER be internally represented by a floating point number. That is the whole point of this exercise.  Non-canonical values will still parse as long as they are well formed, but will be re-emitted in their canonical form. (So always use canonical form, or don&#39;t diff.)  This format is intended to make it difficult to use these numbers without writing some sort of special handling code in the hopes that that will cause implementors to also use a fixed point implementation.
    - type::String : type represents whether the metric type is Utilization, Value, or AverageValue
    - value::String : Quantity is a fixed-point representation of a number. It provides convenient marshaling/unmarshaling in JSON and YAML, in addition to String() and AsInt64() accessors.  The serialization format is:  &lt;quantity&gt;        ::&#x3D; &lt;signedNumber&gt;&lt;suffix&gt;   (Note that &lt;suffix&gt; may be empty, from the \&quot;\&quot; case in &lt;decimalSI&gt;.) &lt;digit&gt;           ::&#x3D; 0 | 1 | ... | 9 &lt;digits&gt;          ::&#x3D; &lt;digit&gt; | &lt;digit&gt;&lt;digits&gt; &lt;number&gt;          ::&#x3D; &lt;digits&gt; | &lt;digits&gt;.&lt;digits&gt; | &lt;digits&gt;. | .&lt;digits&gt; &lt;sign&gt;            ::&#x3D; \&quot;+\&quot; | \&quot;-\&quot; &lt;signedNumber&gt;    ::&#x3D; &lt;number&gt; | &lt;sign&gt;&lt;number&gt; &lt;suffix&gt;          ::&#x3D; &lt;binarySI&gt; | &lt;decimalExponent&gt; | &lt;decimalSI&gt; &lt;binarySI&gt;        ::&#x3D; Ki | Mi | Gi | Ti | Pi | Ei   (International System of units; See: http://physics.nist.gov/cuu/Units/binary.html) &lt;decimalSI&gt;       ::&#x3D; m | \&quot;\&quot; | k | M | G | T | P | E   (Note that 1024 &#x3D; 1Ki but 1000 &#x3D; 1k; I didn&#39;t choose the capitalization.) &lt;decimalExponent&gt; ::&#x3D; \&quot;e\&quot; &lt;signedNumber&gt; | \&quot;E\&quot; &lt;signedNumber&gt;  No matter which of the three exponent forms is used, no quantity may represent a number greater than 2^63-1 in magnitude, nor may it have more than 3 decimal places. Numbers larger or more precise will be capped or rounded up. (E.g.: 0.1m will rounded up to 1m.) This may be extended in the future if we require larger or smaller quantities.  When a Quantity is parsed from a string, it will remember the type of suffix it had, and will use the same type again when it is serialized.  Before serializing, Quantity will be put in \&quot;canonical form\&quot;. This means that Exponent/suffix will be adjusted up or down (with a corresponding increase or decrease in Mantissa) such that:   a. No precision is lost   b. No fractional digits will be emitted   c. The exponent (or suffix) is as large as possible. The sign will be omitted unless the number is negative.  Examples:   1.5 will be serialized as \&quot;1500m\&quot;   1.5Gi will be serialized as \&quot;1536Mi\&quot;  Note that the quantity will NEVER be internally represented by a floating point number. That is the whole point of this exercise.  Non-canonical values will still parse as long as they are well formed, but will be re-emitted in their canonical form. (So always use canonical form, or don&#39;t diff.)  This format is intended to make it difficult to use these numbers without writing some sort of special handling code in the hopes that that will cause implementors to also use a fixed point implementation.
"""
Base.@kwdef mutable struct IoK8sApiAutoscalingV2beta2MetricTarget <: OpenAPI.APIModel
    averageUtilization::Union{Nothing, Int64} = nothing
    averageValue::Union{Nothing, String} = nothing
    type::Union{Nothing, String} = nothing
    value::Union{Nothing, String} = nothing

    function IoK8sApiAutoscalingV2beta2MetricTarget(averageUtilization, averageValue, type, value, )
        OpenAPI.validate_property(IoK8sApiAutoscalingV2beta2MetricTarget, Symbol("averageUtilization"), averageUtilization)
        OpenAPI.validate_property(IoK8sApiAutoscalingV2beta2MetricTarget, Symbol("averageValue"), averageValue)
        OpenAPI.validate_property(IoK8sApiAutoscalingV2beta2MetricTarget, Symbol("type"), type)
        OpenAPI.validate_property(IoK8sApiAutoscalingV2beta2MetricTarget, Symbol("value"), value)
        return new(averageUtilization, averageValue, type, value, )
    end
end # type IoK8sApiAutoscalingV2beta2MetricTarget

const _property_types_IoK8sApiAutoscalingV2beta2MetricTarget = Dict{Symbol,String}(Symbol("averageUtilization")=>"Int64", Symbol("averageValue")=>"String", Symbol("type")=>"String", Symbol("value")=>"String", )
OpenAPI.property_type(::Type{ IoK8sApiAutoscalingV2beta2MetricTarget }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiAutoscalingV2beta2MetricTarget[name]))}

function check_required(o::IoK8sApiAutoscalingV2beta2MetricTarget)
    o.type === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiAutoscalingV2beta2MetricTarget }, name::Symbol, val)
    if name === Symbol("averageUtilization")
        OpenAPI.validate_param(name, "IoK8sApiAutoscalingV2beta2MetricTarget", :format, val, "int32")
    end
end
