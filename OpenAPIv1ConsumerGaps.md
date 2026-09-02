# Consumer compatibility and test gaps — JuliaRun and JuliaHub

**Status: working document, opened 2026-08-13.** A survey of how the JuliaHub
production stack actually uses Kuber, measured against what the
`openapi-v1-trial` branch provides and what its test suite covers. Companion to
[`OpenAPIv1TrialResults.md`](OpenAPIv1TrialResults.md), which records what the
branch does; this one records what consumers need from it.

**This is meant to be iterated on.** The `C…` and `G…` identifiers are stable
references — cite them in review, and tick the boxes as items close. Add new
findings with the next free number rather than renumbering.

## Scope of the survey

| Consumer | Kuber pin surveyed |
|---|---|
| `JuliaRun.jl` (+ `JuliaHubK8sApi.jl` 0.2.3) | 0.7.9 |
| JuliaHub monorepo — `services/JobLoops` | 0.7.11 |
| JuliaHub monorepo — `packages/K8sReflector`, `packages/JuliaRunPool`, `packages/AccessControl`, `services/BillingService` | unpinned / transitive |

27 Kuber-using files in the monorepo, plus all of `JuliaRun/src/kubernetes/` and
`JuliaRun/src/metrics/`.

## Headline

**The current tests do not cover consumer usage, and coverage is the second-order
problem.** The consumers do not use Kuber's generated layer at all: they use
Kuber's *verb* layer over a JuliaHub-specific generated layer
(`JuliaHubK8sApi`), plugged in through a `KuberContext(apimodule)` mechanism this
branch removed. Several APIs they call no longer exist, so no test could cover
them. Part 1 is that list; Part 2 is the genuine coverage gaps.

