"""
The generated layer: one OpenAPI.jl client module per Kubernetes API group
version, plus the registry tables that map k8s group-versions, kinds and verbs
onto them.

Everything under `generated/` is machine-produced by the pipeline in
`gen/openapi_v1/` (fetch_specs.sh -> patch_k8s_spec.jq -> generate.jl ->
emit_registry.jl) from the checked-in specs. Do not hand-edit any of it —
generated output is byte-stable only for the pinned OpenAPI.jl commit, so a
pin move means a full regeneration.
"""
module ApiImpl

const GENERATED = joinpath(@__DIR__, "generated")

for f in sort(filter(f -> startswith(f, "K8s") && endswith(f, ".jl"), readdir(GENERATED)))
    include(joinpath(GENERATED, f))
end

include(joinpath(GENERATED, "registry.jl"))

end # module
