# Kuber.jl on OpenAPI.jl 1.0 — evaluation findings and rewrite notes

**Status: reference notes, written 2026-08-10, updated 2026-08-12 for head
`1ff9ba8`.** Findings from evaluating
[JuliaComputing/OpenAPI.jl#103](https://github.com/JuliaComputing/OpenAPI.jl/pull/103)
("Pure-julia OpenAPI internals rewrite"), specifically from the angle of
rewriting Kuber.jl against it. Everything below was verified hands-on: against
the legacy petstore test servers, against synthetic streaming servers, and
against a live k3s v1.35 cluster (via `kubectl proxy`). Companion prototype
files live in [`gen/openapi_v1_prototype/`](gen/openapi_v1_prototype/).

Three evaluation rounds so far: `bd96d53` (first full round), `c2a5244`
(re-verified everything after the tolerant-decode fix, the shared-runtime
refactor, and generation precompilation landed), and `1ff9ba8` (2026-08-12).
Every issue we raised upstream is now **fixed and verified live**, including
the watch-codec media-matching nuance from section 2 — raised on the PR
2026-08-12, fixed the same day in `1ff9ba8` (stream codecs fall back to the
`accept=` media type when the received Content-Type matches no registration).
At `1ff9ba8` the PR's own suite passes 700/700 (27 testsets), and generated
module output is byte-identical to `c2a5244` — the fix is runtime-side only,
no regeneration needed.

---

## 1. What OpenAPI.jl 1.0 is, in one paragraph

The PR replaces the 0.2.x runtime-library model with a generator. There is no
`OpenAPI.Clients` / `OpenAPI.Servers` runtime anymore and no compatibility shims:
`OpenAPI.client(spec; name, path)` reads an OAS 3.0/3.1/3.2 document (JSON or YAML)
and emits a **single Julia module** containing the document's models, typed
operations, and embedded JSON Schemas for boundary validation. Constraints that
matter for Kuber: Julia **1.11+**, HTTP.jl **2.x only**, JSON.jl **1.7+**; the
`openapi-generator` (Java) toolchain and Kuber's current generated `src/ApiImpl`
code stop working entirely. Generated code is precompile- and
JuliaC-`--trim`-friendly (the PR tests this), which suits shipped products.

Since `ae201a7` (BREAKING for generated-code shape), generated modules no longer
carry a pasted ~2,000-line runtime: they **import `OpenAPI.Runtime`** and contain
only their own spec data (`_SPEC`), models, and operations. A 4-operation spec
now emits ~190 lines (was ~2,400); petstore v3 dropped 165→99 KiB. The HTTP
transport itself lives in the package's HTTP extension (`_request` /
`_stream_request` seams), and TimeZones support moved to an
`OpenAPITimeZonesExt` weakdep extension — `datetime = :zoned` clients need
`using TimeZones` in the consumer environment. Consequence for Kuber: baked
modules are **version-coupled to the OpenAPI package** (they import internal
`Runtime._decode`/`_encode` names), so pin OpenAPI's version alongside the baked
matrix and regenerate on upgrades. `c2a5244` precompiles the generation pipeline:
k8s core v1 generation dropped from ~31s to ~7s cold / ~3s warm per document.

As of `bd96d53` the four gaps found in the first evaluation round are fixed and
were re-verified (again at `c2a5244`):

- undocumented 2xx statuses succeed (empty body → `nothing`, payload → raw bytes)
  instead of throwing;
- a missing/blank response Content-Type falls back to decoding by the documented
  media type (`UnexpectedContentType` only remains for genuinely ambiguous cases);
- `datetime = :zoned` generation option maps `date-time` to
  `TimeZones.ZonedDateTime` with offsets preserved on the wire (default `:utc` maps
  to `Dates.DateTime`, offsets normalized to UTC);
- streaming exists: every operation accepts `stream_to = Channel(n)`, returns at
  the response head, and a producer task decodes items onto the channel.

