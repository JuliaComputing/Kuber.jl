# Kuber

[![Build Status](https://github.com/JuliaComputing/Kuber.jl/workflows/CI/badge.svg)](https://github.com/JuliaComputing/Kuber.jl/actions?query=workflow%3ACI+branch%3Amaster)

A Julia Kubernetes Client.

An easy to use API to access Kubernetes clusters from Julia. The `Kuber.ApiImpl.Kubernetes` submodule has the complete set of low level APIs and entities.

[Supported API Versions](SupportedAPIVersions.md)

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

Kubernetes also provides efficient change notifications on resources via "watches". Certain entities have the special `watch` APIs defined for them and that can be invoked with the `watch` verb. The `watch` API accepts a `Channel` through which it streams events.

```julia
watch(ctx::KuberContext, T::Symbol, outstream::Channel, args...; kwargs...)
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

```julia
watch(ctx, list, :Pod; resource_version=19451) do stream
    for event in stream
        @info("got event", event)
    end
end
```

### Helper methods:

A Kubernetes context can be manipulated with:

- `set_server`: Set the API server location ("http://localhost:8001" if not set)
- `set_ns`: Set the namespace to deal with (`default` namespace is not set)
- `set_retries`: Set the number of times an API call should be retried on a retriable error (5 if not set) and whether all APIs should be retried (only non mutating APIs are retried by default)

Other convenience methods:

- `kuber_type`: identify the Julia object corresponding to the Kubernetes specification
- `kuber_obj`: instantiate a Julia object from for the supplied Kubernetes specification
- Helper methods for [accessing metrics](Metrics.md)

### References:
- API conventions: https://github.com/kubernetes/community/blob/master/contributors/devel/api-conventions.md
- API: https://kubernetes.io/docs/concepts/overview/kubernetes-api/
