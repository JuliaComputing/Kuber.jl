# Generation pipeline (OpenAPI.jl 1.0 trial)

Everything in `src/ApiImpl/generated/` is produced here. Never hand-edit that
tree: regenerate instead. Generated output is byte-stable only for the pinned
OpenAPI.jl commit (`[sources]` in `Project.toml`), so **a pin move means
rerunning the whole chain**.

This replaces the old Java `openapi-generator` flow (`gen/generate.sh`,
`gen/detect_apis_and_types.jl`, `gen/spec/`), which produced the 0.2.x-era
`src/ApiImpl/api` tree and no longer applies. The legacy `gen/spec/` documents
are Swagger 2.0 and are not reusable: the new generator reads OAS 3.0/3.1/3.2
only.

## The chain

```sh
# 1. fetch pristine group documents from a kubernetes/kubernetes release tag
./gen/openapi_v1/fetch_specs.sh v1.35.4

# 2. patch them (nullable Time/MicroTime/arrays — see patch_k8s_spec.jq)
for f in gen/openapi_v1/specs/*.json; do
  case "$f" in *_patched.json) continue;; esac
  jq -f gen/openapi_v1/patch_k8s_spec.jq "$f" > "${f%.json}_patched.json"
done

# 3. generate one client module per patched document (~30 s, strict mode)
julia --project gen/openapi_v1/generate.jl

# 4. emit the registry tables (~100 s; plans the documents a second time)
julia --project gen/openapi_v1/emit_registry.jl

# 5. gate: the registry loads and every entry in it resolves
julia --project test/registry.jl
```

Steps 3 and 4 each run the planner over all 17 documents, which is why step 4
costs about as much as step 3 twice over. That is deliberate: the registry
reads generated identifiers off the planner instead of reimplementing its
naming rules, and the two passes are deterministic for a pinned commit. A
drift between them shows up immediately in step 5 as an `UndefVarError`.

## What is checked in, and why

The pristine specs, the patched specs, `SPECS_ORIGIN`, and the generated
modules are all committed. Together they make the generated layer reproducible
and auditable — a reviewer can rerun fetch → patch → generate and get the same
tree — and nothing is generated at install time.

## Adding an API group

Append it to `K8S_GROUPS` in `fetch_specs.sh`, then rerun the chain. The group
set is currently the minimum the test suite needs; generating a subset keeps
the checked-in module size down (~23 MiB for 17 groups, core v1 alone is
6.5 MiB).

Two things upstream release tags deliberately do not carry, both out of trial
scope: CRD-backed groups and aggregated APIs like `metrics.k8s.io` (served by
metrics-server, not the apiserver). Both would be captured from a reference
cluster's `/openapi/v3/apis/<group>/<version>` instead.

## Strict mode stays on

Strict generation and strict response validation are both non-negotiable for
the trial. A strict-generation failure, or a `SchemaValidationError` against a
real cluster, means the k8s document lies about a field and the fix is a new
rule in `patch_k8s_spec.jq` — never `validate_responses=false`.
