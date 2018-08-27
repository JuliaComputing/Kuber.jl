# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.

type IoK8sApiRbacV1alpha1PolicyRule <: SwaggerModel
    apiGroups::Nullable{ Vector{String} } # apiGroups
    nonResourceURLs::Nullable{ Vector{String} } # nonResourceURLs
    resourceNames::Nullable{ Vector{String} } # resourceNames
    resources::Nullable{ Vector{String} } # resources
    verbs::Nullable{ Vector{String} } # verbs

    function IoK8sApiRbacV1alpha1PolicyRule(;apiGroups=nothing, nonResourceURLs=nothing, resourceNames=nothing, resources=nothing, verbs=nothing)
        o = new()
        set_field!(o, :apiGroups, apiGroups)
        set_field!(o, :nonResourceURLs, nonResourceURLs)
        set_field!(o, :resourceNames, resourceNames)
        set_field!(o, :resources, resources)
        set_field!(o, :verbs, verbs)
        o
    end
end # type IoK8sApiRbacV1alpha1PolicyRule

const _name_map_IoK8sApiRbacV1alpha1PolicyRule = Dict{String,Symbol}(["apiGroups"=>:apiGroups, "nonResourceURLs"=>:nonResourceURLs, "resourceNames"=>:resourceNames, "resources"=>:resources, "verbs"=>:verbs])
const _field_map_IoK8sApiRbacV1alpha1PolicyRule = Dict{Symbol,String}([:apiGroups=>"apiGroups", :nonResourceURLs=>"nonResourceURLs", :resourceNames=>"resourceNames", :resources=>"resources", :verbs=>"verbs"])
Swagger.name_map(::Type{ IoK8sApiRbacV1alpha1PolicyRule }) = _name_map_IoK8sApiRbacV1alpha1PolicyRule
Swagger.field_map(::Type{ IoK8sApiRbacV1alpha1PolicyRule }) = _field_map_IoK8sApiRbacV1alpha1PolicyRule

function check_required(o::IoK8sApiRbacV1alpha1PolicyRule)
    isnull(o.verbs) && (return false)
    true
end

function validate_field(o::IoK8sApiRbacV1alpha1PolicyRule, name::Symbol, val)
end