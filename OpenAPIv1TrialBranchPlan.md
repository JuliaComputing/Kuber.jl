# Kuber.jl on OpenAPI.jl 1.0 — trial branch plan and instructions

**Status: implementation plan, written 2026-08-13.** Companion to
[`OpenAPIv1RewriteNotes.md`](OpenAPIv1RewriteNotes.md) (the evaluation findings)
and [`gen/openapi_v1_prototype/`](gen/openapi_v1_prototype/) (runnable
prototypes every design decision below was verified against). This document is
the step-by-step guide for building a **trial branch** of Kuber.jl fully
generated with the new OpenAPI.jl generator, before OpenAPI PR 103 is merged.

## 0. Readiness verdict

**Yes — everything the trial needs is verified working at PR head `1ff9ba8`.**
All issues raised across four evaluation rounds are fixed upstream and verified
live; all 27 k8s group documents generate in strict mode and decode live
cluster payloads; watch, tolerant decode, second-stage typed decode, retries
semantics, and the patch pipeline are all proven. The remaining risk is churn:
the PR is unmerged, generated modules import `OpenAPI.Runtime` internals, and a
future head can change generated-code shape (it did once, at `ae201a7`). That
is why this is a trial branch pinned to a commit, not a release.

### Decisions locked in for the trial

