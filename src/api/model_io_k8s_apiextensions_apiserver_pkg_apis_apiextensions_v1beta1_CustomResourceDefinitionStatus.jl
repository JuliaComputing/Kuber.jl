# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.

type IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus <: SwaggerModel
    acceptedNames::Nullable{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionNames } # acceptedNames
    conditions::Nullable{ Vector{IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionCondition} } # conditions

    function IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus(;acceptedNames=nothing, conditions=nothing)
        o = new()
        set_field!(o, :acceptedNames, acceptedNames)
        set_field!(o, :conditions, conditions)
        o
    end
end # type IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus

const _name_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus = Dict{String,Symbol}(["acceptedNames"=>:acceptedNames, "conditions"=>:conditions])
const _field_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus = Dict{Symbol,String}([:acceptedNames=>"acceptedNames", :conditions=>"conditions"])
Swagger.name_map(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus }) = _name_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus
Swagger.field_map(::Type{ IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus }) = _field_map_IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus

function check_required(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus)
    isnull(o.acceptedNames) && (return false)
    isnull(o.conditions) && (return false)
    true
end

function validate_field(o::IoK8sApiextensionsApiserverPkgApisApiextensionsV1beta1CustomResourceDefinitionStatus, name::Symbol, val)
end