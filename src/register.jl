# Merging out-of-tree generated layers into the registry.
#
# The registry tables are `const` *bindings* to *mutable* `Dict`s, and every key
# carries either the group version or the group module, so a generated layer
# Kuber does not ship can be merged into them without touching, or recompiling,
# anything that is already there. This is what replaces the 0.2.x
# `KuberContext(apimodule)` plug point — registration is process-global, but
# resolution stays per-context: `ctx.apis` and `ctx.modelapi` are still built at
# discovery from whatever the server actually serves.

using .ApiImpl: GROUP_MODULES, MODULE_GVS, KIND_TYPES, OPS, OP_PARAMS, OP_BODIES

"""The table names a registry module has to define, in `register!`'s argument order."""
const REGISTRY_TABLES = (:GROUP_MODULES, :MODULE_GVS, :KIND_TYPES, :OPS, :OP_PARAMS, :OP_BODIES)

const _VERBS = (:get, :list, :create, :replace, :patch, :delete, :deletecollection)
const _SCOPES = (:namespaced, :cluster, :allns)

"""
The group modules Kuber itself ships, frozen at precompilation. `unregister!`
refuses to touch these: removing one would leave the shipped tables describing
operations no longer reachable.
"""
const BUILTIN_MODULES = Set{Module}(keys(MODULE_GVS))

_empty_bodies() = Dict{Tuple{Module,Symbol,Symbol,Symbol},Tuple{Type,Vector{String}}}()

"""
    Kuber.register!(source::Module) -> Vector{Module}
    Kuber.register!(; group_modules, module_gvs, kind_types, ops, op_params, op_bodies) -> Vector{Module}

Add generated API group modules that Kuber does not ship — aggregated APIs like
`metrics.k8s.io`, CRD-backed groups, anything captured from a specific cluster —
so that the verb API addresses their kinds like any other.

`source` is a *registry module*: a module defining the six tables below, in the
shape `gen/openapi_v1/emit_registry.jl` emits. Returns the group modules added,
which is what [`unregister!`](@ref) undoes.

| table | type | meaning |
|:--|:--|:--|
| `GROUP_MODULES` | `Dict{String,Module}` | apiVersion → the group module serving it |
| `MODULE_GVS` | `Dict{Module,String}` | the exact inverse |
| `KIND_TYPES` | `Dict{Tuple{String,String},Type}` | (apiVersion, kind) → model type |
| `OPS` | `Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}` | (module, verb, kind, scope) → operation |
| `OP_PARAMS` | `Dict{…,Vector{Symbol}}` | positional argument names, path order, `:body` last |
| `OP_BODIES` | `Dict{…,Tuple{Type,Vector{String}}}` | request body type and its media types |

`verb` is one of `$(join(_VERBS, ", "))` and `scope` one of `$(join(_SCOPES, ", "))`.

# Call it from `__init__`

Registration mutates Kuber's state, and mutations to another module's state do
not survive precompilation. A registering package must therefore call this from
its `__init__`, not at top level:

```julia
module JuliaHubK8sApi
include("registry.jl")          # defines the six tables
__init__() = Kuber.register!(@__MODULE__)
end
```

The cost of that is compilation: registered kinds are absent from Kuber's
precompile image, so their first call compiles from scratch.

# What it refuses

Everything is validated before anything is merged, so a rejected registration
leaves the tables exactly as they were. A group version already served by a
*different* module is an error rather than a silent override — `unregister!` it
first if replacing it is really the intent. Re-registering identical content is
a no-op, so a package loaded twice in one session is harmless.

# Which module serves a kind

Registration order does not decide that. `build_model_api_map` fills
`ctx.modelapi` at discovery, first-wins, with core first and the remaining groups
in alphabetical order — so if two groups declare the same kind name, which one an
unqualified `get(ctx, :Thing)` reaches is decided by that ordering. Pass
`apiversion=` to be explicit.

A context that has already run discovery will not see newly registered kinds in
`ctx.modelapi` until it does so again ([`set_api_versions!`](@ref)); addressing
them by `apiversion=` works immediately, since that path reads the tables
directly.
"""
function register!(source::Module)
    absent = Symbol[t for t in REGISTRY_TABLES if !isdefined(source, t)]
    isempty(absent) && return register!(;
        group_modules = getproperty(source, :GROUP_MODULES),
        module_gvs = getproperty(source, :MODULE_GVS),
        kind_types = getproperty(source, :KIND_TYPES),
        ops = getproperty(source, :OPS),
        op_params = getproperty(source, :OP_PARAMS),
        op_bodies = getproperty(source, :OP_BODIES),
    )
    throw(ArgumentError(
        "$(nameof(source)) is not a registry module: it does not define " *
        join(absent, ", ") * ". A registry module defines all of " *
        join(REGISTRY_TABLES, ", ") * " — see Kuber.register!"))
