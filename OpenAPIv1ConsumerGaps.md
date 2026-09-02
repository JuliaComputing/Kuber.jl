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
| `getpropertyat` / `haspropertyat` | **`Kuber.getpropertyat` / `Kuber.haspropertyat`** — same walk, `ABSENT`-aware. Unexported, so qualify them. 49 call sites in JuliaRun become a changed import |

The `is_request_interrupted(ex) && isopen(rf.stream_handle[])` idiom at
`K8sReflector.jl:241-242` has no direct translation, and does not need one: a
consumer-initiated stop no longer surfaces as an interruption to be told apart
from a transient one. Closing the stream makes `watch` *return*, not throw.

One thing the port will surface, unrelated to Kuber: `api.jl:1053` and `1065`
read `OpenAPI.Clients .. ApiException`, with spaces. That parses as a call to
`..`, which nothing defines — so those two `catch` blocks would `MethodError`
over the original error if they were ever reached.

**`getpropertyat`/`haspropertyat` are the big one, and were missed until the G12
audit.** `JuliaRun/src/kubernetes/kubernetes.jl:21` does
`import OpenAPI.Clients: getpropertyat, haspropertyat`, and there are **49 uses**
across `clustermgmt.jl`, `api.jl` and `kubernetes.jl`. Confirmed absent from the
pinned 1.0 commit — they existed only in the 0.x client.

