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
> - **Watch events are `KuberEvent`**, with `event.type` and an already-typed `event.object` — `kuber_obj(ctx, event.object)` is no longer needed (it still accepts a dict). The first item on the stream is still the initial typed list result.
> - **Every group module has its own copy of the shared meta types**, so a `Status` from `apps/v1` is not the same Julia type as core's. Compare `kuber_kind(result) == "Status"` rather than the type — this matters for `delete!`, which returns either the deleted object or a `Status`.
> - **Timeouts are HTTP.jl 2.x request options.** `set_timeout(ctx, secs)` now sets `request_timeout`; `set_request_options(ctx; ...)` passes anything else through (including TLS configuration). Watches never carry an overall deadline — bound them with `timeout_seconds` instead.
> - **Errors** are always `KuberException`; there are no `(result, response)` tuples to check.
> - Out of trial scope: the custom metrics helpers (they throw a clear error), CRD groups, and aggregated APIs like `metrics.k8s.io`. The generated layer covers the 17 group versions listed in `gen/openapi_v1/fetch_specs.sh`.
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
re-established from the last `resourceVersion` seen, and an expired
`resourceVersion` starts over from a fresh list. Closing the stream is how a
consumer stops a watch.

### Helper methods:

A Kubernetes context can be manipulated with:

- `set_server`: Set the API server location ("http://localhost:8001" if not set)
- `set_ns`: Set the namespace to deal with (`default` namespace is not set)
- `set_retries`: Set the number of times an API call should be retried on a retriable error (5 if not set) and whether all APIs should be retried (only non mutating APIs are retried by default)
- `set_timeout` / `get_timeout` / `with_timeout`: Set an overall per-request deadline in seconds
- `set_request_options` / `get_request_options`: Pass any other HTTP.jl request option (connection timeouts, TLS configuration, …)

Other convenience methods:

- `kuber_type`: identify the Julia type corresponding to a Kubernetes payload
- `kuber_obj`: instantiate a Julia object from the supplied Kubernetes specification
- `kuber_kind`: the Kubernetes kind of an object, read off the value rather than its type
- `kind_to_type`: the Julia type for a kind, optionally in a specific API version
- Helper methods for [accessing metrics](Metrics.md) (not available in this trial branch)

### References:
- API conventions: https://github.com/kubernetes/community/blob/master/contributors/devel/api-conventions.md
- API: https://kubernetes.io/docs/concepts/overview/kubernetes-api/
