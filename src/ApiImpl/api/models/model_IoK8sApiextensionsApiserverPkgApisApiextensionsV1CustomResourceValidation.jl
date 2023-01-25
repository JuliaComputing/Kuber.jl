# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.CustomResourceValidation
CustomResourceValidation is a list of validation methods for CustomResources.

    IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation(;
        openAPIV3Schema=nothing,
    )

    - openAPIV3Schema::IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
"""
Base.@kwdef mutable struct IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation <: OpenAPI.APIModel
    openAPIV3Schema = nothing # spec type: Union{ Nothing, IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps }

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation(openAPIV3Schema, )
        OpenAPI.validate_property(IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation, Symbol("openAPIV3Schema"), openAPIV3Schema)
        return new(openAPIV3Schema, )
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation

const _property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation = Dict{Symbol,String}(Symbol("openAPIV3Schema")=>"IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps", )
OpenAPI.property_type(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation[name]))}

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation)
    true
end

function OpenAPI.validate_property(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceValidation }, name::Symbol, val)
end