The streaming implementation reproduces the semantics Kuber depends on from the
legacy fixes (OpenAPI.jl PRs 97/98/100/101/102): incremental small-chunk delivery
(verified 0.0s first-item latency after JIT warmup while the server stalls 4s
before the next item), `close(channel)` aborts the transfer (server observes the
connection close in ~0.2–0.4s; a 250ms watcher plus explicit stream teardown),
streaming defaults to HTTP/1.1. One deliberate difference: a **truncated final
JSON document closes the channel with a `DecodeError`** instead of ending
silently. Kuber's watch loop must expect close-with-error, not just clean close —
today `simpleapi.jl` treats stream end leniently; the rewrite should catch the
channel exception and decide retry-vs-surface (`k8s_retry` semantics).

## 2. Upstream status (as of `1ff9ba8`, all raised issues fixed)

Both gaps raised after round one are **fixed** in `fd4558c` and verified live:

1. **`Client(validate_responses=false)` now reaches nested model decoding.**
   Verified against the live cluster with the *pristine* (unpatched) k8s spec: a
   tolerant client decodes real pod lists — all 170 null `lastProbeTime`s on our
   cluster arrive as `nothing` — while a strict client still rejects them, as it
   should. Semantics: unknown response properties ignored, explicit `null` on an
   optional non-nullable property → `nothing`, missing optional → `ABSENT`;
   values that can't fit the Julia type can still raise `DecodeError` (e.g. a
   missing *required* field remains an error even when tolerant).
2. **Streaming consults `codec!` custom decoders per framed item**, with
   parameterized-media registration intended to scope the override
   (`codec!(client, "application/json;stream=watch"; decode=...)`).

   **The media-matching nuance is fixed in `1ff9ba8`** (raised on the PR
   2026-08-12, fixed the same day). Background: codecs are matched against the
   *received* Content-Type, and real k8s always replies plain
   `Content-Type: application/json` — even when you Accept the `stream=watch`
   variant — so at `c2a5244` the parameterized registration never fired against
   a real cluster. Now, when no registration matches the received media type,
   streaming calls fall back to the media type the call requested via the
   `accept=` keyword (`_stream_codec_media` in `src/runtime.jl`). Verified live
   at `1ff9ba8` on the pristine spec, all on **one shared client**:

   ```julia
   K.codec!(client, "application/json;stream=watch";
            decode = (bytes, _) -> JSON.parse(String(bytes)))
   K.listcorev1namespacedconfigmap(ns; client, watch = true,
       accept = "application/json;stream=watch", stream_to = events)
   ```

   The codec fires for exactly the calls that pass that `accept`; buffered
   calls on the same client still decode typed models. The previous
   workaround (plain-`application/json` codec on a dedicated watch-only
   client) still works and remains the fallback for pre-`1ff9ba8` heads.

## 3. How Kuber works today (what the rewrite must replace)

References are to Kuber.jl `main` at `0d91a51`.

- **Generation at build time** (`gen/`): openapi-generator emits one module per
  API group+version from a pinned k8s spec into `src/ApiImpl`. Nothing is fetched
  from the server's OpenAPI endpoints at runtime — "auto discovery" means
  *group/version discovery*, not spec discovery.
- **Runtime discovery** (`src/helpers.jl:510` `set_api_versions!`): calls the k8s
  discovery endpoints through the pre-generated client — `GET /api`
  (`fetch_core_version`, `helpers.jl:452`) and `GET /apis`
  (`get_a_p_i_versions`, `helpers.jl:397`) — then maps each server-reported
  group/version to a shipped module by symbol lookup
  (`getfield(apimodule(ctx), Symbol("Core"*camel(vers)*"Api"))`), tolerating gaps.
  `build_model_api_map` then maps model names → API version for the `get`/`list`
  symbol API.
- **Dynamic return typing** — the load-bearing legacy hook. The client is built
  with `get_return_type = kuber_type` (`helpers.jl:110-112`); `kuber_type`
  (`helpers.jl:227-257`) peeks at each response payload's `kind`/`apiVersion` to
  pick the Julia type, and recognizes watch frames (`type`+`object` keys →
  `WatchEvent`). This is what makes Kuber immune to the k8s spec declaring the
  wrong response schema — the type comes from the payload, not the spec. **The new
  OpenAPI has no equivalent hook**; section 5 explains why it's no longer needed.
