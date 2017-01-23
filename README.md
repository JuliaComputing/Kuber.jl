# Kuber

[![Build Status](https://travis-ci.org/JuliaComputing/Kuber.jl.svg?branch=master)](https://travis-ci.org/JuliaComputing/Kuber.jl)

[![Coverage Status](https://coveralls.io/repos/JuliaComputing/Kuber.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/JuliaComputing/Kuber.jl?branch=master)

[![codecov.io](http://codecov.io/github/JuliaComputing/Kuber.jl/coverage.svg?branch=master)](http://codecov.io/github/JuliaComputing/Kuber.jl?branch=master)

A Julia Kubernetes Client.

Provides an easy to use API (few details mentioned below). The complete Kubernetes API is supported in the `Kubernetes` submodule.

### Entities:
- `ComponentStatus`
- `Endpoints`
- `Namespace`
- `ResourceQuota`
- `Pod`
- `PodTemplate`
- `ReplicationController`
- `Service`
- `PersistentVolume`
- `PersistentVolumeClaim`
- `Job`
- `Secret`

### Methods/Verbs:
- `get`
- `put!`
- `update!`
- `delete!`
- `sel`: creates a label selector to use with other verbs

All verbs have the signature: `verb(ctx, T, args...; kwargs...)`.
If `ctx` is ommitted, a global context (see next section) is used: `verb(T, args...; kwargs...)`.

### Helper methods:

A global instance of `KuberContext` is kept in the package for convenience. It comes in handy when dealing with a single nameserver and API server.
The following methods can be used to manipulate that.
- `set_server`: Set the API server location
- `set_ns`: Set the namespace to deal with

Other convenience methods:
- `kuber_type`: identify the Julia object corresponding to the Kubernetes specification
- `kuber_obj`: instantiate a Julia object from for the supplied Kubernetes specification
