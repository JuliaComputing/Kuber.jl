# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.api.extensions.v1beta1.HTTPIngressRuleValue
HTTPIngressRuleValue is a list of http selectors pointing to backends. In the example: http://&lt;host&gt;/&lt;path&gt;?&lt;searchpart&gt; -&gt; backend where where parts of the url correspond to RFC 3986, this resource will be used to match against everything after the last &#39;/&#39; and before the first &#39;?&#39; or &#39;#&#39;.

    IoK8sApiExtensionsV1beta1HTTPIngressRuleValue(;
        paths=nothing,
    )

    - paths::Vector{IoK8sApiExtensionsV1beta1HTTPIngressPath} : A collection of paths that map requests to backends.
"""
Base.@kwdef mutable struct IoK8sApiExtensionsV1beta1HTTPIngressRuleValue <: OpenAPI.APIModel
    paths::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{IoK8sApiExtensionsV1beta1HTTPIngressPath} }

    function IoK8sApiExtensionsV1beta1HTTPIngressRuleValue(paths, )
        OpenAPI.validate_property(IoK8sApiExtensionsV1beta1HTTPIngressRuleValue, Symbol("paths"), paths)
        return new(paths, )
    end
end # type IoK8sApiExtensionsV1beta1HTTPIngressRuleValue

const _property_types_IoK8sApiExtensionsV1beta1HTTPIngressRuleValue = Dict{Symbol,String}(Symbol("paths")=>"Vector{IoK8sApiExtensionsV1beta1HTTPIngressPath}", )
OpenAPI.property_type(::Type{ IoK8sApiExtensionsV1beta1HTTPIngressRuleValue }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiExtensionsV1beta1HTTPIngressRuleValue[name]))}

function check_required(o::IoK8sApiExtensionsV1beta1HTTPIngressRuleValue)
    o.paths === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiExtensionsV1beta1HTTPIngressRuleValue }, name::Symbol, val)
end