- **Watch** (`src/simpleapi.jl:30-51`, `list(...; watch=true)` at `:55`): legacy
  channel streaming, `KuberEventStream`, per-chunk decoding through the
  `get_return_type` hook.
- **`int-or-string`** (`helpers.jl:530-531`): extends legacy
  `OpenAPI.val_format(::Val{Symbol("int-or-string")})`. Not needed in the new
  world: k8s OpenAPI v3 declares `IntOrString` as a proper
  `oneOf: [integer, string]`, which the new planner maps to a real union wrapper
  type. (The `val_format` extension point no longer exists anyway.)
- Other legacy touchpoints that disappear: `(result, http_resp)` tuple returns and
  `check_api_response`; `OpenAPI.Clients.Client(...; client_kwargs...)` and
  `client.headers` mutation; `Downloads.Response` header handling
  (`helpers.jl:237-242`); `kuber_obj`'s `convert(T, ::Dict)` construction.

## 4. Live-cluster findings (k3s v1.35, spec `api/v1` from kubernetes master)

Tested with a client generated from the **pristine** k8s core v1 OpenAPI v3
document (2.1 MB, 113 paths). Generation itself works in **strict mode** — the
PR's `ac0689d` fixed the parameterized-media-key rejection that the k8s documents
otherwise trip (`application/json` vs `application/json;stream=watch` on every
list operation).

1. **Pod lists are undecodable with the pristine spec.** The spec declares
   `io.k8s.apimachinery.pkg.apis.meta.v1.Time` as a non-nullable `date-time`
   string; the live API returns `"lastProbeTime": null` (on our cluster: all 165
   pod conditions had it). Model-level validation throws `SchemaValidationError`,
   and per gap `#1` above no flag avoids it.
2. **Watch frames don't match the declared schema.** k8s declares the *List* type
   for the `application/json;stream=watch` media entry, but the wire carries
   `WatchEvent` objects (`{"type": "ADDED", "object": {...}}`). Per-item streaming
   decode fails.
3. **Content negotiation cannot fix `#2` — verified and important.** k8s replies
   `Content-Type: application/json` regardless of the `Accept` header (confirmed
   with curl, with and without `Accept: application/json;stream=watch`). So
   patching the `;stream=watch` media entry is unreachable: media selection is
   driven by the response Content-Type, which always matches the plain
   `application/json` (List-typed) entry. The deeper truth: a single k8s list
   operation returns two different wire shapes depending on the `?watch=` query
   parameter, which OpenAPI cannot express on one operation. (Since `1ff9ba8`
   the *decode* side of this is solved without touching the spec: an
   accept-scoped `codec!` override, see section 2. The spec statement is still
   wrong; the codec is the sanctioned escape hatch for it.)
4. **Version-skew safety is good.** k8s schemas don't close their objects, so
   generated models park unknown JSON keys in `additional_properties::Dict{String,Any}`
   without error (verified by decoding a payload with an invented future field).
   A baked client for k8s 1.N tolerates *added* fields from a 1.N+2 server; only
   contract *violations* (nulls, shape changes) bite, and GA APIs rarely do that.

## 5. The bake pipeline (prototyped, all green)

