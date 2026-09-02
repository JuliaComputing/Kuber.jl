# Generate one Julia client module per patched k8s group document.
#
# Run with the trial branch environment activated:
#     julia --project=. gen/openapi_v1/generate.jl
#
# Strict generation is the default and must stay on: a strict-generation
# failure means the patch list (patch_k8s_spec.jq) needs a new rule — that is
# signal, not noise. `datetime` is left at the generator default `:utc`, which
# matches k8s (all timestamps are UTC) and keeps TimeZones.jl out of the
# dependency set.
#
# Module naming: strip the `apis?_` filename prefix, split on `.`/`_`,
# camel-case each part, prefix `K8s`:
#     api_v1                             -> K8sV1
#     apis_apps_v1                       -> K8sAppsV1
#     apis_rbac.authorization.k8s.io_v1  -> K8sRbacAuthorizationK8sIoV1
#
# Never hand-edit the output: generated code is byte-stable only per pinned
# OpenAPI commit, so regenerate whenever the pin moves.
using OpenAPI, HTTP

const SPECDIR = joinpath(@__DIR__, "specs")
const OUTDIR = joinpath(@__DIR__, "..", "..", "src", "ApiImpl", "generated")

"""
    module_name(specfile) -> String

The generated module name for a patched spec file, per the convention above.
Shared with emit_registry.jl.
"""
function module_name(specfile::AbstractString)
    base = replace(basename(specfile), "_patched.json" => "", ".json" => "")
    base = replace(base, r"^apis?_" => "")
    "K8s" * join(uppercasefirst.(split(replace(base, "." => "_"), "_")))
end

"""
    group_version(specfile) -> String

The k8s `apiVersion` string a spec file describes: `api_v1` -> `"v1"`,
`apis_apps_v1` -> `"apps/v1"`.
"""
function group_version(specfile::AbstractString)
    base = replace(basename(specfile), "_patched.json" => "", ".json" => "")
    startswith(base, "apis_") || return replace(base, "api_" => "")
    parts = split(base[6:end], "_")
    string(join(parts[1:end-1], "_"), "/", parts[end])
end

function patched_specs()
    specs = sort(filter(endswith("_patched.json"), readdir(SPECDIR; join = true)))
    isempty(specs) && error("no patched specs in $SPECDIR — run fetch_specs.sh then patch_k8s_spec.jq")
    return specs
end

"""
    plan_all() -> Dict{String,OpenAPI.ClientPlan}

Plan every patched spec, keyed by module name. `emit_registry.jl` reads the
generated model and operation identifiers off these plans rather than
recomputing them: the planner's naming rules are not a simple transformation
(they normalize non-identifier characters, dodge Base/Core and reserved names,
and disambiguate collisions with a counter), so any reimplementation would
drift silently. Planning is deterministic for a pinned OpenAPI commit, and a
drift between this pass and generation's would surface as an `UndefVarError`
the moment the registry loads.
"""
function plan_all()
    plans = Dict{String,OpenAPI.ClientPlan}()
    for f in patched_specs()
        modname = module_name(f)
        plans[modname] = OpenAPI.plan(f; name = modname)
    end
    return plans
end

function main()
    mkpath(OUTDIR)
    total = 0.0
    for f in patched_specs()
        modname = module_name(f)
        out = joinpath(OUTDIR, "$(modname).jl")
        t = @elapsed OpenAPI.client(f; name = modname, path = out)
        total += t
        @info "generated $modname" group_version = group_version(f) seconds = round(t; digits = 1) MiB =
            round(filesize(out) / 1024^2; digits = 2)
    end
    @info "generated $(length(patched_specs())) modules" seconds = round(total; digits = 1)
end

abspath(PROGRAM_FILE) == (@__FILE__) && main()