*Update, 2026-08-14:* the plug point is back, in a different shape —
[C1a](#c1a-the-mechanism--cheap-because-the-architecture-is-already-plugin-shaped)
is done. `Kuber.register!` merges an out-of-tree generated layer into the
registry from the registering package's `__init__`. What remains of C1 is
content: regenerating `JuliaHubK8sApi` against the new pipeline.

One thing that raises the stakes: **JuliaHub's own tests mock Kuber out** —
`services/JobLoops/src/hot_standby.jl` has 15 `@mock Kuber.…` call sites. The
consumer test suites will not catch any of this. Kuber's own suite is the only
real coverage these call paths get.

---

## Part 1 — Hard incompatibilities

Porting work, not test gaps. No test can cover an API that no longer exists.

### C1. The pluggable generated layer is gone

- [x] Add `Kuber.register!` (registry merge) — the mechanism. **Done**:
      `src/register.jl`, covered by `test/register.jl` (57 assertions, offline).
- [ ] Regenerate `JuliaHubK8sApi` through `gen/openapi_v1/` with the two or three
      group versions that are actually used — the content.

`JuliaHubK8sApi` is not an extension of Kuber's generated code; it is a **drop-in
replacement** for it. Its `src/` contains exactly the three things this branch
deleted: `api/Kubernetes.jl` (models + `*Api` operation modules),
`api_typemap.jl`, `api_versions.jl`.

JuliaRun consumes it that way:

- `JuliaRun/src/kubernetes/types.jl:8-12` — `KuberContext(K8sApi; long_polling_timeout=…, timeout=…)`
- `JuliaRun/src/metrics/kubernetesmetrics.jl:58-62` — same
- `JuliaRun/src/kubernetes/kubernetes.jl:52` and `src/metrics/kubernetesmetrics.jl:13` — `const K8sApi = JuliaHubK8sApi`

On `master`, `KuberContext(apimodule::Module=ApiImpl; httplib, kwargs...)`
(`src/helpers.jl:107`). On this branch the constructor is `KuberContext(; kwargs...)`
(`src/helpers.jl:86`) — no apimodule parameter.

**This is two problems with very different costs, and an earlier revision of this
document conflated them.**

#### C1a. The mechanism — cheap, because the architecture is already plugin-shaped

Not a redesign. Three properties make an external module admissible almost as-is:

- **`_new_client` is already duck-typed on the module.** `src/helpers.jl:138` is
  just `mod.Client(ctx.server; …)`. Nothing in `src/` references `_SPEC`. Any
  OpenAPI.jl 1.0 generated module qualifies.
- **The verb layer binds the tables, not their contents** — `using .ApiImpl:
  GROUP_MODULES, MODULE_GVS, KIND_TYPES, OPS, OP_PARAMS`. Those are `const`
  *bindings* to *mutable* `Dict`s, so a `merge!` is visible immediately with no
  recompilation.
- **The keys make merging conflict-free.** `OPS` is
  `(module, verb, kind, scope)`, `KIND_TYPES` is `(apiVersion, kind)`,
  `MODULE_GVS` is by module. Two packages collide only if they claim the same
  group-version — which should be an error anyway.

**Built as `src/register.jl`.** `Kuber.register!(source::Module)` reads the six
tables off a *registry module* — the shape `emit_registry.jl` already emits — and
merges them; a keyword form takes the tables directly, for tests and for
hand-built entries. `Kuber.unregister!` removes a module and everything it
brought, and refuses to touch the group modules Kuber ships. Four decisions worth
recording:

- **Everything is validated before anything is merged**, against the same
  invariants `test/registry.jl` asserts over the merged result — mutual inverse,
  `keys(OPS) == keys(OP_PARAMS)`, types and operations defined in the module that
  claims them, known verbs and scopes — plus `isdefined(mod, :Client)`, the one
  name Kuber calls on a group module. A rejected registration leaves the tables
  untouched, so a malformed layer cannot half-load.
- **A group version already served by a different module is an error**, not a
  silent override; `unregister!` first if replacing one is really the intent.
  Re-registering identical content is a no-op.
- **Registration order does not decide which module serves a kind.**
  `build_model_api_map` is still first-wins over core-then-alphabetical group
  order, so a kind name a shipped group already declares stays with the shipped
  group; `apiversion=` is the escape hatch. Asserted in `test/register.jl`.
- **No registry-generation counter.** A context that already ran discovery does
  not see newly registered kinds in `ctx.modelapi` until it discovers again —
  but both consumers load their layer with a top-level `using`
  (`JuliaRun/src/kubernetes/kubernetes.jl:18`,
  `JobLoops/src/k8s_job_pod_monitoring.jl:5`), so `__init__` runs before any
  context exists. Invalidating contexts automatically would have meant changing
  the `ctx.initialized` guard that `test/simpleapi.jl:64` and
  `test/watch_recovery.jl:94` set by hand to fake discovery. Revisit only if a
  consumer starts loading its layer lazily.

**Constraint for the registering package:** `register!` must run in its
`__init__`, not at top level — mutations to another module's state during
precompilation do not persist. Registered kinds are therefore absent from Kuber's
precompile image and pay first-call compilation, which matters given TTFX is
already ~15 s.

**Do not restore `KuberContext(apimodule)`.** It saves no regeneration (an external
module still has to supply tables in the new shape), it re-introduces the
per-context table scoping that keying `OPS` by module deliberately removed, and it
makes "two modules serve `apps/v1`" ambiguous instead of an error. Registration
being process-global is fine: `ctx.apis` and `ctx.modelapi` are still built
per-context at discovery from `KIND_TYPES`, so two contexts on different clusters
each resolve their own subset. The tables are global; resolution is not.

#### C1b. The content — small, once scoped to what is actually used

`JuliaHubK8sApi` ships 43 group versions and this branch's 17 are a strict subset,
so it adds 26. Per the [usage audit](#appendix--juliahubk8sapi-group-version-usage-audit),
**two are actually reachable through Kuber, possibly three, and no CRD group is
used at all.** So this is "regenerate two or three well-behaved aggregated APIs",
not "regenerate 26 including operator CRDs".

**Capture-from-cluster is the mechanism, it works, and it is now built.**
`fetch_specs.sh --from-cluster <group>/<version>` reads
`/openapi/v3/apis/<group>/<version>` and records provenance — cluster version,
context, date, checksums — in `SPECS_CAPTURED`, a separate file from the tag
mode's `SPECS_ORIGIN` so neither clobbers the other. A captured document is only
as reproducible as the cluster it came from, which is why it says so.

**`metrics.k8s.io/v1beta1` is captured and shipped** (2026-08-14, from k3s
v1.35.4). It went through the chain without a new patch rule — the existing
nullable rules covered it — strict generation passed first time, and it is
verified live: `test_metrics` in `test/runtests.jl` reads node metrics, pod
metrics in one namespace and across all of them, and single objects of each,
under strict response validation.

**That corrects this document's earlier "the generated output belongs in
`JuliaHubK8sApi`, not in Kuber".** It is right for deployment-specific groups and
wrong for `metrics.k8s.io`: the 0.2.x line shipped it *in Kuber* — master's
`SupportedAPIVersions.md` lists `metrics_v1beta1` and `api_typemap.jl` has the
`MetricsV1beta1` aliases — `Metrics.md` is a Kuber document, and metrics-server
is on nearly every cluster. Dropping it was a regression for every Kuber user,
not just JuliaHub. The line to draw is *could any user of this API plausibly have
this group*: metrics-server yes, an operator's CRDs no.

So what is left for `JuliaHubK8sApi` is smaller again: `custom.metrics.k8s.io`
(see [C5](#c5-custom-metrics-are-not-in-the-trial-build)) plus any CRD group that
turns out to be needed — and the audit found none.

Two things C1a left for this step to prove, one now settled:

- **`_new_client`'s duck-typing is exercised** — but by the shipped metrics
  module, not by a registered one. The live metrics tests build a client for a
  group module through the ordinary `client_for` path, which is the same code an
  out-of-tree module goes through; what is still untested is that path with a
  module Kuber does not ship. `test/register.jl` cannot do it: `_new_client` calls
  `Runtime.codec!`, which needs a real compiled `Spec`, so the proof needs a
  genuinely generated external module.
- **`emit_registry.jl` emits a file that assumes it lands inside `ApiImpl`,
  after the group modules** — it refers to them by bare name. An external package
  that mirrors that layout (group modules included first, registry after, all in
  one module) works as-is; one that structures itself differently will need the
  emitter to qualify the names.

#### C1c. What the port costs JuliaRun

Smaller than it looks, because **`Typedefs` is a generated tree of plain aliases**
(`JuliaHubK8sApi/src/api_typemap.jl:1252-1260` is `const Secret =
Kubernetes.IoK8sApiCoreV1Secret` and so on). Re-emitting it over the new type
names is mechanical, so **JuliaRun's ~28 `K8sApi.Typedefs.*` references survive
verbatim.** The exceptions:

- `Typedefs.CoreV1.WatchEvent`, `Typedefs.MetaV1.WatchEvent` and
  `Typedefs.EventsV1.Status` cannot work. The aliases can exist, but Kuber now
  yields `KuberEvent` and `Status` is per-module, so nothing will ever `isa` them.
  Sites: `JuliaRun/src/kubernetes/clustermgmt.jl:513`, `src/kubernetes/api.jl:1572`,
  `src/kubernetes/api.jl:1689`.
- `KuberContext(K8sApi; …)` → `KuberContext()` (see C1a) plus C6's kwargs.
- C4 and C7 are untouched by any of this.

#### C1d. The dynamic alternative, for later

A `register_crd!(gv, kind, plural, scope)` that synthesises operations from the
standard REST shape and treats bodies and responses as `Dict` would let a CRD be
addressed with no capture, no generation and no release. It could even be
automatic: discovery already returns everything needed — `/apis/helm.cattle.io/v1`
gives `name: "helmcharts"`, `kind: "HelmChart"`, `namespaced: true`, `verbs`, and
subresources (`helmcharts/status`).

It is **not** a runtime substitute for C1: no generated models means no `isa`, no
typed construction and no field dispatch, so it cannot carry JuliaRun's reading
code — though it fits JobLoops, which already builds `Dict{String,Any}` specs. And
those kinds would bypass response validation, which needs an explicit decision:
not the same as `validate_responses=false` (there is no spec to ignore), but
adjacent to a locked constraint.

Given that the audit found no CRD group in use, this is future-proofing rather
than a prerequisite — worth deferring until a CRD actually needs addressing.

### C2. `OpenAPI.Clients` does not exist in OpenAPI.jl 1.0

- [x] Export a supported replacement (see [G15](#g15-exception-classification-for-consumers)).
      **Done 2026-08-14**: `Kuber.is_retryable`.
- [ ] Port the call sites.

Consumers import it directly:

- `packages/K8sReflector/src/K8sReflector.jl:4` — `using OpenAPI.Clients: is_longpoll_timeout, is_request_interrupted`
- `services/BillingService/src/billing/main.jl:62` — `httplib=OpenAPI.Clients.HTTPLib.HTTP`
- `packages/AccessControl/src/AccessControl.jl:77` — `kwargs[:httplib] = OpenAPI.Clients.HTTPLib.HTTP`
- `JuliaRun/src/kubernetes/api.jl:1040, 1053, 1065, 1529` and
  `JuliaRun/src/kubernetes/clustermgmt.jl:114-115` — `isa(err, OpenAPI.Clients.ApiException)`,
  and one `ex.resp.data` read. *(Found 2026-08-14; not in the original survey.)*

Load failures, not behaviour changes. What each one becomes:

| Gone | Successor |
|---|---|
| `is_request_interrupted` | **`Kuber.is_retryable(e)`** — same question, stated over `HTTP.HTTPError` as an exclusion list. Unwraps `TaskFailedException`/`CompositeException`, so it works on what `watch` throws |
| `is_longpoll_timeout` | none, and none is needed: watches carry no overall deadline here, so a watch never ends on one. It ends when the consumer closes the stream, which is not an exception |
| `OpenAPI.Clients.ApiException` | `Kuber.KuberException` — every generated call goes through `_call`, which rewraps `Runtime.ApiError`. `ex.resp.data` becomes `ex.message` (the body verbatim) or `ex.response` |
| `httplib=` | nothing; there is one backend |

The `is_request_interrupted(ex) && isopen(rf.stream_handle[])` idiom at
`K8sReflector.jl:241-242` has no direct translation, and does not need one: a
consumer-initiated stop no longer surfaces as an interruption to be told apart
from a transient one. Closing the stream makes `watch` *return*, not throw.

One thing the port will surface, unrelated to Kuber: `api.jl:1053` and `1065`
read `OpenAPI.Clients .. ApiException`, with spaces. That parses as a call to
`..`, which nothing defines — so those two `catch` blocks would `MethodError`
over the original error if they were ever reached.

### C3. `ctx.apimodule` reach-through

- [ ] Port `K8sReflector` off generated `WatchEvent`/`Status` types.

`packages/K8sReflector/src/K8sReflector.jl:52-53` reads
`c.apimodule.Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent` and
`…MetaV1Status` to get the types it later dispatches on. This branch has no
`apimodule` field; watch events are `KuberEvent` (not a generated type), and
`Status` exists once per group module, so there is no single type to compare
against — `kuber_kind` is the intended test.

### C4. camelCase → lowercase field names

- [ ] Sweep consumer model-field access.

- `packages/K8sReflector/src/K8sReflector.jl:12` — `i.metadata.resourceVersion` → `resourceversion`
- `services/JobLoops` — `.containerStatuses` (5 sites), `.restartCount`, `.nodeName`

These surface as `type has no field` at runtime, on the paths that matter most.

### C5. Custom metrics and `metrics.k8s.io` are stubs on this branch
<!-- metrics.k8s.io no longer is; custom metrics await one capture. -->


- [x] Generate `metrics.k8s.io/v1beta1`. **Done 2026-08-14** — captured and
      shipped *in Kuber* rather than in `JuliaHubK8sApi`; see C1b for why that
      moved, and `test_metrics` in `test/runtests.jl` for the live coverage.
- [x] Reimplement `list_custom_metrics` / `list_namespaced_custom_metrics` over the
      registry — on `master` they are one-liners delegating to
      `list(ctx, :MetricValue, "<objecttype>/<name>/<metric>")`. **Done**: they
      are those one-liners again, and `list(ctx, O, name)` exists again to carry
      them.
- [ ] Capture `custom.metrics.k8s.io/v1beta1` from a cluster running an adapter,
      generate it into `JuliaHubK8sApi`, and register it.
- [ ] Check on that same cluster whether `custom.metrics.k8s.io/v1beta2` is also
      needed: nothing names it, but the helpers resolve `:MetricValue` through
      server preference rather than a pinned version, so a grep cannot answer this.

**What is left is one capture, and it needs a cluster this repo cannot reach.**
`custom.metrics.k8s.io` exists only where a metrics adapter is installed; no
public document defines it (master's came from definitions hand-spliced into the
legacy Swagger file), and no cluster available here serves it. Hand-authoring an
OpenAPI 3 document from master's fragment was considered and rejected: strict
response validation would enforce a spec nobody could check, and the honest
version of that work is one command on a cluster that has the adapter —

```sh
gen/openapi_v1/fetch_specs.sh --from-cluster custom.metrics.k8s.io/v1beta1
```

Everything on Kuber's side of it is done and tested. Two pieces were needed:

- **`list(ctx, O, name)` is back.** The trial's `list` took no name, so master's
  one-liners had nowhere to put the composite metric name.
- **`_positional` no longer requires the path parameter to be called `name`.**
  Every group the apiserver serves calls it that; `custom.metrics.k8s.io` calls
  it `compositemetricname`, and `emit_registry.jl` takes path parameter names
  verbatim, so the verb layer would have rejected the operation it generated.
  There is only ever one such parameter, so the name argument fills whichever it
  is — and more than one is now a clear error rather than a confusing one. This
  would have bitten any captured group with a non-standard path, not just this
  one.

`JuliaRun/src/metrics/kubernetesmetrics.jl` is built on them:

- lines 213-228 — `list_namespaced_custom_metrics` / `list_custom_metrics` (5 call sites)
- lines 186-188 — `Typedefs.CustomMetricsV1beta1.MetricValueList` / `MetricValue`
- lines 87, 130 — node and pod metrics via `metrics.k8s.io`
- `:NodeMetrics`, `:PodMetrics` kind symbols (2 each)

Of that list, node and pod metrics (lines 87, 130 and the `:NodeMetrics` /
`:PodMetrics` symbols) now work; the `custom.metrics` call sites and
`Typedefs.CustomMetricsV1beta1` still need the capture above.

### C6. `KuberContext` timeout kwargs

- [ ] Port `long_polling_timeout` / `timeout` to `request_options`.

Both call sites are the ones in C1. `set_timeout` now sets `request_timeout`;
`set_request_options` passes the rest through. Watches deliberately take no
overall deadline — bound them with `timeout_seconds`.

### C7. `ABSENT` audit — smaller than expected, but not zero

- [ ] Audit the read side: `K8sReflector`, `JuliaRun/src/kubernetes/{clustermgmt,api}.jl`.

Already on the results-doc checklist, and narrower than that checklist implies.
Traced sites: the `!== nothing` hits in `services/JobLoops/src/provisioner.jl` and
`src/deployment_queue.jl` are on JuliaHub's own types (`JobToSpawn`,
`deployment_queue.jl:171`) and on plain `Dict{String,Any}` job specs — **not** on
Kuber models. JobLoops builds k8s objects as dicts and hands them to
`put!(ctx, kind, dict)`, which is inherently ABSENT-proof.

So there are no confirmed model-field `=== nothing` sites in the monorepo, and the
exposure is concentrated on the *read* side, where model fields are accessed
directly.

---

## Part 2 — Test gaps

Things this branch *does* support (or has deliberately changed the contract of)
where consumer usage is not exercised by any of the 3824 offline or ~303 live
assertions.

### Watch contract — the highest-risk cluster

#### G1. An expired `resourceVersion` is invisible to the consumer

- [x] Contract decision, then a test. **Done 2026-08-14**: Kuber now lists again
      on expiry and delivers that list as a resync frame (`_resync`,
      `src/simpleapi.jl`), covered by two testsets in `test/watch_recovery.jl`.

`src/simpleapi.jl:296-299`: the in-stream 410 `ERROR` event is consumed by the
pump (`break`, no `put!`) and the watch restarts with `rv = nothing`. Nothing
reaches the caller.

`K8sReflector` depends on seeing it. `src/K8sReflector.jl:171-192` matches the 410
`Status`, parses the oldest-available resourceVersion out of the message, and
throws to trigger `cleanup(rf)` + `initial_load(…)` — i.e. **it invalidates its
cache**. On this branch that path is dead code.

Mechanism, verified two ways:

- The initial list runs **once**, in `list`/`get` before `_pump_watch`
  (`src/simpleapi.jl:386-401`). On the expired path the pump sets `rv = nothing`
  and re-issues only the *watch* call (`src/simpleapi.jl:268-272`) — it never
  re-lists.
- A watch with no `resourceVersion` opens with synthetic `ADDED` events for
  everything that currently exists. Confirmed against a live cluster: `curl -sN
  '…/pods?watch=true'` with no `resourceVersion` replayed both existing pods as
  `ADDED`.

So after a 410 the reflector's store is re-upserted with current state, but nothing
ever tells it about objects deleted while the watch was gone — no `DELETED` event
is coming for them. **Phantom entries persist for the lifetime of the process.**

This is a silent correctness regression for any cache-maintaining consumer.
`test/watch_recovery.jl`'s "expired resourceVersion starts over" testset asserted
the *opposite* side of it — that Kuber recovers — because that was the design
choice.

**Resolution.** The contract is now *a list object on the stream means complete
current state*, and the pump upholds it: on the in-stream 410 it lists again,
pushes that list, and watches from its `resourceVersion`. That is what client-go's
reflector does, and it removes the phantom-entry class rather than delegating it —
a consumer that replaces its store on a list frame is correct without knowing
expiry exists. Three decisions behind it:

- **One frame shape, not two.** The initial frame was already a bare list, so the
  resync frame is too. A `KuberEvent("RESYNC", …)` marker was considered and
  rejected: two shapes for "here is full state" is worse than one, and on the
  `get` path (whose initial frame is a single object) a resync-typed event would
  be stranger than a plain list.
- **The 410 `ERROR` frame is still not delivered.** The list carries strictly
  more information than the `Status` did, and surfacing an error for a condition
  Kuber recovers from would break consumers that treat `ERROR` as fatal.
- **`push_initial=false` suppresses the resync frame too** — it is the caller
  saying "events only", and `watch(ctx, O, stream)` sets it. Such a consumer
  still gets the recovery (the re-list is where the new `resourceVersion` comes
  from) but not the state, and must track expiry itself. Narrow, documented, and
  the shape `K8sReflector` will want anyway since it keeps its own store.

This changes what [G2](#g2-caller-driven-re-establishment) needs from the
reflector port: it no longer has to catch a 410 and drive `cleanup` +
`initial_load` itself — replacing its store on a list frame does the same job.

#### G2. Caller-driven re-establishment

- [ ] Test a caller that re-establishes its own watch in a loop.

`packages/K8sReflector/src/K8sReflector.jl:216-245` wraps `Kuber.watch` in its own
`while true` and relies on `watch` *returning* (on long-poll timeout) so it can
re-establish with its own tracked resourceVersion. On this branch watches have no
deadline and the pump re-watches internally, so `watch` returns only when the
consumer closes the stream. The reflector's inner loop becomes unreachable.

#### G3. Event continuity across a Kuber-internal re-watch

- [ ] Assert no event is dropped or duplicated across the re-watch seam.

`watch_recovery.jl` asserts a resume happens with the right resourceVersion. It
does not assert continuity — exactly what a reflector's store correctness depends
on.

#### G4. Watch with a label selector across all namespaces

- [ ] Test a selector-scoped all-namespaces watch end-to-end.

The reflector always passes `label_selector` and `namespace=nothing`
(→ `_scopes(nothing)` = `(:cluster, :allns)`). The live suite watches `:Pod` in one
namespace with no selector; offline tests cover scope *resolution* only.

#### G5. Long-lived watch

- [ ] Decide whether this is testable in CI at all, or only as a manual probe.

The reflector's watches live for the process lifetime. The longest test watch is
seconds. Nothing covers hours, `BOOKMARK` events, or a proxy/LB dropping an idle
connection.

### Kind coverage

#### G6. Consumers write kinds the live suite never touches

- [ ] Extend the live suite to the kinds marked **no** below.

The live suite submits Pod, Service, Job and Deployment. ReplicationController is
built but never submitted; HPA `v1`/`v2` objects are built client-side only (to
exercise versioned typing); CronJob appears solely in a `@test_throws KeyError`
for the removed `batch/v1beta1`.

| Kind | JuliaRun | JuliaHub monorepo | In live suite? |
|---|---|---|---|
| Job | 26 | | yes |
| Deployment | 23 | 20 | yes |
| ReplicaSet | 12 | | **no** |
| Service | 11 | | yes |
| Node | 10 | 1 | read-only only |
| Pod | 7 | 3 | yes |
| Secret | 6 | 2 | **no** |
| DaemonSet | 4 | | **no** |
| CronJob | 4 | | **no** (only a removed-version lookup test) |
| Namespace | 3 | 8 | read-only only |
| RoleBinding | 2 | | **no** |
| PersistentVolume | | 4 | **no** |
| PersistentVolumeClaim | | 3 | **no** |
| NetworkPolicy | | 3 | **no** |
| ConfigMap | | 2 | **no** |

This matters more here than it would on `master`: strict response validation
checks each kind's schemas independently, and **two of the five patch rules were
found exactly this way** (`*/*` request bodies on `put!`, DELETE 2xx on
`delete!`). Each untested kind is an unexercised set of schemas.

#### G7. Secret round-trip

- [ ] Test base64 `data` / `stringData` through the new codec.

`JuliaRun/src/kubernetes/api.jl:220-248` builds Secrets with `data`.

#### G8. Node and Namespace as cluster-scoped writes

- [ ] Cover a cluster-scoped create/delete.

Both appear in the live suite only as reads; JobLoops creates Namespaces
(`services/JobLoops/src/hot_standby.jl:526`).

### Data-shape gaps

#### G9. Open-struct labels and annotations on write

- [ ] `put!` with labels, read them back off the server.

`test/helpers.jl:73-89` covers `kuber_props` on a hand-built object. Nothing covers
the round trip, nor the `services/JobLoops/src/networkpolicy.jl:114` pattern
(`labels["version"]`, which now needs `kuber_props`).

#### G10. `resource_version=` on a list or get

- [ ] Test the live "not older than" read.

`packages/K8sReflector/src/K8sReflector.jl:136-141` passes it to `Kuber.get`. The
`_op_kwargs` translation is unit-tested; the live behaviour is not.

#### G11. `.items` and `metadata.resourceversion` off a real list

- [ ] Assert the consumer-facing shape of a live list result.

`_resource_version` is tested on synthetic dicts and objects; live list results are
asserted only as `isa …List`.

#### G12. Resource limits are an open struct

- [ ] Test `kuber_props` on `resources.limits` / `.requests`.

`IoK8sApiCoreV1ResourceRequirements.limits` is now
`IoK8sApiCoreV1ContainerResourcesLimits`, whose only field is
`additional_properties::Dict{String,IoK8sApimachineryPkgApiResourceQuantity}`, so
`limits["cpu"]` must become `kuber_props(limits)["cpu"]`.

Quantity itself is fine: still a struct with a single `value` field, so JuliaRun's
`cpu.value` (`src/kubernetes/api.jl:1841`) and
`conv_units(::Typedefs.CoreV1.Quantity)` (`src/kubernetes/clustermgmt.jl:20`)
survive structurally. Only the type *identity* differs, which is C1's problem.

#### G13. `put!(ctx, O::Symbol, dict)` — the dominant consumer form — is untested

- [ ] One testset. Highest value per line of test code in this document.

Trial tests only ever call the 2-arg model form (`put!(ctx, nginx_pod)`).
`services/JobLoops/src/hot_standby.jl:526,541,545` uses
`Kuber.put!(ctx, :Deployment, spec)` and `(ctx, :Namespace, …)`. The signature
exists and is in fact *wider* than master's (`v::AbstractDict` vs
`Dict{String,Any}`, plus an untyped fallback at `src/simpleapi.jl:476`), so this is
a coverage gap rather than a break — and it is the shape most production writes go
through.

### Error and retry paths

#### G14. Live retryable statuses

- [ ] Exercise a real 429/503/504, and retries interacting with a watch establish failure.

`k8s_retry_cond` is characterized offline only, by
`test/characterize_retries.jl`, which is not in `runtests.jl`.

#### G15. Exception classification for consumers

- [x] Export a supported "was this transient?" predicate and pin it with a test.
      **Done 2026-08-14**: `Kuber.is_retryable`, `test/helpers.jl`.

With `OpenAPI.Clients` gone (C2), consumers had no supported way to ask. Kuber had
the logic internally but did not export it, and no test pinned it as public
behaviour.

`is_retryable(e)` is `k8s_retry_cond`'s answer over an unwrapped exception. Named
for what it means rather than for what it replaces: it is exactly "would Kuber
retry this", which is the question a consumer driving its own calls has to answer,
and it matches the internal vocabulary (`k8s_retryable_codes`, `k8s_retry_cond`).

Two boundaries the test pins, because both are easy to get wrong later:

- **`TaskFailedException`/`CompositeException` are unwrapped.** `watch(processor,
  ctx, …)` runs two tasks under `@sync`, so a failure arrives wrapped. A predicate
  that did not unwrap would answer `false` for every watch failure — the exact
  case it exists for. A composite carrying more than one exception is left alone:
  no single cause to classify.
- **A `DecodeError` is not retryable.** A response that does not match the schema
  is spec drift. The watch pump separately recovers from a truncated stream item,
  which arrives the same way but means the connection died mid-frame.

#### G16. `update!` patch coverage

- [ ] Enumerate the patch types and kinds JobLoops actually patches, then test them.

JobLoops has 14 `update!` call sites; the live suite patches one Deployment with
`application/merge-patch+json`.

---

## Suggested order

1. ~~**C1a** — the registration mechanism.~~ **Done** — `src/register.jl`,
   `test/register.jl`, documented in `README.md`.
2. ~~**G1** — the one silent-correctness item.~~ **Done** — the pump re-lists on
   expiry and delivers a resync frame; `test/watch_recovery.jl`.
3. ~~**G15 / C2** — export an exception-classification helper.~~ **Done** —
   `Kuber.is_retryable`; porting the consumer call sites is the remaining half
   of C2.
4. ~~**C1b / C5**~~ — **mostly done**: `fetch_specs.sh --from-cluster` exists,
   `metrics.k8s.io/v1beta1` is captured, shipped and live-tested, and the
   custom-metrics helpers are reimplemented. What remains is one capture of
   `custom.metrics.k8s.io/v1beta1` on a cluster running an adapter, and
   regenerating `JuliaHubK8sApi` around it.
5. Widen the live suite, cheapest first: **G13**, then G6 kinds, G9/G10/G11 data
   shapes, G4 selector-scoped all-namespaces watch, G2 caller-driven re-watch.
6. **C1d** deferred until a CRD actually needs addressing.

---

## Appendix — JuliaHubK8sApi group-version usage audit

Surveyed 2026-08-13 against `JuliaHubK8sApi` 0.2.3, `JuliaRun.jl` and the JuliaHub
monorepo. It ships **43** group versions; this branch's **17** are a strict subset,
so it adds **26**. Of those 26:

| Extra group version | Used through Kuber? | Evidence |
|---|---|---|
| `metrics.k8s.io/v1beta1` | **yes** | `Typedefs.MetricsV1beta1` ×4; `:NodeMetrics`, `:PodMetrics` |
| `custom.metrics.k8s.io/v1beta1` | **yes** | `Typedefs.CustomMetricsV1beta1` ×2; `:MetricValue` |
| `custom.metrics.k8s.io/v1beta2` | **needs a runtime check** | never named; `:MetricValue` resolves by server preference |
| the other 23 | **no** | listed below |

Unused: `admissionregistration.k8s.io/v1`, `authentication.k8s.io/v1`,
`authorization.k8s.io/v1`, `cluster.redpanda.com/v1alpha1`,
`crd.k8s.amazonaws.com/v1alpha1`, `elbv2.k8s.aws/v1alpha1`,
`elbv2.k8s.aws/v1beta1`, `flowcontrol.apiserver.k8s.io/v1`,
`flowcontrol.apiserver.k8s.io/v1beta3`, `helm.cattle.io/v1`,
`helm.toolkit.fluxcd.io/v2beta1`, `k3s.cattle.io/v1`,
`karpenter.k8s.aws/v1alpha1`, `karpenter.sh/v1alpha5`, `monitoring.coreos.com/v1`,
`monitoring.grafana.com/v1alpha1`, `networking.k8s.aws/v1alpha1`,
`redpanda.vectorized.io/v1alpha1`, `source.toolkit.fluxcd.io/v1` + `/v1beta1` +
`/v1beta2`, `vpcresources.k8s.aws/v1alpha1` + `/v1beta1`.

**No CRD group is used through Kuber.**

### How the blind spots were closed

A grep for type names alone would have been wrong three times over:

- **Dynamic kinds.** `JuliaRun/src/kubernetes/api.jl:522,601,855,867` do
  `put!(cm, Symbol(job["kind"]), job)`, so the kind set is not statically obvious.
  Every `"kind"` assigned under `src/kubernetes/` was traced: RoleBinding,
  ClusterRole, ServiceAccount, DaemonSet, Namespace, ResourceQuota, CronJob,
  Service, plus `"$kind"` interpolations in the job and service templates. All core
  v1 / apps/v1 / batch/v1 / rbac — inside this branch's 17.
- **The monitoring CRDs are a red herring.** JuliaRun's tree contains
  `ServiceMonitor` (12), `PrometheusRule`, `Prometheus`, `Alertmanager` and
  `ThanosRuler`, but they live under
  `scripts/local/compute/metrics/prometheus/manifests/` and are applied by
  `kubectl create -f manifests/` in `deploy.sh` — never through Kuber.
- **`karpenter.k8s.aws`** appears once in JuliaRun, as a node *label string*
  (`src/kubernetes/api.jl:2`), not a CRD type.

Corroborating signals: every direct generated-type reference across both repos is
upstream (`IoK8sApiAppsV1Deployment` ×12, `…MetaV1ObjectMeta` ×10,
`…DeploymentStatus`/`List`/`Spec`, `IoK8sApiCoreV1Pod`, `…MetaV1WatchEvent`,
`…MetaV1Status`, `IoK8sApiCoreV1Namespace`); the `Typedefs` submodules JuliaRun
references are `CoreV1` (17), `MetricsV1beta1` (4), `EventsV1` (4),
`CustomMetricsV1beta1` (2), `MetaV1` (1); and `apiVersion` literals in monorepo
`.jl` files are `v1` (5), `networking.k8s.io/v1` (3), `apps/v1` (1).

`EventsV1` is only reached for its `Status` alias — an artifact of the old alias
layout rather than use of the events group, which is upstream anyway.

### Caveats

- Static analysis of two trees. `JuliaHubK8sApi` is a shared package and may have
  consumers outside them.
- `custom.metrics.k8s.io/v1beta2` needs a runtime check, not a grep.
- Re-run this audit before regenerating: it is a point-in-time snapshot.