end

function register!(;
    group_modules::AbstractDict,
    module_gvs::AbstractDict,
    kind_types::AbstractDict,
    ops::AbstractDict,
    op_params::AbstractDict,
    op_bodies::AbstractDict = _empty_bodies(),
)
    _check_registration(group_modules, module_gvs, kind_types, ops, op_params, op_bodies)

    merge!(GROUP_MODULES, group_modules)
    merge!(MODULE_GVS, module_gvs)
    merge!(KIND_TYPES, kind_types)
    merge!(OPS, ops)
    merge!(OP_PARAMS, op_params)
    merge!(OP_BODIES, op_bodies)

    return Module[group_modules[gv] for gv in sort!(collect(keys(group_modules)))]
end

"""
    _check_registration(tables...)

Reject a registration before any of it is merged. Two kinds of check: that the
incoming tables satisfy the invariants `test/registry.jl` asserts over the merged
result, and that they do not contradict what is already registered.
"""
function _check_registration(group_modules, module_gvs, kind_types, ops, op_params, op_bodies)
    # ── internally consistent ──────────────────────────────────────────────
    length(group_modules) == length(module_gvs) || throw(ArgumentError(
        "GROUP_MODULES has $(length(group_modules)) entries and MODULE_GVS $(length(module_gvs)); they must be inverses"))
    for (gv, mod) in group_modules
        mod isa Module || throw(ArgumentError("GROUP_MODULES[$gv] is a $(typeof(mod)), not a Module"))
        get(module_gvs, mod, nothing) == gv || throw(ArgumentError(
            "MODULE_GVS is not the inverse of GROUP_MODULES: no $(nameof(mod)) => \"$gv\" entry"))
        # the one thing Kuber calls on a group module by name
        isdefined(mod, :Client) || throw(ArgumentError(
            "$(nameof(mod)) defines no `Client`, so Kuber cannot build a client for $gv"))
    end

    for ((gv, kind), T) in kind_types
        haskey(group_modules, gv) || throw(ArgumentError(
            "KIND_TYPES entry (\"$gv\", \"$kind\") names a group version that is not being registered"))
        T isa Type || throw(ArgumentError("KIND_TYPES[(\"$gv\", \"$kind\")] is a $(typeof(T)), not a Type"))
        parentmodule(T) === group_modules[gv] || throw(ArgumentError(
            "KIND_TYPES[(\"$gv\", \"$kind\")] is $T, which is not defined in $(nameof(group_modules[gv]))"))
    end

    keys(ops) == keys(op_params) || throw(ArgumentError(
        "OPS and OP_PARAMS must cover the same keys; every operation needs its positional argument names"))
    for (key, f) in ops
        mod, verb, kind, scope = key
        haskey(module_gvs, mod) || throw(ArgumentError(
            "OPS key $key names $(nameof(mod)), which is not being registered"))
        f isa Function || throw(ArgumentError("OPS[$key] is a $(typeof(f)), not a Function"))
        parentmodule(f) === mod || throw(ArgumentError(
            "OPS[$key] is defined in $(nameof(parentmodule(f))), not in $(nameof(mod))"))
        verb in _VERBS || throw(ArgumentError("OPS key $key has verb :$verb, expected one of $_VERBS"))
        scope in _SCOPES || throw(ArgumentError("OPS key $key has scope :$scope, expected one of $_SCOPES"))
        # watching is `watch=true` on the list operation plus an accept-scoped
        # codec; the deprecated /watch/ paths are deliberately not carried
        startswith(String(nameof(f)), "watch") && throw(ArgumentError(
            "OPS[$key] is $(nameof(f)): the deprecated /watch/ operations are not used, " *
            "watching goes through the list operation"))
    end

    # `_positional` consumes OP_PARAMS positionally, so a mis-emitted table
    # would be accepted here and fail confusingly at call time instead
    for (key, params) in op_params
        _, verb, _, scope = key
        allunique(params) || throw(ArgumentError("OP_PARAMS[$key] repeats an argument: $params"))
        if scope === :namespaced
            (!isempty(params) && first(params) === :namespace) || throw(ArgumentError(
                "OP_PARAMS[$key] is namespaced, so :namespace must come first, got $params"))
        else
            :namespace in params && throw(ArgumentError(
                "OP_PARAMS[$key] is $scope-scoped but takes a :namespace"))
        end
        if :body in params
            last(params) === :body || throw(ArgumentError(
                "OP_PARAMS[$key] must take :body last, got $params"))
            verb in (:create, :replace, :patch) || throw(ArgumentError(
                "OP_PARAMS[$key] takes a :body, which :$verb does not send"))
        end
    end
    for key in keys(op_bodies)
        haskey(ops, key) || throw(ArgumentError("OP_BODIES has an entry for $key with no matching OPS entry"))
    end

    # ── does not contradict what is already registered ─────────────────────
    for (gv, mod) in group_modules
        held = get(GROUP_MODULES, gv, nothing)
        (held === nothing || held === mod) || throw(ArgumentError(
            "$gv is already served by $(nameof(held)); unregister it before registering $(nameof(mod))"))
        held_gv = get(MODULE_GVS, mod, nothing)
        (held_gv === nothing || held_gv == gv) || throw(ArgumentError(
            "$(nameof(mod)) is already registered for $held_gv and cannot also serve $gv"))
    end
    for (key, T) in kind_types
        held = get(KIND_TYPES, key, nothing)
        (held === nothing || held === T) || throw(ArgumentError(
            "kind \"$(key[2])\" in $(key[1]) is already registered as $held"))
    end
    for (key, f) in ops
        held = get(OPS, key, nothing)
        (held === nothing || held === f) || throw(ArgumentError(
            "$key is already registered as $(nameof(held))"))
    end
    return nothing