Design decision this validates: **runtime spec fetching/generation is out** for a
shipped product (measured: ~31s generation + ~6.5s load for core v1 alone, times
~30 group documents, `eval`'d with no precompilation). Instead: a small matrix of
**baked, spec-patched, pre-generated modules**, switched at connect time.

### Patch step

[`gen/openapi_v1_prototype/patch_k8s_spec.jq`](gen/openapi_v1_prototype/patch_k8s_spec.jq),
applied to each pristine k8s group document before generation:

- `meta.v1.Time` **and `meta.v1.MicroTime`** get `nullable: true` (OAS 3.0
  `nullable` sibling — honored in strict mode because the schema declares
  `type: string`). MicroTime was found by the all-groups sweep: Events carry
  `eventTime: null` (core v1 and events.k8s.io/v1 both);
- **every array-typed property gets `nullable: true`**: Go marshals nil slices
  as JSON `null`, so any array — even spec-required ones — can arrive null.
  Found live: `CSINodeSpec.drivers: null` on storage.k8s.io/v1. The blanket
  rule kills the whole class instead of chasing fields one at a time;
- every dedicated `/watch/` path's `application/json` response schema is rewritten
  to `WatchEvent`. The `/watch/` paths are marked deprecated by k8s but remain
  served, are watch-only (so the patch is semantically honest), and exist in the
  document as separate operations — 70 of them in core v1. **Watching goes through
  these operations**, not through `list(...; watch=true)`, because of finding `#3`.
  If the `/watch/` paths are ever removed upstream, the fallback is splitting each
  list operation into two in the patch step (one per `?watch=` shape).

Expect this patch list to grow as the fleet finds more spec lies; that's the
point of owning the patch step. The 2026-08-12 all-groups sweep (below) found
and fixed two new classes (MicroTime, nil-slice arrays) on the first pass —
the guarded patch (`select(has(...))` on every rule) applies cleanly to
documents that lack the schema or have no `/watch/` paths, including
CRD-backed group documents.

### All-groups sweep (2026-08-12, at `1ff9ba8`)

All **27** OpenAPI v3 group documents served by the k3s v1.35 cluster —
including CRD-backed groups (`helm.cattle.io/v1`, `k3s.cattle.io/v1`), Gateway
API (`gateway.networking.k8s.io/v1` + `v1beta1`), and the aggregated
`metrics.k8s.io/v1beta1` — swept through patch → strict generate → load →
live calls (`smoke_groups.jl`):

- **27/27 patch cleanly** (guarded jq rules; CRD groups have no `/watch/`
  paths, which is fine — CRD watch goes through `list(...; watch=true)` +
  accept-scoped codec);
- **27/27 generate in strict mode**, ~39s and ~30 MiB total (core v1 6.7 MiB /
  11s is the largest; most groups are 0.2–1.8 MiB and take under a second);
- **all 27 modules load together** in one session (~29s uncompiled, includes
  JIT — precompilation absorbs this in a real package);
- **74/74 zero-positional-arg list operations** across all groups decode
  strictly against the live cluster (854 items) — after the MicroTime and
  array-nullable patch rules were added; before them 71/74 (the three
  failures are what motivated the rules);
- typed watch on apps/v1 via the patched `/watch/` path delivers
  `WatchEvent`s with second-stage decode to `IoK8sApiAppsV1Deployment` — 5/5.

### Generation and results

```sh
jq -f patch_k8s_spec.jq api__v1_openapi.json > api__v1_patched.json
julia -e 'using OpenAPI, HTTP; OpenAPI.client("api__v1_patched.json"; name="K8sCoreV1", path="K8sCoreV1.jl")'
```

~7s cold / ~3s warm per group document as of `c2a5244` (was ~31s at `bd96d53`);
core v1 emits a ~6.7 MiB module (dominated by models and embedded schema data —
the shared-runtime refactor shrinks small specs dramatically but k8s-sized ones
only modestly) that loads in ~5–6.5s uncompiled (precompilation absorbs this in
a real package). Against the live cluster, with **full validation on and strict
generation**, the prototype test
([`gen/openapi_v1_prototype/k8sbaked.jl`](gen/openapi_v1_prototype/k8sbaked.jl))
passes 8/8 — verified at both `bd96d53` and `c2a5244`:

- pod list across all namespaces decodes; all 165 null `lastProbeTime`s arrive as
  `nothing`;
- `watchcorev1namespacedconfigmaplist(ns; resourceversion=..., stream_to=events)`
  delivers typed `WatchEvent`s live — an ADDED (configmap created mid-watch via
  kubectl) and a DELETED on the same stream;
- `close(events)` cancels the watch cleanly.

### The `kuber_type` replacement

`WatchEvent.object` is k8s's `RawExtension`, generated as an open struct whose
payload sits in `.additional_properties::Dict{String,Any}`. The second-stage
decode into a typed model is one call, verified working:

```julia
cm = K8sCoreV1._decode(K8sCoreV1.IoK8sApiCoreV1ConfigMap, event.object.additional_properties)
```

So `kuber_type`'s payload sniffing reduces to a per-module lookup table
`(kind, apiVersion) → generated type` feeding `_decode`. With patched specs the
declared schemas are finally *true*, so strict typed decoding does what the hook
used to fake. (Note `_decode` is runtime-internal — since `ae201a7` it lives in
`OpenAPI.Runtime` and generated modules import + extend it; either use it
knowingly or ask upstream for a public `decode(Module, T, json)` entry point.)

### The patch-free route (upgraded at `1ff9ba8`, verified live)

With the accept-scoped codec fix (section 2), the **pristine spec** is now
fully workable end to end — no jq patch step at all — verified 11/11 live at
`1ff9ba8` (`k8spristine_v3.jl`):

- lists/gets: a tolerant client (`validate_responses = false`) decodes real pod
  lists on the pristine spec into typed models (verified: 34 pods, 170 null
  Times → `nothing`); a strict client still rejects them, as the spec says it
  must;
- watch: on the **same shared client**, register
  `codec!(client, "application/json;stream=watch"; decode = (bytes, _) -> JSON.parse(String(bytes)))`
  and pass `accept = "application/json;stream=watch"` on the watch calls. Raw
  JSON event dicts stream out (verified live: ADDED observed, buffered calls on
  the same client unaffected), and the kind→type table second-stage decodes:
  `_decode(K.IoK8sApiCoreV1ConfigMap, ev["object"], false)` — verified.
  This uses the regular list operations (`watch = true`), *not* the deprecated
  `/watch/` paths.

**Choosing between the two routes.** Both are live-verified at `1ff9ba8`:

| | Patched bake (section above) | Patch-free (this section) |
| --- | --- | --- |
| Spec patch step | jq: nullable Time + `/watch/`→WatchEvent | none |
| Response validation | strict, on | off (`validate_responses = false`) |
| Watch operations | dedicated `/watch/` paths (deprecated in k8s, still served) | regular list ops with `watch=true` (not deprecated) |
| Watch item type | typed `WatchEvent` directly | raw JSON dict + second-stage decode |
| Upstream dependency | none beyond `fd4558c` | needs `1ff9ba8`+ |

A middle option worth considering for the rewrite: patch **only**
`meta.v1.Time` nullable (one jq line — keeps strict validation on all buffered
calls) and use the accept-scoped codec for watch. That drops the largest and
most fragile part of the patch (70 `/watch/` path rewrites), stays off
deprecated paths, and keeps validation everywhere except inside watch frames —
where the second-stage `_decode` re-establishes typing anyway.

## 6. Recommended rewrite architecture

1. **Spec matrix, checked in**: per supported k8s minor (e.g. 1.33/1.34/1.35), the
   per-group OpenAPI v3 documents for the groups Kuber actually surfaces (core,
   apps, batch, rbac, networking, …) — vendored from `kubernetes/kubernetes`
   release tags, or captured from reference clusters via
   `kubectl get --raw /openapi/v3/<group>`.
2. **Patch + generate at build time** (replaces today's `gen/` openapi-generator
   flow): one generated module per (group, minor). If image size becomes a
   concern, split per-minor into sub-packages/extensions so deployments carry only
   what they need.
3. **Connect-time switch**: `GET /version` → server minor → nearest baked minor at
   or below it (simpler and cheaper than today's per-group probing). Keep the
   `/apis` probe only for what it uniquely answers: which groups a managed cluster
   has disabled. Skew tolerance (finding `#4`) is what lets "a few" minors cover a
   fleet.
4. **Facade unchanged**: keep the `KuberContext` + symbol-based `get`/`list`/
   `watch`/`put!`/`delete!` user API; the apis dict maps (group, version) →
   generated module, `modelapi` becomes the kind→type tables from section 5.
5. **Watch**: two verified routes — dedicated `/watch/` operations on the
   patched spec (typed `WatchEvent`s directly), or `list(...; watch = true)`
   with an accept-scoped `codec!` + second-stage decode (section 5, needs
   `1ff9ba8`+; avoids deprecated paths and the 70-path patch). Either way,
   `stream_to::Channel` wrapped in the existing `KuberEventStream`/retry
   machinery, updated for close-with-error semantics (section 1). Given the
   preference to minimize spec patching, the accept-scoped codec route with a
   Time-only patch is the recommended starting point.
6. **Rewrite scope**: essentially all of `src/helpers.jl` and the call layer of
   `src/simpleapi.jl` (returns are now value-or-throw `ApiError`; client
   construction, headers, credentials all per generated module). `test/` server
   fixtures based on legacy `OpenAPI.Servers` need regenerating with
   `OpenAPI.server` (the new PR generates HTTP.Router servers with a `register!`
   contract deliberately matching the 0.2.x shape).

## 7. Preconditions before starting the rewrite

- [x] ~~The `validate_responses` model-decode gap~~ — fixed in `fd4558c`,
      verified live at `c2a5244`. Re-confirm it survives into the merged/tagged
      version.
- [x] ~~Raise the watch-codec media-matching nuance (section 2.2) upstream~~ —
      raised on the PR 2026-08-12
      ([comment](https://github.com/JuliaComputing/OpenAPI.jl/pull/103#issuecomment-5264410229)),
      fixed the same day in `1ff9ba8`, verified live 11/11.
- [ ] PR #103 merged and tagged; pin the OpenAPI version the baked modules were
      generated with (they import `OpenAPI.Runtime` internals — regenerate on
      OpenAPI upgrades).
- [ ] Product runtime environments on Julia ≥ 1.11, HTTP.jl 2.x, JSON.jl ≥ 1.7
      (hard requirements of the new OpenAPI).
- [ ] Decide zoned vs UTC date-times per module (`datetime = :zoned` now needs
      `using TimeZones` in the consumer env via the `OpenAPITimeZonesExt`
      extension; `:utc` is trim-friendlier — k8s timestamps are UTC anyway, so
      `:utc` is likely right for Kuber).
- [x] ~~Sweep the non-core k8s group documents through patch+generate~~ — done
      2026-08-12 at `1ff9ba8`: all 27 cluster-served group documents
      (incl. CRD-backed and aggregated APIs) patch, generate strict, load, and
      pass live list/watch calls; see the all-groups sweep in section 5.
      Two new patch rules came out of it (MicroTime, array-nullable).
- [ ] Re-run `gen/openapi_v1_prototype/k8sbaked.jl` and
      `gen/openapi_v1_prototype/k8spristine_v3.jl` against the then-current PR
      head and a real cluster.

## 8. Prototype artifacts

| File | What it is |
| --- | --- |
| `gen/openapi_v1_prototype/patch_k8s_spec.jq` | The spec patch step (Time/MicroTime nullable + arrays nullable + `/watch/` → WatchEvent), guarded so it applies to every group document incl. CRD-backed ones |
| `gen/openapi_v1_prototype/smoke_groups.jl` | The all-groups sweep: loads all 27 generated modules, strict-lists every cluster/all-namespaces resource, typed watch on apps/v1 — needs the 27 modules generated into `groups/` per the README |
| `gen/openapi_v1_prototype/k8sbaked.jl` | Live-cluster test: pod list, live watch (ADDED+DELETED), cancel — 8/8 at `bd96d53`, `c2a5244`, and `1ff9ba8` |
| `gen/openapi_v1_prototype/k8spristine_v3.jl` | Live-cluster test of the *unpatched-spec* route: strict-vs-tolerant pod list, watch-codec media matching (parameterized key without `accept=` doesn't fire; with `accept=` it fires on a shared client since `1ff9ba8`; plain-json codec on a dedicated client as pre-`1ff9ba8` fallback) — 11/11 at `1ff9ba8` |
| `gen/openapi_v1_prototype/README.md` | How to re-run the prototype end to end |

The pristine/patched spec snapshots and the 6.6 MiB generated module are not
checked in — they regenerate in under a minute from the commands in the README.
