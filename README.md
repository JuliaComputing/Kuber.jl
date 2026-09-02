# Kuber

[![Build Status](https://github.com/JuliaComputing/Kuber.jl/workflows/CI/badge.svg)](https://github.com/JuliaComputing/Kuber.jl/actions?query=workflow%3ACI+branch%3Amaster)

A Julia Kubernetes Client.

An easy to use API to access Kubernetes clusters from Julia. Under the verb API sits a complete generated client: one module per Kubernetes API group version in `Kuber.ApiImpl` (`K8sV1`, `K8sAppsV1`, `K8sBatchV1`, …), with every low level operation and model type.

[Supported API Versions](SupportedAPIVersions.md)

> ### ⚠ This is the `openapi-v1-trial` branch
>
> A trial rebuild of Kuber on [OpenAPI.jl 1.0](https://github.com/JuliaComputing/OpenAPI.jl/pull/103), pinned to an unmerged commit. See [the trial plan](OpenAPIv1TrialBranchPlan.md) and [the evaluation notes](OpenAPIv1RewriteNotes.md). Requires **Julia 1.11+**, HTTP.jl 2.x and JSON.jl 1.7+.
>
> What changes for callers of the verb API:
>
> - **Absent fields are `ABSENT`, not `nothing`.** This is the one semantic change to watch for. A field missing from the payload now reads as `OpenAPI.Runtime.ABSENT`, and `nothing` means an explicit JSON `null`. Code doing `x.field === nothing` to test "not set" must use `Kuber._field(x.field) === nothing` (or compare against `ABSENT`) instead.
> - **Model field names are lowercase**, with a `_` suffix where a name collided: `metadata.resourceversion`, `obj.apiversion`. Type names are unchanged (`IoK8sApiCoreV1Pod`).
> - **String maps are open objects, not `Dict`s.** `metadata.labels`, `metadata.annotations` and friends get a generated struct whose entries live in `additional_properties`. Use `kuber_props(pod.metadata.annotations)["key"]` rather than indexing the field.
> - **`OpenAPI.Clients.getpropertyat`/`haspropertyat` have replacements**: `Kuber.getpropertyat(pod, :spec, :containers, 1, :image)` and `Kuber.haspropertyat`. Unexported, so qualify them. They treat `ABSENT` as absent — which a handwritten `hasproperty` walk cannot, since on 1.0 every field exists — and a path element may name an open-struct entry, so `Kuber.getpropertyat(node, :metadata, :labels, "role")` reads a label directly. Paths use the generated (lowercase) field names, and case is not folded.
> - **Watch events are `KuberEvent`**, with `event.type` and an already-typed `event.object` — `kuber_obj(ctx, event.object)` is no longer needed (it still accepts a dict). The first item on the stream is still the initial typed list result.
> - **Every group module has its own copy of the shared meta types**, so a `Status` from `apps/v1` is not the same Julia type as core's. Compare `kuber_kind(result) == "Status"` rather than the type — this matters for `delete!`, which returns either the deleted object or a `Status`.
> - **Timeouts are HTTP.jl 2.x request options.** `set_timeout(ctx, secs)` now sets `request_timeout`; `set_request_options(ctx; ...)` passes anything else through (including TLS configuration). Watches never carry an overall deadline — bound them with `timeout_seconds` instead.
> - **Errors** are always `KuberException`; there are no `(result, response)` tuples to check.
> - **Aggregated APIs are captured from a cluster, not from release specs.** `metrics.k8s.io/v1beta1` is captured and shipped, so `:NodeMetrics`/`:PodMetrics` work against metrics-server. `custom.metrics.k8s.io` was captured from a real adapter and deliberately not shipped (`OpenAPIv1ConsumerGaps.md` C5), so the `list_custom_metrics`/`list_namespaced_custom_metrics` helpers, which are implemented, need the group registered first. CRD-backed groups stay out: they belong to the deployment that defines them. The generated layer covers the group versions listed in `gen/openapi_v1/fetch_specs.sh` plus the captures in `SPECS_CAPTURED`.
>
> The generated layer is checked in and reproducible; see [`gen/openapi_v1/README.md`](gen/openapi_v1/README.md) to regenerate it. Never hand-edit `src/ApiImpl/generated/`.

Most of the low level APIs fit into a common usage pattern. Kuber.jl makes it possible to use all of them with only a few intuitive verb based APIs. Verbs act on entities. Entities can be identified by names or selector patterns, or otherwise can apply to all entities of that class. Verbs can take additional parameters, e.g. when creating or updating entities.

API and Entity naming convention follows the standard Kubernetes API and Model naming conventions.

Here are a few helpful resources:

- [Tutorial](WalkThrough.md) on using Kuber.jl.
- [Article](Metrics.md) on using metrics and custom metrics with Kuber.jl


### Entities:

Any Kubernetes entity supported. APIs identify an entity by symbol named as per Kubernetes naming convention.

- `:Namespace`
- `:Pod`
- `:ReplicationController`
- `:Service`
- `:PersistentVolume`
- `:Job`
- `...`

### Methods/Verbs:

Kubernetes APIs are mapped to these easy to use verbs, familiar to Julia users.

- `get`: list or fetch entities
- `list`: list entities
- `put!`: create entities
- `update!`: update existing entities
- `delete!`: delete existing entities
- `sel`: creates a label selector to use with other verbs

All verbs have the signature:

```julia
verb(ctx::KuberContext, T::Symbol, args...; kwargs...)
```

Kubernetes also provides efficient change notifications on resources via "watches". These can be invoked with the `watch` verb, which accepts a `Channel` through which it streams events.

```julia
watch(ctx::KuberContext, T::Symbol, outstream::Channel; kwargs...)
```

In addition, verbs like `get` and `list` also support watches, and those can be invoked as:

```julia
watch(ctx, verb, args...; kwargs...) do stream
    for event in stream
        # process event
    end
end
```

E.g.:

E.g.:

```julia
watch(ctx, list, :Pod) do stream
    for event in stream
        @info("got event", event)   # a PodList first, then KuberEvents
    end
end
```

The watch keeps itself alive: if the connection ends or is dropped, it is
re-established from the last `resourceVersion` seen. Closing the stream is how a
consumer stops a watch.

**A list object on the stream means complete current state.** It is the first
frame, and it appears again whenever the watch has to resync. That happens when
the `resourceVersion` expires — the apiserver answers a watch resumed from too
old a version with an in-stream `ERROR`, and Kuber lists again rather than
watching from scratch. Watching from scratch would replay everything that
currently exists as `ADDED` and never mention what was *deleted* while the watch
was gone, so a consumer's cache would keep phantom entries for the life of the
process. So: on a list frame, discard anything you cached that is not in it.

`watch(ctx, :Pod, stream)` — the events-only form — opts out of list frames, and
therefore out of resync state too. It still recovers, but a consumer maintaining
a cache on that form has to track expiry itself.

It also starts from a `resourceVersion` it finds by listing and then discarding
the result, so an object created between the call and that internal list is
never announced. Pass `resource_version=` — read off a `get`/`list` you make
yourself — when there must be no gap between the state you have and the events
you get. That is the list-then-watch shape, and it is what `watch(ctx, list, O)`
does for you.

### Helper methods:

A Kubernetes context can be manipulated with:

- `set_server`: Set the API server location ("http://localhost:8001" if not set)
- `set_ns`: Set the namespace to deal with (`default` namespace is not set)
- `set_retries`: Set how many **attempts** an API call gets on a retriable error (5 if not set, so up to four retries) and whether all APIs should be retried (only non mutating APIs are retried by default — with the count meaning attempts, that now genuinely means one request). The count is a budget of requests: HTTP.jl's own retry layer is off by default on a `KuberContext`, so nothing retries underneath it. A retriable error is a transport failure or a 429/5xx; a 429's `Retry-After` lengthens the wait
- `set_timeout` / `get_timeout` / `with_timeout`: Set an overall per-request deadline in seconds
- `set_request_options` / `get_request_options`: Pass any other HTTP.jl request option (connection timeouts, TLS configuration, …)

Other convenience methods:

- `kuber_type`: identify the Julia type corresponding to a Kubernetes payload
- `kuber_obj`: instantiate a Julia object from the supplied Kubernetes specification
- `is_retryable`: whether a failure was transient — the classification Kuber's own retries use, for calls a consumer drives itself. Replaces `OpenAPI.Clients.is_request_interrupted`
- `Kuber.getpropertyat` / `Kuber.haspropertyat`: walk a path of field names, vector indices and open-struct keys, treating `ABSENT` as absent. Unexported replacements for the `OpenAPI.Clients` accessors
- `kuber_kind`: the Kubernetes kind of an object, read off the value rather than its type
- `kind_to_type`: the Julia type for a kind, optionally in a specific API version
- Helper methods for [accessing metrics](Metrics.md) (not available in this trial branch)

### Adding API groups Kuber does not ship:

Kuber ships generated clients for the API groups in a Kubernetes release's own
OpenAPI documents. Aggregated APIs (`metrics.k8s.io`), CRD-backed groups and
anything else specific to a cluster are not in there, and are plugged in at load
time instead:

```julia
module MyK8sGroups
using Kuber

include("K8sMetricsK8sIoV1beta1.jl")   # the generated group modules
include("registry.jl")                 # generated: the six tables, which refer
                                       # to those modules by name

__init__() = Kuber.register!(@__MODULE__)
end
```

`Kuber.register!` merges a generated layer's tables into Kuber's registry, after
which its kinds work with the ordinary verbs. It has to be called from
`__init__` — mutations made during precompilation do not persist — and it
validates the whole registration before merging any of it, so a rejected one
changes nothing. `Kuber.unregister!` undoes it. See the `Kuber.register!`
docstring for the table shapes and for how a kind name served by two groups
resolves.

### References:
- API conventions: https://github.com/kubernetes/community/blob/master/contributors/devel/api-conventions.md
- API: https://kubernetes.io/docs/concepts/overview/kubernetes-api/