They are not hard to replace, but the semantics must change with them, which is
the part that makes this more than a rename. On 0.x an unset field was `nothing`,
so `haspropertyat(pod, :status, :phase)` answered a real question. On 1.0 every
field exists and an unset one is `ABSENT`, so a naive `hasproperty` walk answers
`true` unconditionally — the same trap [G12](#g12-resource-limits-are-an-open-struct)
found in `container_resource`. A faithful replacement has to treat both `ABSENT`
and `nothing` as absent, which is exactly what `Kuber._field(x) === nothing`
does.

**Added 2026-08-15 as `Kuber.getpropertyat` / `Kuber.haspropertyat`**, kept
**unexported** — they are a shim for consumers porting off 0.2.x, not a shape
this API wants to encourage, so a call site has to say `Kuber.` and stays easy
to grep for later. Covered by `test/helpers.jl`.

For JuliaRun this turns 49 rewrites into a changed import:

```julia
import OpenAPI.Clients: getpropertyat, haspropertyat   # before
import Kuber: getpropertyat, haspropertyat             # after
```

Two behaviours differ from 0.x, and both are deliberate:

- **`ABSENT` counts as absent**, which is the entire reason these exist. A
  handwritten `hasproperty` walk answers `true` for every field on 1.0.
- **A path element may name an open-struct entry**, so
  `getpropertyat(node, :metadata, :labels, "role")` reads a label directly.
  That covers the `get(nodelabels, "role", "")` sites in `clustermgmt.jl:203-204`
  as well, which would otherwise each need a `kuber_props` call.

**They do not fold case, and that matters at these call sites.** The path is the
*generated* field name, which lowercases the JSON one — `:nodename`, not
`:nodeName`. JuliaRun's existing calls include `:loadBalancer`, `:nodeName` and
`:backoffLimit`, so those are [C4](#c4-camelcase--lowercase-field-names) fixes
that still have to be made by hand. Folding case would have hidden them, and
would have made a typo succeed whenever it happened to lowercase-match.

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

The rule is **lowercase the JSON name**, not snake_case it: the field is
`desirednumberscheduled`, never `desired_number_scheduled`. Worth stating because
snake_case is what an OpenAPI-generated Julia model usually looks like, so the
wrong guess is the natural one. Status fields are where this bites hardest —
they are the longest names (`observedgeneration`,
`persistentvolumereclaimpolicy`, `currentnumberscheduled`) and the ones a
consumer reads in a poll loop, so a typo shows up as a runtime error the first
time that loop runs rather than at load. Writing G6's testset needed the
translation on nine such fields.

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

### C8. JSON patches did not encode at all
<!-- Found 2026-08-14 while working G16. Fixed the same day. -->

- [x] Declare the json-patch body as an array, and carry a body type per media
      type. **Done 2026-08-14**: `patch_k8s_spec.jq` §6, `OP_BODIES` reshaped,
      `update!` selects on `content_type`.

Kubernetes' OpenAPI document declares **one** request schema — `meta.v1.Patch`,
`type: object` — for all five patch media types. That is untrue of
`application/json-patch+json`, whose body is an array of RFC 6902 operations. The
generated `Patch` model can only hold an object, so:

```julia
julia> Runtime._decode(Patch, [Dict("op" => "replace", "path" => "/spec/replicas", "value" => 2)], false)
ERROR: DecodeError: expected an object while decoding …Patch, got Vector{Dict{String, Any}}
```

Every json-patch caller in the stack was therefore broken, which is **all** of
them — `julia_parallel_scale` (every worker scale-up and scale-down),
`taint_update_patch`, `julia_update_job`, and `hot_standby.jl`'s deployment
scaling. Only `master`'s merge-patch callers (`set_node_cordon`,
`set_node_label`, the Secret patch) would have worked.

The fix is a patch rule, per the branch's standing rule that a document which
lies gets one: the json-patch content schema becomes
`{"type": "array", "items": {"type": "object"}}`, declared once as a component
(`meta.v1.JSONPatch`) and referenced. Inlining it per operation makes the
generator emit one item type per patch operation — 132 in `apps/v1` alone,
+27 KiB — where the shared component emits one, +3.4 KiB. Items stay untyped
objects: `move`/`copy` carry `from`, `remove` carries no `value`, so anything
stricter would reject valid patches under strict request validation.

`OP_BODIES` consequently maps **media type → body type** instead of carrying one
type and a list of media types, since a PATCH now genuinely has two body types.
That is a change to the registration contract published in
[C1a](#c1a-the-mechanism--cheap-because-the-architecture-is-already-plugin-shaped),
so the docstring, the fixture in `test/register.jl` and the validation in
`_check_registration` moved with it.

`update!` also normalizes two other shapes the 0.2.x client accepted, through
`_patch_payload`: a patch given as **JSON text**, and a patch given as a
**generated model** — `JuliaRun/src/kubernetes/api.jl:252` patches a Secret with
a whole desired `Secret`. A model cannot be decoded into the open `Patch` struct
directly (it wants an object, not a struct), so it is encoded to its JSON object
first. That one was found by the live test, not by reading: it is the shape a
reviewer is least likely to think of. One consequence worth stating: a malformed json-patch — an *object*
under `application/json-patch+json`, which is what
`JobLoops/src/networkpolicy.jl:142` sends (see [C9](#c9-a-live-defect-in-jobloops-found-in-passing)) — now
fails inside Kuber as a `DecodeError` rather than reaching the server for a 422.
`is_retryable` says a `DecodeError` is not retryable, which is the right answer
for a malformed body: `@retry_on_error` around that call will stop retrying it.

### C9. A live defect in JobLoops, found in passing
<!-- Not a port issue. Recorded because the port is what surfaced it. -->

- [ ] Fix `networkpolicy.jl:142` in the monorepo — not a Kuber change.

`services/JobLoops/src/networkpolicy.jl:141-143` updates a network policy with

```julia
update!(ctx.ctx, :NetworkPolicy, name, json(POLICIES[name]), "application/json-patch+json")
```

`POLICIES[name]` is a whole NetworkPolicy **object** (`networkpolicy.jl:96-98`),
so this sends an object body under a media type whose body must be an array of
operations. It cannot ever have worked as intended: a real apiserver answers 422.
The likely intent is `application/merge-patch+json`, or
`application/strategic-merge-patch+json` to match how the policies are created.
Worth checking whether the update path is simply never taken — `needs_update`
only fires when the `version` label differs.

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

- [x] Test a caller that re-establishes its own watch in a loop.
      **Done 2026-08-14**: "a caller can end a watch and re-establish it itself"
      in `test/watch_recovery.jl`.
- [ ] Port `K8sReflector`'s loop to the shape below — **the test closing does not
      mean the reflector works unchanged.**

`packages/K8sReflector/src/K8sReflector.jl:216-245` wraps `Kuber.watch` in its own
`while true` and relies on `watch` *returning* (on long-poll timeout) so it can
re-establish with its own tracked resourceVersion. On this branch watches have no
deadline and the pump re-watches internally, so `watch` returns only when the
consumer closes the stream. The reflector's inner loop becomes unreachable.

**That part does not change, and it is worth being precise about what closing
this box means.** A clean server close is re-watched internally by the pump —
including one caused by `timeout_seconds`, so there is no server-side way to make
`watch` hand control back either. The reflector's `while true` is dead code on
this branch no matter what. What the test establishes is that the *pattern* is
still expressible: a caller can drive re-establishment by ending the watch
deliberately, and resume from a version it tracked itself.

The shape is a stream processor that leaves its event loop, which closes the
stream through the `finally` in `watch(streamprocessor, …)` and so ends the
watch:

```julia
rv = nothing
while true
    resume = rv === nothing ? NamedTuple() : (; resource_version = rv)
    watch(ctx, list, :Pod; resume...) do stream
        for item in stream
            item isa KuberEvent || continue   # the initial list frame
            handle(item)
            rv = Kuber._resource_version(item.object)
            time_to_reestablish() && break    # ends the watch
        end
    end
end
```

The assertion that makes this worth having is the last one: **the resumed round
issues no list request.** A caller supplying `resource_version` skips the initial
list, so a consumer keeping its own store pays for full state exactly once — the
useful half of the same `if !watch || resource_version === nothing` guard that
makes [G17](#g17-resource_version-is-accepted-and-ignored-on-non-watch-reads) a
bug on non-watch reads.

#### G3. Event continuity across a Kuber-internal re-watch

- [x] Assert no event is dropped or duplicated across the re-watch seam.
      **Done 2026-08-14**: "no event is dropped or duplicated across a re-watch"
      in `test/watch_recovery.jl`.

`watch_recovery.jl` asserted that a resume happens with the right
resourceVersion. It did not assert continuity — exactly what a reflector's store
correctness depends on.

Two things make the test more than a restatement of the resume assertion. The
first watch sends a **burst** of three events and then closes cleanly, so events
are in flight when the connection ends rather than arriving one per round trip;
and the consumer reads nothing until the seam has demonstrably passed (it waits
on the second watch request appearing, not on an event), so the burst has to
survive *buffered* across the re-watch. The assertions are the exact sequence
either side of the seam, `allunique`, an empty stream afterwards — a re-delivered
frame would be sitting there — and that the resume names the **last** version of
the burst rather than the first.

**What it does not prove:** that no duplicate arrives, only that Kuber does not
manufacture one. A server that replays an event Kuber already delivered would
still reach the consumer, because Kuber does not deduplicate and cannot: watch
events carry no identity beyond the object and its version. A consumer that
needs exactly-once must key on `metadata.resourceversion` itself. That is the
same contract client-go gives, and it is worth stating because "continuity is
tested" invites the stronger reading.

#### G4. Watch with a label selector across all namespaces

- [x] Test a selector-scoped all-namespaces watch end-to-end. **Done
      2026-08-14**: `watch_selector_all_namespaces` in `test/runtests.jl`, run in
      both live passes.

The reflector always passes `label_selector` and `namespace=nothing`
(→ `_scopes(nothing)` = `(:cluster, :allns)`). The live suite watched `:Pod` in one
namespace with no selector; offline tests covered scope *resolution* only.

The test mirrors `k8s_job_pod_monitoring.jl:66` rather than approximating it —
`:Pod`, `namespace=nothing`, and a selector built by `sel(marker, :in, id)` — and
covers both halves of the reflector's loop, the initial `get` that fills its store
and the watch that maintains it. Two things make it meaningful rather than merely
green: a selected pod is created in *two* namespaces, so a result carrying both
proves the read is all-namespaces rather than luckily single-namespace; and the
watch resumes from the list's `resourceVersion`, with an unselected pod created
*before* the selected one, so seeing the selected event proves the other was
filtered rather than merely late. A wait-and-hope negative would be flaky.

Incidental coverage, not enough to close their boxes: `resource_version=` on a
live read ([G10](#g10-resource_version-on-a-list-or-get)) and labels written then
read back through `kuber_props` ([G9](#g9-open-struct-labels-and-annotations-on-write)).

*Found while writing it:* **`put!` addresses the request with `ctx.namespace` and
ignores `metadata.namespace` on the object.** Creating an object whose metadata
names a different namespace is a 400 — "the namespace of the provided object does
not match the namespace sent on the request". Not a regression: `master` does the
same and does not even offer a `namespace` keyword on `put!`. Worth knowing when
building objects with explicit namespaces, which is why the test passes
`namespace=` explicitly.

#### G5. Long-lived watch

- [ ] Decide whether this is testable in CI at all, or only as a manual probe.

The reflector's watches live for the process lifetime. The longest test watch is
seconds. Nothing covers hours, `BOOKMARK` events, or a proxy/LB dropping an idle
connection.

### Kind coverage

#### G6. Consumers write kinds the live suite never touches

- [x] Extend the live suite to the kinds marked **no** below.
      **Done 2026-08-14**: `create_delete_more_kinds` in `test/runtests.jl`,
      run in both live passes.

The live suite submitted Pod, Service, Job and Deployment. ReplicationController
is built but never submitted; HPA `v1`/`v2` objects are built client-side only
(to exercise versioned typing); CronJob appeared solely in a `@test_throws
KeyError` for the removed `batch/v1beta1`.

| Kind | JuliaRun | JuliaHub monorepo | In live suite? |
|---|---|---|---|
| Job | 26 | | yes |
| Deployment | 23 | 20 | yes |
| ReplicaSet | 12 | | yes — G6 |
| Service | 11 | | yes |
| Node | 10 | 1 | yes — patched by G8 (no consumer creates one) |
| Pod | 7 | 3 | yes |
| Secret | 6 | 2 | yes — created, patched and deleted by G16 |
| DaemonSet | 4 | | yes — G6 |
| CronJob | 4 | | yes — G6 |
| Namespace | 3 | 8 | yes — created and deleted by G13 |
| RoleBinding | 2 | | yes — G6 |
| PersistentVolume | | 4 | yes — G6 |
| PersistentVolumeClaim | | 3 | yes — G6 |
| NetworkPolicy | | 3 | yes — G6 |
| ConfigMap | | 2 | yes — created and deleted by G13 |

This matters more here than it would on `master`: strict response validation
checks each kind's schemas independently, and **two of the eight patch rules were
found exactly this way** (`*/*` request bodies on `put!`, DELETE 2xx on
`delete!`). Each untested kind is an unexercised set of schemas.

Each kind is taken through the four paths that have distinct schemas — create,
a `get` once the controller has written a status, a `list` with the object still
in it, and delete — because a `get` issued straight after `put!` decodes an
empty status block and checks almost none of the kind's schema. Nothing
schedules a workload (`replicas: 0`, a `nodeSelector` no node carries,
`suspend: true`), which also keeps the concurrent `:Pod` watch's assertions
clean. Two group modules — `rbac.authorization.k8s.io/v1` and
`networking.k8s.io/v1` — had never been reached live at all before this.

The fixtures copy the real consumer templates, with two deliberate departures:
the RoleBinding points at a Role that does not exist rather than reproducing
JuliaRun's `ClusterRole/admin` grant (RBAC permits a dangling `roleRef`, so the
schema is identical), and the NetworkPolicy selects a label no pod carries
rather than using JobLoops' empty selector, which is deny-all-ingress for the
namespace and would be a live hazard on a cluster whose CNI enforces.

**Result: seven kinds, no new patch rule.** Given that two of the six existing
rules were found by submitting a kind for the first time, the plausible outcome
was a seventh — and that would have meant a full regeneration rather than a
testset. Every one of these kinds round-tripped under strict response validation
unchanged, across four group modules. That is evidence about the *patch set*,
not just about these kinds: the rules generalise past the handful of kinds they
were derived from.

Two forms fell out of this that are verb-layer coverage rather than schema
coverage: `get(ctx, :DaemonSet; label_selector=…)` with no name — the shape
`JuliaRun/src/kubernetes/api.jl:993` and `provisioning.jl:110` use, which
resolves to the *list* operation and answers with a `…List` — and the `:cluster`
scope fallback for a cluster-scoped kind other than Namespace
(PersistentVolume).

#### G7. Secret round-trip

- [x] Test base64 `data` / `stringData` through the new codec.
      **Done 2026-08-14**: `secret_round_trip` in `test/runtests.jl`.

`JuliaRun/src/kubernetes/api.jl:220-248` builds Secrets with `data`, and the
values it puts there are raw `Vector{UInt8}` — `_as_binary_secret`
(`api.jl:203-214`) base64-*decodes* anything that looks base64 before handing it
over, so what reaches Kuber is always bytes. The 0.2.x client base64-encoded
them onto the wire because the field is `format: byte`; the 1.0 runtime does the
same in both directions.

**The values survive the port unchanged. The container does not.** `data` is an
open struct now, so `Secret(; data=bindata)` has to become
`Secret(; data=SecretData(additional_properties=bindata))` — the same
[G12](#g12-resource-limits-are-an-open-struct)-class change, on the one field
where the payload is binary.

The test writes bytes that are deliberately not valid UTF-8
(`0x00 0xff 0xfe 0x01 0x80`), so a round trip that "works" by treating the value
as text cannot pass it. Two behaviours it pins that are easy to guess wrong:

- **`stringData` is write-only.** The apiserver folds it into `data` and never
  returns it, so a consumer that writes it must not expect to read it back.
- **A merge patch merges the map, it does not replace it.** RFC 7386 merges key
  by key; only an explicit `null` removes a key. Patching `data` with just
  `token` leaves `binary` and `plain` intact. *This was asserted the wrong way
  round first and the live run corrected it* — worth recording, because the
  wrong guess is the dangerous direction only in reverse: believing it merges
  when it replaced would silently drop every other secret in the object.
  `update_secret` sends the whole desired map anyway, so it is unaffected either
  way.

See also [G12a](#g12a-secretdata-decodes-to-bytes-not-base64-text) for the read
side: what comes back is already-decoded bytes, so the 0.2.x
`String(base64decode(v))` idiom now decodes twice and yields rubbish rather than
an error.

#### G8. Node and Namespace as cluster-scoped writes

- [x] Cover a cluster-scoped create/delete. **Done 2026-08-14** across three
      testsets: Namespace by `create_delete_from_dicts` (G13), PersistentVolume
      by `create_delete_more_kinds` (G6), and Node by `cluster_scoped_writes`.

Both appeared in the live suite only as reads; JobLoops creates Namespaces
(`services/JobLoops/src/hot_standby.jl:526`).

**Node is not a create/delete, and should not be tested as one.** No consumer
creates a Node: the monorepo's `set_node_label`, `set_node_cordon` and
`taint_update_patch` all patch an existing one. Creating a Node object through
the API works, but it would be testing an operation nobody performs *and*
leaving a kubelet-less `NotReady` node on the cluster for metrics-server and the
scheduler to trip over. So the testset patches a real node and puts it back,
in the two shapes consumers send:

- a **merge patch** setting a label, then an explicit `null` removing it. That
  pins the complement of what [G7](#g7-secret-round-trip) found: unmentioned
  keys survive a merge patch, and `null` is the only way to delete one.
- a **json-patch whose value is a nested array of dicts** — `taint_update_patch`'s
  shape — appending via `/spec/taints/-` rather than replacing `/spec/taints`,
  so the node's existing taints are untouched. A control-plane node carries one,
  and dropping it would be a live change to the cluster rather than a test.

The taint is `PreferNoSchedule` and nothing cordons, because the rest of the
live suite schedules pods on that same node.

Reading a Node by name also exercises the `:cluster` scope fallback for a kind
that is neither Namespace nor PersistentVolume: `ctx.namespace` is `default`, and
the request still goes to `/api/v1/nodes/<name>` because the `:namespaced`
lookup falls through.

### Data-shape gaps

#### G9. Open-struct labels and annotations on write

- [x] `put!` with labels, read them back off the server.
      **Done 2026-08-14**: the G9 block of `data_shapes` in `test/runtests.jl`.

`test/helpers.jl:73-89` covers `kuber_props` on a hand-built object. Nothing covered
the round trip, nor the `services/JobLoops/src/networkpolicy.jl:114` pattern
(`labels["version"]`, which now needs `kuber_props`).

The round trip carries labels, annotations and `data` on one ConfigMap, and
reads each back with `kuber_props`. The assertion that earns its place is the
negative one: `Kuber._field(metadata.labels)` is **not** an `AbstractDict`, and
indexing it the 0.2.x way is a `MethodError`. That is the shape of the
`networkpolicy.jl:114` break — a hard failure at the read, not a wrong answer.

#### G10. `resource_version=` on a list or get

- [x] Test the live "not older than" read.
      **Done 2026-08-14**, and it found that the keyword does nothing. The
      *fix* is [G17](#g17-resource_version-is-accepted-and-ignored-on-non-watch-reads);
      this box covers the test that pins the behaviour.

`packages/K8sReflector/src/K8sReflector.jl:136-141` passes it to `Kuber.get`. The
`_op_kwargs` translation is unit-tested; the live behaviour was not — and the live
behaviour turns out to be that the parameter never reaches the server on a
non-watch read. The test asserts the trap rather than the intent: the same
impossible resource version errors when passed as `resourceversion=` (the
generated spelling, a real query parameter) and succeeds when passed as
`resource_version=` (the documented spelling, which is dropped).

#### G11. `.items` and `metadata.resourceversion` off a real list

- [x] Assert the consumer-facing shape of a live list result.
      **Done 2026-08-14**: the G11 block of `data_shapes`.

`_resource_version` was tested on synthetic dicts and objects; live list results
were asserted only as `isa …List`. Now: `hasproperty(result, :items)` — the guard
`provisioning.jl:111` actually uses — `items` a `Vector` of the item type and
non-empty (the test creates into the collection first, so the assertion means
something), `_resource_version(result)` a non-empty `String` equal to
`result.metadata.resourceversion`, and a per-item resource version for every
item, which is what `K8sReflector.jl:12` keys its store on.

#### G12a. `Secret.data` decodes to bytes, not base64 text

- [x] Sweep consumer reads of `Secret`/`ConfigMap` binary data.
      **Done 2026-08-14.** One real site, below.
- [ ] Fix `JuliaRunPool.jl:135-136` in the monorepo — not a Kuber change.

*Found 2026-08-14 while testing G16's typed-model patch.* `Secret.data` values are
`format: byte` in the OpenAPI document, and the 1.0 runtime decodes those to
`Vector{UInt8}` — already base64-decoded. A consumer that does
`String(base64decode(secret.data["x"]))`, the natural 0.2.x idiom, now decodes
twice and gets rubbish rather than an error. `String(copy(v))` is the new form.

**The sweep found one site, and it fails silently.**
`packages/JuliaRunPool/src/JuliaRunPool.jl:135-136`:

```julia
existing_data = get(get(existing_secret, "data", Dict()), ".dockerconfigjson", "")
if existing_data == dockerconfigjson
```

`existing_secret` comes from `JuliaRun.get(ctx, :Secret, secret_name)`, so it is
a typed model — `Base.get(model, "data", …)` has no method, on this branch or on
`master`. Past that, the comparison is against `dockerconfigjson`, the
**base64-encoded** config from JuliaHub's config file. On 0.2.x `Secret.data`
came back as base64 text and that comparison was right; here the value is a
`Vector{UInt8}` of *plaintext*, so it can never equal a base64 `String`. The
branch's purpose is to skip a redundant write, so the failure is not an error —
the image-pull secret is rewritten on every namespace creation, forever. The file
even carries a comment reasoning correctly about the *write* side while the read
side compares the wrong things.

The form that works:

```julia
existing = Kuber.kuber_props(existing_secret.data)
existing_data = get(existing, ".dockerconfigjson", UInt8[])
if String(copy(existing_data)) == dockerconfigjson_decoded
```

**Everything else is clear.** All five `base64decode` sites in `JuliaRun` are
kubeconfig parsing (`utils.jl:71`, `utils.jl:104`), env packing (`api.jl:493`),
or the *write* side (`api.jl:208`, `_as_binary_secret`, which G7 confirms still
works). In the monorepo, `kill_k8s.jl:33` and `monitoring_loop.jl:442-445` read
base64 blobs out of the **database** via `db_get_job_envsecrets`, not off a
Kubernetes Secret, so Kuber's codec never touches them.

#### G12. Resource limits are an open struct

- [x] Test `kuber_props` on `resources.limits` / `.requests`.
      **Done 2026-08-14**: the G12 block of `data_shapes` in `test/runtests.jl`.
- [ ] Fix `clustermgmt.jl:186-194` and `:281-285` in JuliaRun — not a Kuber
      change. Two breaks, one of them silent.

`ResourceRequirements.limits` is `IoK8sApiCoreV1ResourceRequirementsLimits`,
whose only field is
`additional_properties::Dict{String,IoK8sApimachineryPkgApiResourceQuantity}`, so
`limits["cpu"]` must become `kuber_props(limits)["cpu"]`.

*(An earlier revision of this item named the type
`IoK8sApiCoreV1ContainerResourcesLimits`. That was accurate when written:
`Container.resources` was a positional copy of `ResourceRequirements`, so its
maps were named after the copy. Patch rule §7 collapsed those, so `resources` is
now the shared type across every kind that embeds a pod template — one fewer
thing for a consumer to get wrong.)*

Quantity itself is fine: still a struct with a single `value` field
(`Union{Float64,String}`), so JuliaRun's `string(cpu.value)`
(`src/kubernetes/api.jl:1841`) and `conv_units(::Typedefs.CoreV1.Quantity)`
(`src/kubernetes/clustermgmt.jl:20`) survive structurally. Only the type
*identity* differs, which is C1's problem.

**The audit found two breaks in `clustermgmt.jl`, and the quieter one is worse.**

```julia
# :186-194  — container_resource
if hasproperty(cont, :resources)
    resources = cont.resources
    if hasproperty(resources, :requests)
        return resources.requests
    elseif hasproperty(resources, :limits)
        return resources.limits
    end
end

# :281-285  — the caller
("cpu" in keys(res)) && (nodestate.cpu.free -= conv_units(res["cpu"]))
```

The loud one is `keys(res)` and `res["cpu"]`: `res` is an open struct, so both
are `MethodError`s. Mechanical to fix with `kuber_props`.

The quiet one is `hasproperty`. On 0.2.x an unset field was missing or `nothing`;
on 1.0 **every field exists** and an unset one is `ABSENT`. So
`hasproperty(resources, :requests)` is now *always* true, and
`container_resource` returns `ABSENT` for a container that declares only
`limits` — it never reaches the `elseif`. The caller's `res === nothing` guard
does not catch `ABSENT`, so scheduling arithmetic would run against it. The test
covers the Kuber-side shape; this one needs `Kuber._field`-style checks at the
call site, and it is the pattern to grep for across both consumers rather than a
single line to fix.

That pattern is also why C2 is bigger than its table says — see the
`getpropertyat`/`haspropertyat` row added there.

#### G13. `put!(ctx, O::Symbol, dict)` — the dominant consumer form — is untested

- [x] One testset. Highest value per line of test code in this document.
      **Done 2026-08-14**: `create_delete_from_dicts` in `test/runtests.jl`, run
      in both live passes.

The testset is modelled on `hot_standby.jl` rather than written from scratch: the
namespace dict is that file's literal shape, and the deployment comes from
`JSON.parse`, which is what a rendered template actually produces. It covers the
cluster-scoped and namespaced cases, that nested arrays and string maps survive
the round trip, that the `apiVersion` comes off the dict rather than off
discovery, and the kind-completion path (a dict with no `"kind"`, which Kuber
fills in from the symbol without mutating the caller's dictionary).

**Writing it turned up why the wider signature is load-bearing rather than
incidental.** On JSON.jl 1.x `JSON.parse` returns a `JSON.Object`, which is an
`AbstractDict` but not a `Dict`. `master`'s three methods are
`v::T<:OpenAPI.APIModel`, `v::Dict{String,Any}` and `v::T<:OpenAPI.APIModel`
again — all narrow — so a parsed template matches none of them and
`put!(ctx, :Deployment, spec)` is a `MethodError`. `master` allows JSON 1 in
`[compat]`, so that is a live hazard there, not a hypothetical. This branch takes
`v::AbstractDict`, which covers both. The two cases in the testset are now
deliberately different shapes: a plain `Dict` for the namespace, a `JSON.Object`
for the deployment.

Two smaller improvements over `master` in the same method, worth keeping: it
reads `haskey(v, "kind")` rather than `v["kind"]`, which on `master` is a
`KeyError` when the key is absent — the very case the code is trying to handle —
and it merges into a fresh dictionary instead of writing `"kind"` into the
caller's.

Trial tests only ever call the 2-arg model form (`put!(ctx, nginx_pod)`).
`services/JobLoops/src/hot_standby.jl:526,541,545` uses
`Kuber.put!(ctx, :Deployment, spec)` and `(ctx, :Namespace, …)`. The signature
exists and is in fact *wider* than master's (`v::AbstractDict` vs
`Dict{String,Any}`, plus an untyped fallback at `src/simpleapi.jl:476`), so this is
a coverage gap rather than a break — and it is the shape most production writes go
through.

### Error and retry paths

#### G14. Live retryable statuses

- [x] Exercise a real 429/503/504, and retries interacting with a watch establish
      failure. **Done 2026-08-14**: `test/retries.jl`, in `runtests.jl`.

`k8s_retry_cond` was characterized offline only, by
`test/characterize_retries.jl`, which pins the *exception types* the runtime
raises, is not in `runtests.jl`, and never drives the retry loop.

**A live 429 or 503 is not the way to get one.** Provoking real load-shedding
from an apiserver is neither reliable nor cheap, and the interesting variable is
the status, not the cluster. `test/retries.jl` uses a server that always fails
with a chosen status and counts requests, so "retried" is the difference between
one request and several rather than something inferred from timing. Offline and
deterministic.

Measured, with HTTP.jl's own retry layer switched off so the count reflects
Kuber's loop alone (`max_tries=3`):

| Status | Requests | `is_retryable` |
|---|---|---|
| 500, 502, 503, 504 | 4 | yes |
| 429 | 1 | no — see [G19](#g19-429-is-not-retried) |
| 404, 409, 422 | 1 | no |

Two things fell out of writing it, both shared with `master`:
[G19](#g19-429-is-not-retried) and
[G20](#g20-http-jl-retries-underneath-kuber-so-max_tries-does-not-bound-requests).

#### G19. 429 is not retried

- [x] Add 429 to `k8s_retryable_codes`, ideally honouring `Retry-After`.
      **Done 2026-08-14**: both, `src/helpers.jl`; covered by `test/retries.jl`.

Kubernetes' priority-and-fairness layer sheds load with **429 plus a
`Retry-After` header**, and client-go retries it. `k8s_retryable_codes` is
`[0, 500, 501, 502, 503, 504]` — on this branch *and* on `master` — so a
throttled call fails immediately instead of backing off. A busy cluster
therefore surfaces errors to consumers that client-go would have absorbed.

**Fixed, together with G20, because the two only make sense together.** Before
G20, HTTP.jl retried 429 underneath anyway, so the observable behaviour was
"retried, but not by Kuber, not with `Retry-After` honoured, and not counted by
`max_tries`" — worse than either answer taken alone. With HTTP.jl's layer off,
Kuber's list is the whole story, so 429 had to join it.

`Retry-After` is honoured as a *floor* on the backoff: it only ever lengthens a
wait. Three deliberate limits, all in `_retry_after`:

- **429 only.** A 5xx may carry the header too, but honouring an arbitrary
  server-supplied delay on every transient failure changes the timing of every
  retry in the client. 429 is where the server is deliberately pacing us.
- **Capped at 30 s** (`RETRY_AFTER_CAP`), so a large or hostile value cannot
  park a call indefinitely.
- **Delta-seconds only.** `Retry-After` may also be an HTTP date, which
  Kubernetes does not send; `tryparse` returns `nothing` for one and the backoff
  is used instead, which is the safe direction.

Honouring the header is why `k8s_retry` is now an explicit loop rather than
`Base.retry`: `Base.retry` takes its delays from an iterator that never sees the
exception, so the server's own pacing is unreachable from it.

#### G20. HTTP.jl retries underneath Kuber, so `max_tries` does not bound requests

- [x] Either set `retry=false` and own retrying entirely, or document the
      multiplier. **Done 2026-08-14**: Kuber owns it. `_call_options` sets
      `retry=false` on every call, and `max_tries` now counts attempts.

Kuber's `k8s_retry` is not the only retry loop in the stack: HTTP.jl 2.x retries
idempotent requests on a retryable status by default. Measured at this pin,
against a server that always answers 503:

| `max_tries` | Requests, HTTP.jl retry on | Requests, `retry=false` |
|---|---|---|
| 1 | 10 | 2 |
| 2 | 15 | 3 |
| 3 | 20 | 4 |

Each Kuber attempt cost five HTTP requests, so `set_retries(ctx; count=5)`
against a struggling apiserver was thirty requests, not six, with both backoffs
composing.

**`max_tries` was also off by one.** `k8s_delay` built
`ExponentialBackOff(n=max_tries)` and `Base.retry` performs `n` retries *on top
of* the first attempt, so `max_tries=1` was two requests. Mutating calls take
`retries(ctx, true) == 1`, so **a `put!` whose first attempt failed with a 5xx
was retried once** — not what "only non-mutating calls retry by default"
implies, and the direction that risks a duplicate create. `master` computes the
delays identically, so none of this was new; none of it was written down either.

**Resolved by having Kuber own retrying.** `_call_options` merges
`retry = false` into every call's options, so HTTP.jl's layer is off unless a
caller puts it back with `set_request_options(ctx; retry=true)`. Kuber already
has a curated policy — a status list, a mutating-vs-not rule, `is_retryable` as
its public face — and HTTP.jl's layer silently contradicted all three. Now
`max_tries` is a budget of *requests*, which is what it reads as.

`k8s_delay` clamps to `max(0, max_tries - 1)` delays, so `max_tries` counts
attempts. Two consequences worth stating, because both are visible:

- `default_retries = 5` is now **5 attempts, not 6**. A small reduction.
- a mutating call is now **1 attempt, not 2**, which is the contract
  `set_retries(all_apis=false)` always claimed.

The option is set in `_call_options` rather than on the context because the
context's `client_kwargs` are passed to the generated `Client` constructor,
which takes no `retry` — putting it there is a `MethodError` on the first call.

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

- [x] Enumerate the patch types and kinds JobLoops actually patches, then test
      them. **Done 2026-08-14** — and the enumeration found a break, now
      [C8](#c8-json-patches-did-not-encode-at-all).

The enumeration, across both consumers:

| Caller | Media type | Patch shape | Kind |
|---|---|---|---|
| `julia_parallel_scale` | json-patch | `Vector{Dict{String,Any}}`, 1–2 ops | Job, Deployment |
| `taint_update_patch` | json-patch | vector whose `value` is a nested vector of dicts | Node |
| `julia_update_job` | json-patch | vector whose `value` is a pod template | Deployment |
| `hot_standby.jl:428` | json-patch | `Vector{Dict{String,Any}}` | Deployment |
| `set_node_cordon` / `set_node_label` | merge-patch | parsed JSON object | Node |
| `api.jl:252` | merge-patch | a **typed model** (`Secret`) | Secret |
| `networkpolicy.jl:142` | json-patch | JSON **text** of an object — see [C9](#c9-a-live-defect-in-jobloops-found-in-passing) | NetworkPolicy |

So json-patch is the *majority* shape in production, and it was exactly the one
that could not encode. The live suite now patches a Deployment with a
single-operation and a two-operation json-patch, with JSON text, with a strategic
merge patch, and a Secret with a typed model; `test/simpleapi.jl` covers the
per-media body types offline, including the nested-vector taint shape and that
the object model still refuses an array.

*Noted 2026-08-14 while writing [G13](#g13-putctx-osymbol-dict--the-dominant-consumer-form--is-untested):*
`hot_standby.jl:419-434` scales a deployment with
`application/json-patch+json` and a **`Vector` of operation dictionaries**
(`[Dict("op" => "replace", "path" => "/spec/replicas", "value" => n)]`), not a
dictionary. That is a different body shape from the merge patch the suite
covers, and `OP_BODIES` says a patch body has to be built as the generated
`Patch` type, so whether a bare vector survives that path is exactly the thing
to test first here.

#### G17. `resource_version=` was accepted and ignored on non-watch reads
<!-- Behaviour change, deliberately split out of G10's test. -->

- [x] `list` — forward `resource_version` to the operation's `resourceversion`
      parameter on the non-watch path. **Done 2026-08-14**, `src/simpleapi.jl`;
      the G10 testset now asserts the forwarding instead of the trap.
- [x] `get` — a patch rule declaring the parameter k8s omits.
      **Done 2026-08-14**: `patch_k8s_spec.jq` §8 plus the same forwarding in
      `get`. Held back until G19/G20 were settled; see below for why.

*Found 2026-08-14 while writing [G10](#g10-resource_version-on-a-list-or-get).*
`list` and `get` both take a `resource_version` keyword, and on the non-watch
path neither sends it: `if !watch || resource_version === nothing` computes the
result without ever putting it on the wire. It is consulted only to seed a
watch.

**`master` does exactly the same** (`git show master:src/simpleapi.jl`, the same
guard in all four verbs), so this is a shared limitation rather than something
the port broke — which is why it is not a blocker, and why the test that found
it ticks G10 rather than failing.

Two halves, with quite different costs:

- **`list` was a one-line fix, and is done.** The generated list operations
  declare `resourceversion` (and `resourceversionmatch`), so the parameter
  existed and worked — `list(ctx, :Pod; resourceversion="0")` reached the server
  already. Only the documented spelling was dropped, and the trap was that the
  two spellings differ by one underscore with one of them silently doing
  nothing. `list` now forwards it on the non-watch path; inside a watch
  `resource_version` still means "resume from here" and is consumed by the pump,
  which is a different thing and stays that way.
- **`get` could not be fixed by forwarding — it needed a patch rule, and now has
  one.** k8s's document declared only `pretty` on read operations, no
  `resourceVersion`, even though the apiserver honours it. *Verified against a
  live cluster:* `GET …/configmaps/x?resourceVersion=0` answers 200, and an
  impossible version answers **504 "Too large resource version"**. So the
  omission was a documentation bug in the same class as the other rules.

  **It was held back until G19/G20 were settled**, and that sequencing was the
  point. Rules 1–7 make the document describe what the server already does with
  requests Kuber already sends; this one changes which requests Kuber can
  *construct*, and its natural failure is a 504 that blocks for the apiserver's
  wait. While `max_tries=1` still meant ten requests, adding it would have
  stacked two unknowns. With the retry budget real, it is one.

  §8 adds the parameter only to paths ending in `{name}` — the object read
  itself, not subresources like `pods/log`, where a resource version is
  meaningless. The live test asserts an impossible version now answers 504
  through `get`, which is what proves the rule reached the wire rather than just
  the document.

  The alternative considered and not taken: routing a versioned single read
  through the list operation with a `metadata.name` field selector, which
  `get`'s watch path already does for its own reasons. That works without a
  patch rule but makes a read cost a list, and leaves the document still lying.

This mattered to `K8sReflector`, which passes `resource_version` to `Kuber.get`
(`K8sReflector.jl:136-141`) to re-read at a known version. That call had never
done what it reads as — on either branch — and now does. The live suite asserts
that exact shape: read, keep the version, read again not older than it.

#### G18. List items are a different type from the standalone object
<!-- A regression from master. Needs a decision: patch rule + regeneration. -->

- [x] Add a seventh patch rule collapsing the `allOf` wrapper, and regenerate.
      **Done 2026-08-14**: `patch_k8s_spec.jq` §7. It reached much further than
      list items — see below.

*Found 2026-08-14 while writing [G11](#g11-items-and-metadataresourceversion-off-a-real-list),
by an assertion that looked too obvious to fail.*

```julia
item = list(ctx, :Pod; namespace="kube-system").items[1]
typeof(item)                            # IoK8sApiCoreV1PodListItemsItem
item isa Kuber.kind_to_type(ctx, :Pod)  # false
```

**On `master`, `PodList.items` is `Vector{IoK8sApiCoreV1Pod}`** — the same type
as a standalone Pod — so this is a regression, not an inherited quirk. It
applies to **every list kind in every group module**, checked on `PodList`,
`ServiceList`, `NamespaceList`, `SecretList`, `ConfigMapList` and
`DeploymentList`.

**Cause.** The k8s document writes the element schema as an `allOf` wrapper with
a sibling keyword rather than a bare reference:

```json
"items": {"allOf": [{"$ref": "#/components/schemas/io.k8s.api.core.v1.Pod"}],
          "default": {}}
```

A `$ref` with siblings is a *new* schema, so the generator mints one and names
it after its position. The `"default": {}` is meaningless on an object
reference, which puts this in exactly the same class as the six existing patch
rules: the document says something it does not mean.

**What still works, and what does not.** Field names are identical and the
nested types were shared (`item.spec` was `IoK8sApiCoreV1PodSpec2`, the same
type the standalone Pod's `spec` had), so every *read* through a list item
behaved correctly — which is why G6, G13 and G4 all passed without noticing. What breaks
is type identity:

- `isa(x, kind_to_type(ctx, :Pod))` — `JuliaRun/src/kubernetes/api.jl:1418`
  compares `Tw === Kuber.kind_to_type(cm.ctx, "ReplicaSet")` on an object that
  came out of a list.
- any consumer signature typed on a generated model that is fed from a list.
- `kuber_kind(item)` is `""`, so the object forms of `delete!`/`update!` reject a
  list item (`ArgumentError: kind must be specified`). This half is **not** a
  regression — k8s never populates `kind` on list items, and master read the
  same absent field — but it is worth knowing, because "list it, then delete it"
  is an obvious thing to write.

**The fix reached much further than list items.** k8s never writes a bare
`$ref` for *any* property — the `allOf` wrapper is how it hangs a `description`
beside one, because a `$ref` with siblings is undefined in OAS 3.0. So the
generator was minting a type per use site everywhere, not just under `items`:

- `Pod.spec` was `IoK8sApiCoreV1PodSpec2` — the `2` disambiguating it from the
  real `PodSpec` component, **which nothing referenced**.
- every kind had its own `…Metadata` instead of the shared `ObjectMeta`.
- every `…List.items` had its own element type, which is the symptom G11 hit.

1290 sites across the 18 documents, in exactly two positions: property schemas
and the `items` of array properties. The result:

| | Before | After |
|---|---|---|
| generated types | 2252 | **1098** |
| `src/ApiImpl/generated/` | 24 MB | **18 MB** |

Two things about the rule worth keeping:

- **It is scoped to those two positions, not walked recursively.**
  `apiextensions`' `JSONSchemaProps` describes JSON Schema itself, so it has
  *properties named* `allOf`, `nullable` and `items`. A recursive walk rewrites
  that map and silently corrupts the CRD document.
- **It is guarded on shape** — a single-element `allOf` whose element is a bare
  `$ref` — rather than on the survey that said every `allOf` looks like that. A
  future spec bump that introduces a two-element `allOf`, or a `$ref` carrying
  siblings, is left alone to be noticed.

`test/registry.jl` gates it on type *identity* across four kinds in three group
modules (`fieldtype(Pod, :spec) === PodSpec`, `eltype(PodList.items) === Pod`),
plus no name ending in `ListItemsItem` surviving anywhere. A collapse that
produced an alias per use site would shrink the diff by as much and still be
wrong.

The `kuber_kind(item) == ""` half is unchanged and unfixable here: k8s does not
populate `kind` on list items, so the object forms of `delete!`/`update!` still
reject one. The live suite now asserts that too, so "list it, then delete it"
fails loudly rather than surprisingly.

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
5. Widen the live suite, cheapest first: ~~**G13**~~, ~~**G4**~~, ~~**G6**~~,
   ~~**G9/G10/G11**~~, ~~**G2**~~ and ~~**G3**~~ all done. **G16** is done too,
   and turned into [C8](#c8-json-patches-did-not-encode-at-all); **G10** turned
   into [G17](#g17-resource_version-is-accepted-and-ignored-on-non-watch-reads),
   which needs a decision before it can be scheduled.

   **The watch-contract cluster — the one flagged highest-risk — is now closed**
   (G1–G4 all ticked), except for the reflector port under G2 and the
   deliberately-deferred G5. What is left in Part 2 is the cheap remainder:
   ~~G7~~, ~~G8~~, ~~G14~~ and ~~G12/G12a~~ done; only G5 remains, and it is
   deferred. Both G12 items produced consumer fixes rather than Kuber ones, and
   G12's audit is what surfaced the `getpropertyat`/`haspropertyat` gap in
   [C2](#c2-openapiclients-does-not-exist-in-openapijl-10).
6. **C1d** deferred until a CRD actually needs addressing.

7. ~~**G18**~~ and ~~**G17**~~ done. One regeneration carried G18 and G17's
   `list` half; G17's `get` half followed after G19/G20, as patch rule §8. The
   sequencing was the point: §8's natural failure is a slow 504, which was worth
   nothing while `max_tries=1` still meant ten requests.
8. ~~**G19** and **G20**~~ done together, which was the only way they made
   sense: with HTTP.jl's layer off, Kuber's status list became the whole story,
   so 429 had to join it. Settling them is what unblocked G17's `get` half.

**Everything in Part 2 is now closed except G5** (long-lived watches, deferred
as probably untestable in CI) **and G12/G12a**, which are consumer-side audits
rather than Kuber changes. What remains is Part 1: the C-items, all of which are
work in the consumer repos except C1b/C5's one capture, which needs a cluster
running a metrics adapter.

Four of the five widening items produced a finding rather than just coverage
(C8, G12a, G17, G18), which is the argument for continuing to spend on the live
suite: what it buys is not the assertions, it is what writing them turns up.
G6 is the counter-example and a useful one — seven new kinds, no new patch rule.
G18 is the sharpest case: it was found by an assertion too obvious to be worth
writing, in a testset whose stated purpose was to check something else.

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
