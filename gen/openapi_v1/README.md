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
#    …and capture what a release tag cannot carry, from a cluster that serves it
./gen/openapi_v1/fetch_specs.sh --from-cluster metrics.k8s.io/v1beta1

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

Steps 3 and 4 each run the planner over all 18 documents, which is why step 4
costs about as much as step 3 twice over. That is deliberate: the registry
reads generated identifiers off the planner instead of reimplementing its
naming rules, and the two passes are deterministic for a pinned commit. A
drift between them shows up immediately in step 5 as an `UndefVarError`.

## What is checked in, and why

The pristine specs, the patched specs, `SPECS_ORIGIN`/`SPECS_CAPTURED`, and the
generated modules are all committed. Together they make the generated layer reproducible
and auditable — a reviewer can rerun fetch → patch → generate and get the same
tree — and nothing is generated at install time.

## Adding an API group

Append it to `K8S_GROUPS` in `fetch_specs.sh`, then rerun the chain. The group
set is currently the minimum the test suite needs; generating a subset keeps
the checked-in module size down (~18 MiB for 18 groups). That figure was
~24 MiB before patch rule §7 collapsed the `allOf` wrappers, which halved the
generated type count (2252 → 1098).

Two things upstream release tags do not carry, because they are not part of
Kubernetes: aggregated APIs (`metrics.k8s.io` is served by metrics-server,
`custom.metrics.k8s.io` by an adapter) and CRD-backed groups. A live apiserver
serves a real OpenAPI 3.0.0 document for each of them at
`/openapi/v3/apis/<group>/<version>`, so `fetch_specs.sh --from-cluster` is the
second source mode. Its provenance lands in `SPECS_CAPTURED` rather than
`SPECS_ORIGIN` — separate files, so neither mode clobbers the other's record,
and because a captured document is only as reproducible as the cluster it came
from, which is worth stating plainly. `SPECS_CAPTURED` holds **one record per
file**, carrying the group version path, the cluster and its version, the date
and the checksum; a capture replaces the records for the files it writes and
leaves the rest alone, so groups captured months apart from different clusters
each keep their own provenance.

`metrics.k8s.io/v1beta1` is shipped this way. The existing patch rules covered
it unchanged and strict generation passed first time; the only wrinkle was
cosmetic, since the apiserver serves compact JSON and the capture normalizes it
through `jq .` so the two sources diff alike.

**What to capture is a judgement, not a default.** A group belongs in Kuber when
any user of the API could plausibly have it, and when its *schema* does not vary
with the deployment. metrics-server is near-universal and the 0.2.x line shipped
`metrics.k8s.io`, so it qualifies; a group whose schema *is* the deployment —
operator CRDs — belongs in that deployment's own package instead, registered
through `Kuber.register!` (see the top-level README). Kuber ships to people who
do not have those.

**Passing that test is necessary, not sufficient.** `custom.metrics.k8s.io`
passes it — every conformant adapter serves the same schemas out of the shared
`custom-metrics-apiserver` library, and what varies is the metric names, which
are path *values* rather than types — and it is still not shipped, because its
operations carry no `x-kubernetes-group-version-kind` (so `emit_registry.jl`
emits no `OPS` entries for them) and address metrics through a three-variable
path the verb API cannot fill. The document is kept under `reference-captures/`
with the full reasoning in `OpenAPIv1ConsumerGaps.md` C5. The generalizable
lesson: read a captured document's *operations*, not just its schemas, before
adding it to the chain.

## Strict mode stays on

Strict generation and strict response validation are both non-negotiable for
the trial. A strict-generation failure, or a `SchemaValidationError` against a
real cluster, means the k8s document lies about a field and the fix is a new
rule in `patch_k8s_spec.jq` — never `validate_responses=false`.
