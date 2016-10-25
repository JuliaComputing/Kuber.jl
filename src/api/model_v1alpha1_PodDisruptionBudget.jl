# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.

type V1alpha1PodDisruptionBudget <: SwaggerModel
    metadata::Nullable{ V1ObjectMeta } # metadata
    spec::Nullable{ V1alpha1PodDisruptionBudgetSpec } # spec
    status::Nullable{ V1alpha1PodDisruptionBudgetStatus } # status

    function V1alpha1PodDisruptionBudget(;metadata=nothing, spec=nothing, status=nothing)
        o = new()
        set_field!(o, :metadata, metadata)
        set_field!(o, :spec, spec)
        set_field!(o, :status, status)
        o
    end
end # type V1alpha1PodDisruptionBudget

const _name_map_V1alpha1PodDisruptionBudget = Dict{String,Symbol}(["metadata"=>:metadata, "spec"=>:spec, "status"=>:status])
Swagger.name_map(::Type{ V1alpha1PodDisruptionBudget }) = _name_map_V1alpha1PodDisruptionBudget

function check_required(o::V1alpha1PodDisruptionBudget)
    true
end

function validate_field(o::V1alpha1PodDisruptionBudget, name::Symbol, val)
end