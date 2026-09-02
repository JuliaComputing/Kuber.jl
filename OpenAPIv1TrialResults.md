# Kuber.jl on OpenAPI.jl 1.0 — trial branch results

**Status: implementation record, written 2026-08-13.** What the
`openapi-v1-trial` branch actually does, where it departs from
[`OpenAPIv1TrialBranchPlan.md`](OpenAPIv1TrialBranchPlan.md) and why, the
measured numbers §6 asks for, and what is left. Read this alongside the plan:
the plan is the design, this is the outcome. Where they disagree, this file is
current.

Built against OpenAPI.jl `1ff9ba8` (`quinnj/OpenAPI.jl`, branch
`codex/production-rewrite`), Kubernetes v1.35.4 specs, verified live against a
k3s v1.35.4 cluster through `kubectl proxy`. Local runs were all on **Julia
1.12.6**; the 1.11 floor in `[compat]` was exercised by CI (run 31701082665) and
holds, as does nightly.

CI's cluster version is load-bearing, which it was not on the 0.2.x line. The
first run inherited `master`'s kind pin (`v0.11.1`, node image
`kindest/node:v1.21.1`) and failed one assertion — a 1.21 apiserver prefers
`autoscaling/v1`, so discovery cannot fill `ctx.apis[:Autoscaling][1]` with the
v2 module — while all 3824 offline assertions passed unchanged. The workflow now
pins kind `v0.32.0` with the `v1.35.5` node image, matching the spec tag. Any
future spec bump has to move that pin with it.

## 1. Deviations from the plan

Every one of these came out of implementation or measurement, not preference.

### 1.1 Five patch rules, not three (plan §2.2)

The plan's three nullable rules are all present. Two more were needed, both
found by exercising verbs the evaluation never had — it only ever listed and
watched:

4. **`*/*` request bodies → `application/json`.** k8s documents `*/*` for every
   create/replace body. No client can encode to that: the runtime has no `*/*`
   encoder, and would send `Content-Type: */*` if it had one. We always send
   JSON and k8s always accepts it, so saying so makes the document true.
5. **DELETE 2xx responses → the empty schema.** k8s documents `Status`, but a
   delete usually answers with the deleted object. Verified live: deleting a Job
   returns the Job, deleting a Deployment returns a Status — *both* shapes occur,
   which is the ambiguity the old client's `get_return_type` sniffing hid.
   `oneOf: [Status, resource]` was tried and rejected: the generator emits one
   wrapper type per response code per media type (eight for a single delete).
   The empty schema states what is actually true, and `delete!` restores the type
   from the payload's `kind`/`apiVersion` through `KIND_TYPES` — the same
   second-stage decode watch frames use.

Strict generation and strict response validation stayed on throughout. There is
no `validate_responses=false` anywhere in `src/`.

### 1.2 `OPS` is keyed by module, and two tables were added (plan §2.4)

`OPS::Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}` — `(module, verb, kind,
scope)`. The plan's 3-tuple cannot express two shipped versions of one kind, and
the trial ships two: `autoscaling/v1` and `autoscaling/v2` both define
`HorizontalPodAutoscaler`. Callers still resolve the module first (from the
`apiversion` kwarg or `ctx.modelapi`) exactly as before, so the resolution flow
is unchanged.

Two tables the plan does not mention:

- **`OP_PARAMS`** — positional argument names per operation. Generated
  positional order is *path* order, so the namespace comes **first**
  (`readcorev1namespacedpod(namespace, name)`) and a required body last. That is
  the reverse of the old client, and worth having as build-time data rather than
  a rule each call site re-derives.
- **`OP_BODIES`** — body type plus documented request media types, for
  operations with a required body. `update!` needs both: a patch body must be
  built as the generated `Patch` type (an open object, so a `Dict` cannot be
  passed through), and k8s documents only the five patch media types — there is
  no plain `application/json` for a PATCH.

Two things the emitter learns from the specs rather than assuming:

- **Subresource kinds come from the parent resource's path**, not the
  operation's own `x-kubernetes-group-version-kind`, which on a subresource names
  the *subresource's* type (`pods/exec` is `PodExecOptions`, `pods/eviction` is
  `policy/v1 Eviction`). Parent kind plus capitalized subresource reproduces the
  operationId tails exactly — which is how `:PodLog` (plan §5.4) reaches the
  table through the generic path instead of as a special case.
- **Generated identifiers are read off the planner**, not recomputed. The naming
  rules normalize non-identifier characters, dodge Base/Core and reserved names,
  and disambiguate collisions with a counter. A hand-rolled version got
  `io.k8s.apiextensions-apiserver...` wrong on the first attempt and would have
  drifted silently later.