| Decision | Choice | Why |
| --- | --- | --- |
| OpenAPI.jl version | pin to `quinnj/OpenAPI.jl` branch `codex/production-rewrite`, commit `1ff9ba8dacf5857f0e712d26cc16e6a67bbdc46a` (package version 1.0.0, same UUID `d5e62ea6-...`) | accept-scoped stream codecs land here; everything verified at this head |
| Julia / HTTP / JSON | Julia ≥ 1.11, HTTP.jl 2.x, JSON.jl ≥ 1.7 | hard requirements of the new OpenAPI; user-approved |
| Datetimes | `datetime = :utc` (the generator default — pass nothing) | k8s timestamps are UTC; drops the TimeZones dep; trim-friendlier |
| Spec patching | **middle path**: nullable rules only (Time, MicroTime, all arrays); **no** `/watch/`-path rewriting | keeps strict validation on buffered calls; watch goes through non-deprecated list ops |
| Watch mechanism | `list(...; watch=true)` + accept-scoped `codec!` + second-stage typed decode | verified live 11/11; avoids deprecated `/watch/` paths |
| k8s minor for trial | one: whatever the reference/test cluster serves (k3s v1.35 during evaluation) | multi-minor bake matrix is a post-trial concern; the pipeline already supports it |
| Spec source | upstream `kubernetes/kubernetes` release tag (`api/openapi-spec/v3/`), not a local cluster | authoritative and reproducible; tag recorded in `SPECS_ORIGIN` (§2.1) |
| Generated code | pristine + patched specs **and** generated modules all checked into the branch (like today's `src/ApiImpl/api`) | reproducible CI, auditable fetch→patch→generate chain, no generation at install time |

### Explicitly out of trial scope (defer)

- Multi-minor spec matrix and connect-time minor switching (design is in the
  notes §6; the trial hard-codes one minor).
- The JuliaHub custom-metrics API (`:MetricValue`,
  `list_namespaced_custom_metrics`) — the models were hand-spliced into the old
  swagger (`gen/spec/kuber.json`, `io.k8s.api.custom.metrics.v1beta1.*`); the
  new pipeline needs an OpenAPI v3 document for
  `custom.metrics.k8s.io/v1beta1`, captured from a JuliaHub cluster or
  hand-written. Stub the two exported functions to throw a clear "not in
  trial" error.
- CRD groups beyond what the test cluster serves (the pipeline handles them —
  `helm.cattle.io` / `k3s.cattle.io` generated and passed live — but the JuliaHub
  CRD set needs its docs captured from a JuliaHub reference cluster).
- Downstream-consumer compat shims. One behavioral change to socialize early:
  **fields the old client returned as `nothing` when absent are now `ABSENT`**;
  `nothing` now specifically means explicit JSON `null` (see §5.6).

---

## 1. Branch and project setup

```sh
cd ~/.julia/dev/Kuber
git checkout -b openapi-v1-trial
```

Replace `Project.toml` deps/compat (keep name/uuid/authors; bump version to
`0.8.0-dev` or similar so it's obviously the trial line):

```toml
[deps]
Dates = "ade2ca70-3891-5945-98fb-dc099432e06a"
HTTP = "cd3eb016-35fb-5094-929b-558a96fad6f3"
JSON = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
OpenAPI = "d5e62ea6-ddf3-4d43-8e4c-ad5e6c8bfd7d"

[sources]
OpenAPI = {url = "https://github.com/quinnj/OpenAPI.jl", rev = "1ff9ba8dacf5857f0e712d26cc16e6a67bbdc46a"}

[compat]
HTTP = "2"
JSON = "1.7"
OpenAPI = "1"
julia = "1.11"
```

Notes:

- **Dropped deps**: `Downloads` (no libcurl backend exists anymore),
  `TimeZones` (`:utc` decision), `Random` (audit first — it is not used by
  `helpers.jl`/`simpleapi.jl`; it may only be a leftover of the old generated
  code, which is being deleted anyway).
- `HTTP` becomes a **direct** dep: it activates OpenAPI's HTTP extension
  (without it there is no transport), and §4.2's discovery calls use it
  directly.
- `[sources]` requires Julia ≥ 1.11 Pkg — fine, that's the floor anyway. When
  the PR merges and tags, delete the `[sources]` block and set compat to the
  tag; **regenerate all modules at that point** (generated output is only
  guaranteed byte-stable within the pinned commit — it changed shape once
  already at `ae201a7`).
- CI: the trial branch's CI matrix should drop Julia < 1.11.

---

## 2. Generation pipeline (`gen/openapi_v1/`)

Create `gen/openapi_v1/` with the pipeline below. Start from the prototype
files — `gen/openapi_v1_prototype/patch_k8s_spec.jq` is the exact patch to use
**minus its `/watch/` reduce clause** (middle path: delete the final
`reduce (.paths | keys[] ...)` stanza, keep the three nullable rules).

### 2.1 Fetch specs (one-time per cluster minor, checked in)

**Do not reuse anything in the legacy `gen/spec/` folder.** Those files are
OpenAPI v2 / Swagger 2.0 (`swagger.json`, `kuber.json`, …), which the new
generator does not accept at all (it reads OAS 3.0/3.1/3.2 only), plus one
k8s-1.24-era consolidated v3 file — both format and vintage are wrong.

**Source of truth: the upstream `kubernetes/kubernetes` release tag** (decided
— more authoritative than any local cluster, decoupled from cluster quirks,
and the same mechanism the post-trial multi-minor matrix will use, see notes
§6). One file per group lives under `api/openapi-spec/v3/` at each tag, named
`apis__<group>__<version>_openapi.json` (core is `api__v1_openapi.json`);
rename to the pipeline's `apis_<group>_<version>.json` convention when
downloading. Fetch script — check it in as `gen/openapi_v1/fetch_specs.sh`:

```sh
#!/usr/bin/env bash
# Fetch pristine k8s OpenAPI v3 group documents from the upstream release tag.
set -euo pipefail
K8S_TAG="${1:?usage: fetch_specs.sh <k8s release tag, e.g. v1.35.0>}"
BASE="https://raw.githubusercontent.com/kubernetes/kubernetes/${K8S_TAG}/api/openapi-spec/v3"
DEST="$(dirname "$0")/specs"
mkdir -p "$DEST"

# core, then the trial's group set (§ below); extend this list to add groups
GROUPS="
api__v1
apis__apps__v1
apis__batch__v1
apis__autoscaling__v1
apis__autoscaling__v2
apis__rbac.authorization.k8s.io__v1
apis__networking.k8s.io__v1
apis__storage.k8s.io__v1
apis__policy__v1
apis__events.k8s.io__v1
apis__scheduling.k8s.io__v1
apis__coordination.k8s.io__v1
apis__certificates.k8s.io__v1
apis__discovery.k8s.io__v1
apis__node.k8s.io__v1
apis__apiextensions.k8s.io__v1
apis__apiregistration.k8s.io__v1
"

for g in $GROUPS; do
    out="$DEST/$(echo "$g" | sed 's/__/_/g').json"
    echo "fetching $g -> $out"
    curl -fsSL -o "$out" "$BASE/${g}_openapi.json"
done

# record provenance next to the specs
{
    echo "source: https://github.com/kubernetes/kubernetes tag ${K8S_TAG}"
    echo "path:   api/openapi-spec/v3/"
    echo "fetched: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "files:"
    (cd "$DEST" && sha256sum *.json | grep -v _patched)
} > "$DEST/SPECS_ORIGIN"
```

**Check in everything**: the fetch script, the pristine specs, the patched
specs (§2.2 output), `SPECS_ORIGIN`, and the generated modules (§2.3 output).
Together they make the generated layer fully reproducible and auditable — a
reviewer can verify `fetch → patch → generate` reproduces the tree exactly.
Pick the tag to match the k8s minor the trial targets (evaluation used a
v1.35 cluster, so `v1.35.0` or the latest v1.35.x patch tag is the natural
choice; patch releases don't change the API surface within a minor).

Two things the upstream tag specs deliberately do **not** contain, both
already out of trial scope (§0): CRD-backed groups (JuliaHub CRDs, captured
later from a reference cluster's `/openapi/v3/apis/<group>/<version>` when
that work happens) and aggregated APIs like `metrics.k8s.io` (served by
metrics-server, not the apiserver — same capture route if ever needed).

The group list baked into `fetch_specs.sh` above is the minimum set for the
existing test suite; generating a subset keeps the checked-in module size down
(~30 MiB for all 27 cluster-served groups, core v1 alone is 6.7 MiB). Adding a
group later is mechanical: append it to the list, rerun fetch → patch →
generate, and re-emit the registry.

### 2.2 Patch

```sh
for f in gen/openapi_v1/specs/*.json; do
  jq -f gen/openapi_v1/patch_k8s_spec.jq "$f" > "${f%.json}_patched.json"
done
```

The patch (guarded, applies to every document incl. ones missing the schemas):

1. `meta.v1.Time` → `nullable: true` (wire: `lastProbeTime: null`)
2. `meta.v1.MicroTime` → `nullable: true` (wire: `eventTime: null`)
3. every array-typed property → `nullable: true` (Go nil slices marshal as
   `null`; seen live on `CSINodeSpec.drivers`)

### 2.3 Generate modules

Module naming convention (same as the prototype sweep): strip the `apis?_`
prefix, split on `.`/`_`, camel-case, prefix `K8s` — `api_v1` → `K8sV1`,
`apis_apps_v1` → `K8sAppsV1`, `apis_rbac.authorization.k8s.io_v1` →
`K8sRbacAuthorizationK8sIoV1`.

```julia
# gen/openapi_v1/generate.jl — run with the trial branch env activated
using OpenAPI
for f in filter(endswith("_patched.json"), readdir("specs"; join=true))
    base = replace(replace(basename(f), "_patched.json" => ""), r"^apis?_" => "")
    modname = "K8s" * join(uppercasefirst.(split(replace(base, "." => "_"), "_")))
    OpenAPI.client(f; name = modname,
                   path = joinpath("..", "..", "src", "ApiImpl", "generated", "$(modname).jl"))
end
```

Strict mode is the default and **must stay on** (a strict-generation failure
means the patch list needs a new rule — that is signal, not noise). All 27
docs pass at the pinned commit; ~39 s total.

### 2.4 Emit the registry (replaces `api_typemap.jl` + `api_versions.jl`)

Write `gen/openapi_v1/emit_registry.jl` producing
`src/ApiImpl/generated/registry.jl` with three tables. All three are derived
from the **spec JSONs**, not from parsing generated code:

1. **Group-version → module** (replaces `APIVersionMap`):

   ```julia
   const GROUP_MODULES = Dict{String,Module}(
       "v1"      => K8sV1,
       "apps/v1" => K8sAppsV1,
       ...
   )
   ```

   The group-version string for each spec file is recoverable from its
   filename (`api_v1` → `"v1"`, `apis_apps_v1` → `"apps/v1"`).

2. **(kind, apiVersion) → typed model** (replaces `Typedefs` + the
   `kuber_type` payload sniffing). Source of truth: every k8s schema carries
   `x-kubernetes-group-version-kind`. For each patched doc, for each schema
   with that extension, map to the generated type name — the generator's
   naming is deterministic: `io.k8s.api.core.v1.Pod` → `IoK8sApiCoreV1Pod`
   (dot-split, camel-case each part, concatenate). Emit:

   ```julia
   const KIND_TYPES = Dict{Tuple{String,String},Type}(   # (apiVersion, kind)
       ("v1", "Pod")            => K8sV1.IoK8sApiCoreV1Pod,
       ("apps/v1", "Deployment") => K8sAppsV1.IoK8sApiAppsV1Deployment,
       ...
   )
   ```

   Verify the emitted table loads (every referenced type exists) as part of
   generation — a mismatch means the naming assumption broke.

3. **(verb, kind, scope) → operation function** (replaces the
   `list_namespaced_$(snake_case)` string assembly + `eval` lookups in
   `simpleapi.jl`). Source of truth: `operationId`s in the spec — the
   generated function name is `lowercase(operationId)`
   (`listCoreV1NamespacedPod` → `K8sV1.listcorev1namespacedpod`). k8s
   operationIds are fully regular; parse each with
   `x-kubernetes-action` (get/list/watch/create/update/patch/delete/
   deletecollection/connect) plus the path's `{namespace}` presence for scope,
   and the response/body schema's `x-kubernetes-group-version-kind` for the
   kind. Emit:

   ```julia
   const OPS = Dict{Tuple{Symbol,Symbol,Symbol},Function}(
       # (verb, kind, scope)   scope ∈ (:namespaced, :cluster, :allns)
       (:list,   :Pod, :namespaced) => K8sV1.listcorev1namespacedpod,
       (:list,   :Pod, :allns)      => K8sV1.listcorev1podforallnamespaces,
       (:read,   :Pod, :namespaced) => K8sV1.readcorev1namespacedpod,
       (:create, :Pod, :namespaced) => K8sV1.createcorev1namespacedpod,
       ...
   )
   ```

   This is deliberately a build-time table: no `eval`, no `isdefined` probing,
   trim/precompile friendly, and a missing verb/kind is a table lookup miss
   with a clean error instead of a reflective guess.

`src/ApiImpl/ApiImpl.jl` becomes: include every `generated/K8s*.jl`, then
`registry.jl`.

---

## 3. What each old construct becomes

| Today (`0.2.x`) | Trial branch |
| --- | --- |
| `OpenAPI.Clients.Client(uri; get_return_type=kuber_type, ...)` | one `Mod.Client(uri; kwargs...)` **per group module** — a client is bound to its module's compiled `_SPEC`; sharing one across modules fails (verified: "requested node is not a compiled schema location"). Mirrors today's per-API-struct `apictx` pattern |
| `get_return_type=kuber_type` payload sniffing | gone — buffered responses decode to the documented type (specs are patched to be true); watch frames second-stage decode via `KIND_TYPES` |
| `check_api_response(result, http_resp)` on `(result, resp)` tuples | operations return the value or throw `OpenAPI.Runtime.ApiError` (non-2xx). Catch `ApiError` and rewrap as `KuberException` (§4.4) |
| `apimodule(ctx).eval(Symbol("list_namespaced_$(_O_)"))` | `OPS[(:list, O, :namespaced)]` table lookup |
| `Typedefs.CoreV1.Pod` etc. | `KIND_TYPES[("v1", "Pod")]`; keep a deprecation shim only if downstream code uses `Typedefs` directly |
| `kuber_obj(ctx, dict)` / `convert(T, dict)` | `OpenAPI.Runtime._decode(T, dict, false)` with `T = KIND_TYPES[(apiVersion, kind)]` (see §5.5; `_decode` is runtime-internal — pin exactly, and ask upstream for a public `decode` entry point) |
| `OpenAPI.val_format(::Val{Symbol("int-or-string")})` | delete — v3 specs declare `IntOrString` as `oneOf: [integer, string]`, planner maps it natively |
| legacy channel streaming inside generated ops | `stream_to = Channel(n)` kwarg on the same list op + `accept`/codec (§4.5) |
| `Downloads.Response` header handling, `header(::Downloads.Response, ...)` | delete; `with_http_info=true` returns `ApiResponse{T}` with `.headers` when headers are needed |
| `ctx.client.headers["Connection"] = ...`, `httplib` selection | delete both — HTTP.jl 2.x only; pass persistent defaults via `Client(...; headers=..., request_options=...)` |
| `set_timeout` / `get_timeout` / `with_timeout` via `client.timeout[]` | store a `request_options::NamedTuple` on `KuberContext` (e.g. `(readtimeout = N,)`) and pass per call as `request_options`; `with_timeout` becomes a context-local override. Characterize exact HTTP.jl 2.x option names during Phase 2 |
| `@K_str` export | vestigial — it is exported but defined nowhere in `src/` today. Drop the export |

---

## 4. Core rewrite (`src/helpers.jl`)

### 4.1 Context

```julia
mutable struct KuberContext
    server::String
    clients::Dict{Module,OpenAPI.Runtime.Client}   # lazily built per group module
    client_kwargs::NamedTuple                      # credentials/headers/request_options defaults
    apis::Dict{Symbol,Vector{Module}}              # discovered group → available modules (preferred first)
    modelapi::Dict{Symbol,Module}                  # kind → module for the simple symbol API
    namespace::String
    default_retries::Int
    retry_all_apis::Bool
    initialized::Bool
end
```

`client_for(ctx, mod)` = `get!(() -> _new_client(ctx, mod), ctx.clients, mod)`,
where `_new_client` constructs `mod.Client(ctx.server; require_credentials=false,
ctx.client_kwargs...)` **and registers the watch codec** (§4.5). `set_server`
resets `ctx.clients` and re-probes if asked. Keep `KuberWatchContext`,
`KuberEventStream = Channel{Any}`, `set_ns`, `set_retries`, `retries` as they are.

Credentials/TLS: the old path passed client kwargs through to Downloads/HTTP.
The new `Client` takes `headers=`, `request_options=` (HTTP.jl kwargs — this is
where `sslconfig`/cert options go), and `credential!`/`authorization!` for spec
security schemes. For the trial (kubectl proxy / in-cluster bearer token), a
`headers = ["Authorization" => "Bearer ..."]` default plus `request_options`
TLS passthrough covers it; verify against a token-auth cluster in Phase 4.

### 4.2 Discovery (`set_api_versions!`)

Keep the same discovery *semantics* (probe server, tolerate gaps, `override`
kwarg) but implement the two probes with plain HTTP.jl + JSON — they were the
only reason the old `ApisApi`/`CoreApi` generated wrappers were needed:

- `GET {server}/api` → core versions (expect `{"versions": ["v1"]}`)
- `GET {server}/apis` → groups with `preferredVersion` and `versions`

For each discovered `group/version`, look up `GROUP_MODULES`; skip (with
`verbose` info) when we don't ship that group — same tolerance as today. Fill
`ctx.apis` (preferred version first, then other supported versions — preserving
today's `KApi` list ordering) and build `ctx.modelapi` by iterating
`KIND_TYPES` per module (replaces `build_model_api_map`'s `names()` scan).
Keep the `:PodLog => modelapi[:Pod]` special-case (§5.4).

### 4.3 Retries (`k8s_retry`)

Keep the `ExponentialBackOff` wrapper and `max_tries`/`tps` interface, replace
the retry condition:

- `ApiError` with `.status in [0, 500, 501, 502, 503, 504]` → retryable
  (confirm the field name on `OpenAPI.Runtime.ApiError` — it carries the
  response; look at `src/runtime.jl` at the pin).
- Transport-level failures now surface as HTTP.jl 2.x exceptions
  (`HTTP.RequestError`/connect errors) instead of
  `is_request_interrupted` — that helper no longer exists. Retry those when
  the watch stream (if any) is still open, exactly mirroring today's
  `stream === nothing || isopen(stream)` guard so an intentional
  `close(stream)` still terminates instead of retrying (this is the semantics
  of Kuber PRs 67/68 — preserve them).
- **New case the old code never saw**: a mid-stream truncated item closes the
  watch channel with `OpenAPI.Runtime.DecodeError` instead of ending silently.
  Treat close-with-`DecodeError` on a still-wanted watch as retryable
  (re-establish from last seen `resourceVersion`).

Phase-2 first task: write a tiny characterization script (kill a watch's
connection server-side, close the channel client-side, hit a 503) and pin the
exact exception types observed — then encode them in `k8s_retry_cond`.

### 4.4 Exceptions

Keep `KuberException` shape (code, message, status, response) for downstream
compat. Build it from `ApiError`: status code and raw body are on the error;
when the body parses as a k8s `Status` object, use its `message`/`code`
overrides exactly as today.

### 4.5 Watch plumbing

At client construction (every per-module client — cheap and uniform):

```julia
OpenAPI.Runtime.codec!(client, "application/json;stream=watch";
    decode = (bytes, _) -> JSON.parse(String(bytes)))
```

The codec only fires for calls that pass
`accept = "application/json;stream=watch"` (verified at the pin; buffered
calls on the same client are untouched). The internal watch call is then:

```julia
raw = Channel{Any}(buffersize)
OPS[(:list, O, scope)](args...; client, watch = true,
    resourceversion = rv, accept = "application/json;stream=watch",
    stream_to = raw, kwargs...)
```

Each item on `raw` is a JSON object dict `{"type": ..., "object": ...}`.
Second-stage decode into the public event (see §5.3) via `KIND_TYPES` on
`object.kind`/`object.apiVersion` — this is the direct replacement of
`kuber_type`'s WatchEvent branch, verified live including the typed decode.

---

## 5. Simple API rewrite (`src/simpleapi.jl`)

### 5.1 Verb functions

`get`/`list`/`put!`/`update!`/`delete!` keep their exact signatures and
semantics; internals change to: resolve module (`apiversion` kwarg via
`GROUP_MODULES`, else `ctx.modelapi[O]`), resolve op via `OPS`, call with
`client = client_for(ctx, mod)` and value-or-throw handling wrapped in
`k8s_retry`. Scope resolution keeps today's fallback chain (namespaced →
cluster → all-namespaces), now as table probes instead of `isdefined` probes.
Verb mapping from today's name assembly: `read_*` → `:get`(read),
`list_*` → `:list`, `create_*` → `:create`, `patch_*` → `:patch`,
`delete_*` → `:delete`, `watch_*` → handled by §4.5 (no dedicated watch ops in
the middle path — `watch=true` on the list/read op).

Casing note: **all generated kwargs are lowercase** — `labelselector`,
`resourceversion`, `fieldselector` (not `label_selector`). Keep accepting the
old snake_case kwargs at the simpleapi boundary and translate, so downstream
call sites don't churn.

### 5.2 `update!` (patch)

The generated patch ops document k8s's patch media types. Pass the patch type
as the request content type:

```julia
OPS[(:patch, O, scope)](name, ns, patchobj; client,
    content_type = patch_type)   # e.g. "application/merge-patch+json"
```

Verify during implementation that the body encoder honors `content_type` for
the `+json` variants (it should — they are JSON-family media types; if not,
this is a small upstream ask).

### 5.3 Watch API and events

Keep the two public entry points (`watch(fn, ctx; ...)` and
`watch(ctx, O, outstream, ...)`) and `KuberEventStream`. Preserve today's
event protocol on the stream:

1. first item: the initial typed List result (e.g. `PodList`) — unchanged;
2. subsequent items: watch events. Emit a Kuber-owned struct instead of the
   legacy generated `WatchEvent`:

   ```julia
   struct KuberEvent
       type::String                 # ADDED / MODIFIED / DELETED / BOOKMARK / ERROR
       object::Any                  # typed model via KIND_TYPES, or raw dict if kind unknown
   end
   ```

   (`event.type` keeps working at call sites — nicer than the generated
   `type_` rename. `kuber_obj(ctx, event.object)` call sites in tests become
   unnecessary but keep `kuber_obj` accepting dicts for compat.)

Re-watch loop: on retryable stream death (§4.3), re-issue with
`resourceversion` from the last event's `object.metadata.resourceversion`;
surface `410 Gone` (`ApiError`) as a fresh list+watch, matching k8s watch
protocol. Today's code only resumes from the initial list RV — this is a
strict improvement; keep it small.

### 5.4 `get_logs` / PodLog

`get(ctx, :PodLog, name)` maps to `K8sV1.readcorev1namespacedpodlog(name, ns;
client, kwargs...)` returning `String` (text/plain — the new runtime decodes
text media to strings). Wire `:PodLog` as a special row in `OPS`
(`(:get, :PodLog, :namespaced) => readcorev1namespacedpodlog`) so the generic
path just works. Kwargs are lowercase now: `sinceseconds`, `taillines`, etc. —
translate at the boundary per §5.1.

### 5.5 `kuber_obj` and conversions

```julia
kuber_obj(ctx, j::AbstractDict) = OpenAPI.Runtime._decode(
    KIND_TYPES[(get(j, "apiVersion", "v1"), j["kind"])],
    j, false)
kuber_obj(ctx, s::String) = kuber_obj(ctx, JSON.parse(s))
```

Delete the `convert(::Type{T}, ::String/Dict)` and
`convert(Dict, model)` piracy; for model→dict (used by `delete!`/`update!` on
model args), read fields directly (`v.kind`, `v.metadata.name`) — the new
models are plain typed structs, no JSON round-trip needed. Delete
`_parse_json`'s `dicttype` workaround (nothing depends on `Dict{String,Any}`
anymore; JSON.Object is fine everywhere — `_decode` accepts it, verified).

### 5.6 `ABSENT` vs `nothing` — the one user-visible semantic change

Old models: absent field → `nothing`. New models: absent → `ABSENT`
(`OpenAPI.Runtime.Absent`), explicit JSON `null` → `nothing` (the patched
nullable fields make this reachable: `lastProbeTime`, `eventTime`, nil
arrays). Add one helper and use it at every Kuber-internal field access:

```julia
_field(x, default=nothing) = x isa OpenAPI.Runtime.Absent ? default : x
```

and document the change prominently in the trial branch README for downstream
users (grep JuliaHub consumers for `=== nothing` checks on Kuber model fields
when the trial graduates).

Also inherited: generated field names are lowercase with `_` suffix on
collisions — `metadata.resourceversion`, `event.type_` (avoided at the
simpleapi surface by §5.3, but raw model access sees them).

---

## 6. Testing the trial branch

### Phase-gate checks (run after each phase)

1. **Generation** (Phase 1): pipeline runs clean; registry loads; every
   `KIND_TYPES`/`OPS` entry resolves. `julia --project -e 'using Kuber'`
   precompiles.
2. **Offline unit** (Phase 2–3): registry lookups; `kuber_obj` round-trips a
   pod JSON; `KuberException` from a synthetic `ApiError`; kwarg translation.
   No cluster needed.
3. **Live integration** (Phase 4): adapt `test/runtests.jl` — it is already
   a good end-to-end suite (component status, namespace listing, versioned
   model creation, job create/delete, watch events, watch-processor-failure
   propagation, timeouts). Expected diffs: `Typedefs.CoreV1.WatchEvent` →
   `Kuber.KuberEvent`; `event.object` already typed; timeout tests rewritten
   against `request_options`. Run against k3s + `kubectl proxy` like the
   prototype did.
4. **Prototype cross-checks** (already written, run as-is against the branch's
   pinned OpenAPI): `gen/openapi_v1_prototype/k8spristine_v3.jl` (accept-codec
   watch) and `smoke_groups.jl` (all-groups strict lists) — these validate the
   pinned OpenAPI commit independently of Kuber code, useful to bisect "is it
   Kuber or upstream" during bring-up.
5. **`test/watch_latency.jl`**: re-verify small-chunk incremental delivery
   through the Kuber watch wrapper (upstream semantics verified at 0.0 s
   first-item warm; this checks Kuber didn't add buffering on top).

### Acceptance criteria for the trial

- [ ] `using Kuber` on Julia 1.11+ with only Dates/HTTP/JSON/OpenAPI deps
- [ ] existing `runtests.jl` scenarios green against a live cluster (with the
      documented expected diffs)
- [ ] watch: events flow, `close` stops cleanly, processor death kills the
      watch (Kuber #67 semantics), interrupted watch retries (#68 semantics),
      truncated-stream retry works
- [ ] strict validation on for all buffered calls (no
      `validate_responses=false` anywhere in the trial — the nullable patches
      should make strict work; if a new spec lie appears, that's a new patch
      rule, not a validation opt-out)
- [ ] `put!`/`update!`/`delete!` round-trip a Job and a Deployment
- [ ] `get_logs` returns pod logs
- [ ] precompile + load time measured and recorded (baseline: 27 modules ≈
      29 s uncompiled; expect package precompilation to absorb it — record
      actual TTFX for `list(ctx, :Pod)`)

---

## 7. Suggested implementation order

| Phase | Work | Estimate |
| --- | --- | --- |
| 1 | branch + Project.toml + generation pipeline + registry emission | 0.5–1 day (pipeline exists as prototype; registry emitter is the new work) |
| 2 | helpers.jl rewrite: context, clients, discovery, retry characterization, exceptions | 1–1.5 days |
| 3 | simpleapi.jl rewrite: verbs, watch, logs, kuber_obj | 1–1.5 days |
| 4 | test adaptation + live runs + fixes | 1 day |
| — | total | ~4–5 days of focused work |

## 8. Known traps (all hit during evaluation — don't rediscover them)

1. **One client per module.** `Runtime.Client` is bound to the module's
   compiled `_SPEC`; cross-module reuse errors out.
2. **Name collisions in generated code**: `type` → `type_`, `continue` →
   `continue_`; all identifiers lowercase (`photourls`, `resourceversion`).
3. **`ApiError` on any non-2xx** — code that pattern-matched
   `(result, response)` tuples must move to try/catch.
4. **Watch channel closes with an error** on truncated streams (deliberate
   upstream change vs legacy silent EOF) — consumer loops must handle
   `take!`/iteration throwing.
5. **The `accept` kwarg is what scopes the watch codec** — forget it and
   frames decode against the List schema and fail; the codec alone does
   nothing against a real apiserver (it replies bare `application/json`).
6. **`_decode` needs the tolerant flag `false` explicitly** in second-stage
   decode calls; and index open-struct payloads via `.additional_properties`
   on `RawExtension`-typed fields.
7. **Byte-stability of generated code holds per-commit only.** Regenerate
   everything whenever the OpenAPI pin moves; never hand-edit generated files.
8. **Watch-path ops don't exist in the middle path** (no `/watch/` patch), so
   nothing in Kuber may reference `watch*` operationIds; k8s marks them
   deprecated anyway.
9. **`ctx.modelapi` kinds come from `KIND_TYPES`, not `names(module)`** — the
   old `names()` scan pulled in every model including non-top-level ones;
   `x-kubernetes-group-version-kind` gives exactly the addressable kinds.

## 9. Reference material

- [`OpenAPIv1RewriteNotes.md`](OpenAPIv1RewriteNotes.md) — full evaluation
  findings, upstream status, route comparison (§5), architecture (§6).
- [`gen/openapi_v1_prototype/`](gen/openapi_v1_prototype/) — runnable: patch
  script, live bake test (8/8), pristine + accept-codec test (11/11),
  all-groups sweep (74/74 strict live ops).
- Evaluation artifact (shareable summary):
  https://claude.ai/code/artifact/ca41c458-051a-433c-a274-0b4bc1e213a3
- Upstream PR: https://github.com/JuliaComputing/OpenAPI.jl/pull/103 — README
  on the branch documents `Client` kwargs, `codec!`, `credential!`,
  `stream_to`, `with_http_info`, `request_options`.
- Pinned OpenAPI source of truth for runtime internals:
  `src/runtime.jl` at `1ff9ba8` (`ApiError`, `Absent`, `_decode`,
  `_stream_codec_media`).