end

"""
    Kuber.unregister!(mods::Module...) -> Vector{Module}

Remove group modules added by [`register!`](@ref), along with every kind and
operation they brought. Accepts either the group modules themselves — what
`register!` returns — or the registry module that registered them.

Lenient by design, so it is safe in a `finally`: a module that is not registered
is skipped, and the return value is what was actually removed. The group modules
Kuber itself ships cannot be removed.

Contexts keep resolving the removed kinds until they run discovery again, since
`ctx.modelapi` is a snapshot; `ctx.clients` holds a client per module and is
likewise only cleared by `set_server`.
"""
function unregister!(mods::Module...)
    targets = Module[]
    for mod in mods
        if haskey(MODULE_GVS, mod)
            push!(targets, mod)
        elseif isdefined(mod, :GROUP_MODULES)
            append!(targets, values(getproperty(mod, :GROUP_MODULES)))
        end
    end
    for mod in targets
        mod in BUILTIN_MODULES && throw(ArgumentError(
            "$(nameof(mod)) is part of Kuber's own generated layer and cannot be unregistered"))
    end

    removed = Module[]
    for mod in unique(targets)
        gv = get(MODULE_GVS, mod, nothing)
        gv === nothing && continue
        filter!(p -> p.first[1] != gv, KIND_TYPES)
        filter!(p -> p.first[1] !== mod, OPS)
        filter!(p -> p.first[1] !== mod, OP_PARAMS)
        filter!(p -> p.first[1] !== mod, OP_BODIES)
        delete!(GROUP_MODULES, gv)
        delete!(MODULE_GVS, mod)
        push!(removed, mod)
    end
    return removed
end
