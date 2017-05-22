# Kuber

[![Build Status](https://travis-ci.org/JuliaComputing/Kuber.jl.svg?branch=master)](https://travis-ci.org/JuliaComputing/Kuber.jl)
[![Coverage Status](https://coveralls.io/repos/JuliaComputing/Kuber.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/JuliaComputing/Kuber.jl?branch=master)
[![codecov.io](http://codecov.io/github/JuliaComputing/Kuber.jl/coverage.svg?branch=master)](http://codecov.io/github/JuliaComputing/Kuber.jl?branch=master)

A Julia Kubernetes Client.

Provides an easy to use API (few details mentioned below). The complete Kubernetes API is supported in the `Kubernetes` submodule.

### Entities:

- `:ComponentStatus`
- `:Endpoints`
- `:Namespace`
- `:ResourceQuota`
- `:Pod`
- `:PodTemplate`
- `:ReplicationController`
- `:Service`
- `:PersistentVolume`
- `:PersistentVolumeClaim`
- `:Job`
- `:Secret`
- `:ClusterRoleBinding`
- `:ClusterRole`
- `:RoleBinding`
- `:Role`
- `...`

Any Kubernetes entity supported, as long as it follows the standard Kubernetes Model and API naming conventions.

### Methods/Verbs:

Kubernetes APIs are mapped to these easy to use verbs, familiar to Julia users.

- `get`
- `put!`
- `update!`
- `delete!`
- `sel`: creates a label selector to use with other verbs

All verbs have the signature: `verb(ctx::KuberContext, T::Symbol, args...; kwargs...)`.

### Helper methods:

A Kubernetes context can be manipulated with:

- `set_server`: Set the API server location
- `set_ns`: Set the namespace to deal with

Other convenience methods:

- `kuber_type`: identify the Julia object corresponding to the Kubernetes specification
- `kuber_obj`: instantiate a Julia object from for the supplied Kubernetes specification