### 1.3 The watch loop is shaped by the runtime, not the plan (plan §4.3, §5.3)

`test/characterize_retries.jl` exists to pin the runtime's exception types
before `k8s_retry_cond` was written, as §4.3 asks. Three of its findings
contradict the plan:

| Plan says | Actually |
| --- | --- |
| retry transport failures "when the watch stream is still open, exactly mirroring today's `isopen(stream)` guard" | the guard left the retry path entirely. The watch call returns at the *response head*, so it can never be the in-flight call being retried; stop-vs-re-watch moved into the watch loop |
| 410 Gone is an `ApiError` | it is an **in-stream `ERROR` event** carrying `Status(reason=Expired, code=410)`; the HTTP status is 200 |
| a 410 becomes "a fresh list+watch" | the loop re-watches with **no** `resourceVersion`, which k8s answers with synthetic `ADDED`s for current state. Defensible and simpler, but no second List lands on the stream |

Because the call returns at the response head, `list`'s watch branch **pumps the
stream inline** and returns only when the watch is over. Delegating and returning
would close the stream immediately and yield zero events; pumping inline is what
keeps `watch(streamprocessor, ctx, list, O)` and both of its `finally
close(stream)` blocks working as they did under the 0.2.x client.

Recovery rules in the loop, all measured rather than assumed:

- the **consumer closing the public stream is the only stop signal** (#67/#68). A
  connection dropped on an item boundary closes *cleanly*, indistinguishable
  from a watch ending normally on `timeoutseconds`, so a clean close cannot mean
  "stop".
- a clean end **re-watches** from the last `resourceVersion` seen.
- a **truncated item** closes the channel with `DecodeError`; re-watch.
- a **connection aborted mid-chunk** — an apiserver restart or network drop, the
  one #68 shape a clean end does not stand in for — closes the channel with an
  HTTP.jl error (`ParseError: unexpected EOF while reading HTTP/1 data`).
  Recovering from `DecodeError` alone left the watch dead here; anything
  `k8s_retry_cond` accepts is now recovered from too.
- a stop takes effect within ~250 ms **regardless of traffic**. Without that, the
  pump only noticed a stop when the next frame arrived, which on a quiet resource
  left `watch()` hanging and kept the `@sync` alive after a processor died — the
  deaf watch #67 fixed.
- consecutive establishments that deliver **no events back off** 0.25 s → 8 s,
  reset by any delivered event. `k8s_retry` wraps only the *establish* call, so a
  server answering 200 and ending the stream empty is not a failure and nothing
  else throttled it — reachable with an unservable `resourceVersion` or a proxy
  dropping long connections, and it would have hammered the apiserver.

### 1.4 Smaller departures

- **`kuber_props`** was added. k8s string maps (`metadata.labels`,
  `metadata.annotations`) decode to a generated *open struct*, not a `Dict`, so
  indexing the field silently fails. Found the hard way: `watch_latency.jl`
  reported every MODIFIED event as MISSED because of it. Labels and annotations
  are far too common to make callers reach into `additional_properties`.
- **`kuber_type`** survives as `kuber_type(json)` — a payload→type lookup — rather
  than being deleted. `@K_str` is dropped, as planned.
- **Timeouts**: `set_timeout` sets HTTP.jl's `request_timeout`, and watch calls
  drop it (a watch has no meaningful overall deadline; k8s bounds one with the
  `timeoutseconds` query parameter). `set_request_options` passes anything else
  through.
- **Deps** are `Dates`, `HTTP`, `JSON`, `OpenAPI` plus the `Base64` and `UUIDs`
  stdlibs the generated modules import — the plan listed only `Dates`. `Random`
  was audited and is genuinely unused.

## 2. Measurements (plan §6 acceptance)

Julia 1.12.6, k3s v1.35.4 via `kubectl proxy`, 17 group modules (~24 MiB of
generated Julia).

| | |
| --- | --- |
| Package precompilation | **~22 s** |
| `using Kuber` (precompiled) | **0.36 s** |
| Discovery (`/api` + `/apis`) | **0.22 s** |
| **TTFX — first `list(ctx, :Pod)`** | **~15–16 s** |
| Steady-state `list(ctx, :Pod)` | **11.5 ms** (min of 6; 2 pods) |
| — of which response schema validation | **78 %** (strict 12.5 ms vs tolerant 2.8 ms) |
| First call into a second group module | **1.2 s** |
| Watch reaction time, after warmup | **5.6–11.2 ms** median, 0 missed |
| Generation: patch → generate 17 docs | **~29 s** |
| Registry emission | **~100 s** (plans the documents a second time) |

TTFX is the one number that stands out. It is first-call compilation of the
generated operation plus the validation engine, not I/O — precompilation absorbs
load time but not inference. A `PrecompileTools` workload over one list/get/watch
path would likely absorb most of it; that is a follow-up, not a trial fix.

### Test suite

`julia --project test/runtests.jl` — offline suites first, then the live
integration suite (skipped with a warning when no server is reachable;
`KUBER_TEST_SERVER` overrides the endpoint).

| Suite | Assertions | Needs a cluster |
| --- | --- | --- |
| `registry.jl` | 3639 | no |
| `helpers.jl` | 96 | no |
| `simpleapi.jl` | 59 | no |
| `watch_recovery.jl` | 32 | no (fake apiserver) |
| live integration | ~300 | yes |

Manual probes, not part of `runtests.jl`: `characterize_retries.jl` (rerun
whenever the OpenAPI pin moves) and `watch_latency.jl`.

Independent of Kuber, `gen/openapi_v1_prototype/k8spristine_v3.jl` passes 11/11
against the pinned OpenAPI, confirming upstream behaves as the evaluation
recorded. `smoke_groups.jl` was not rerun: it needs all 27 cluster-served group
documents captured and generated, and the trial's own 17 modules plus the live
suite cover the same ground.

### Expected diffs in the adapted test suite

- `batch/v1beta1` and `batch/v2alpha1` CronJobs, and the `apps/v1beta2` /
  `apiregistration.k8s.io/v1beta1` overrides, do not exist on a 1.35 server.
  `autoscaling` is now the group that serves one kind in two versions, so it is
  what exercises versioned typing and the `override` kwarg.
- `Typedefs.CoreV1.WatchEvent` → `KuberEvent`; `event.object` is already typed,
  so the `kuber_obj` round-trip is gone.
- `delete!` assertions compare `kuber_kind`, not the type: every group module has
  its own `Status` type, so a `batch/v1` delete can never be `isa` core's.
- the timeout test is rewritten against `request_options`; there is no
  `DEFAULT_TIMEOUT_SECS` to compare with, and unset means no deadline.
- the `killall kubectl` teardown is dropped — it worked around a libcurl segfault
  and Downloads.jl is gone.

## 3. Known limitations and follow-ups

Out of trial scope by decision (plan §0), unchanged:

- **Custom metrics** (`:MetricValue`, `list_custom_metrics`,
  `list_namespaced_custom_metrics`) throw a clear error. `custom.metrics.k8s.io`
  needs an OpenAPI v3 document captured from a cluster that serves it.
- **Aggregated APIs** (`metrics.k8s.io`) and **CRD groups** likewise: neither
  appears in upstream release-tag specs.
- **One k8s minor.** The multi-minor matrix and connect-time switching are a
  post-trial concern; the pipeline already supports adding groups and minors.

Found during the trial:

- **TTFX ~15 s** — a `PrecompileTools` workload is the obvious next step.
- **Response validation is 78 % of a steady-state list.** Correct and worth
  keeping for a trial, but a real cost to weigh for hot paths.
- **Shared meta types are per-module.** `Status`, `DeleteOptions` and
  `WatchEvent` exist separately in every group module, so cross-module type
  identity is impossible. `KIND_TYPES` resolves them by policy (own
  group-version, then core, then alphabetically first) and `kuber_kind` is the
  intended way to test them. If this bites downstream, the fix is upstream:
  hoisting shared schemas into one module.
- **Unframed streaming responses buffer until close.** Not an issue against a
  real apiserver (k8s uses `Transfer-Encoding: chunked`), but a proxy that
  stripped chunking would silently destroy watch latency.

## 4. Before this graduates

- [ ] PR JuliaComputing/OpenAPI.jl#103 merged and tagged; drop `[sources]`, set
      compat to the tag, and **regenerate everything** — generated output is
      byte-stable only within a pinned commit.
- [x] Verify on Julia 1.11 — done by CI, which also runs nightly green.
- [ ] Grep JuliaHub consumers for `=== nothing` checks on Kuber model fields
      (now `ABSENT`) and for `metadata.labels`/`annotations` indexing (now open
      structs).
- [ ] Verify against a token-auth cluster: the trial only exercised
      `kubectl proxy`, so the `headers`/`request_options` credential path is
      untested against real TLS and bearer tokens.
