# simple Julia APIs over the generated Kubernetes clients

using .ApiImpl: OP_BODIES

function sel(label::String, op::Symbol)
    @assert op === :exists
    label
end
sel(label::String, op::Symbol, items::String...) = label * " " * string(op) * " (" * join(items, ",") * ")"
sel(cnd::String...) = join(cnd, ", ")

# ── resolution ─────────────────────────────────────────────────────────────

"""
    _resolve_module(ctx, O, apiversion) -> Module

The generated group module serving kind `O`: the one for `apiversion` when
given, else whichever the context discovered for that kind (the server's
preferred version).
"""
function _resolve_module(ctx::Union{KuberContext,KuberWatchContext}, O::Symbol,
                         apiversion::Union{String,Nothing}; max_tries::Int = retries(ctx, false))
    kubectx = _kubectx(ctx)
    kubectx.initialized || set_api_versions!(kubectx; max_tries = max_tries)
    if apiversion !== nothing
        mod = get(GROUP_MODULES, apiversion, nothing)
        mod === nothing && throw(ArgumentError(
            "no API module is registered for $apiversion (out-of-tree groups plug in through Kuber.register!)"))
        return mod
    end
    mod = get(kubectx.modelapi, O, nothing)
    mod === nothing && throw(ArgumentError("no API group on this server serves $O"))
    return mod
end

"""
    _scopes(namespace) -> Tuple{Symbol,...}

Which operation scopes to try, in order, for a requested namespace. `ctx.namespace`
defaults to `"default"`, so cluster-scoped kinds (`Namespace`, `Node`,
`PersistentVolume`, …) come through here looking namespaced and must fall back
to `:cluster` — the same fallback chain the old code got from `isdefined`
probing, now a table lookup.
"""
function _scopes(namespace::Union{String,Nothing})
    (namespace === nothing || isempty(namespace)) && return (:cluster, :allns)
    namespace == "*" && return (:allns, :cluster)
    return (:namespaced, :cluster, :allns)
end

"""
    _find_op(mod, verb, O, namespace) -> (key, function, params, scope)

The registry entry for a verb on a kind, or an error naming what was missing.
"""
function _find_op(mod::Module, verb::Symbol, O::Symbol, namespace::Union{String,Nothing})
    for scope in _scopes(namespace)
        key = (mod, verb, O, scope)
        haskey(OPS, key) && return (key, OPS[key], OP_PARAMS[key], scope)
    end
    throw(ArgumentError("$(nameof(mod)) has no $verb operation for $O"))
end

"""
    _positional(params, namespace, name, body) -> Vector{Any}

Fill a generated operation's positional arguments. The order comes from the
spec (`OP_PARAMS`): path parameters in path order, so the namespace comes
*first*, then the name, then a required body last.
"""
function _positional(params::Vector{Symbol}, namespace, name, body)
    args = Any[]
    named = count(p -> p !== :namespace && p !== :body, params)
    named <= 1 || throw(ArgumentError(
        "operations with more than one non-namespace path parameter are not addressable " *
        "through the verb API: $params"))
    for p in params
        if p === :namespace
            namespace === nothing && throw(ArgumentError("a namespace is required for this operation"))
            push!(args, String(namespace))
        elseif p === :body
            body === nothing && throw(ArgumentError("a request body is required for this operation"))
            push!(args, body)
        else
            # `:name` for everything the apiserver serves, but a group Kuber does
            # not ship can name it something else — custom.metrics.k8s.io calls
            # it `compositemetricname`. There is only ever one, so the name
            # argument fills whichever it is.
            name === nothing && throw(ArgumentError("a $p is required for this operation"))
            push!(args, String(name))
        end
    end
    return args
end

"""
    _takes_name(params) -> Bool

Whether an operation has a path parameter the `name` argument can fill.
"""
_takes_name(params::Vector{Symbol}) = any(p -> p !== :namespace && p !== :body, params)

"""
    _op_kwargs(kwargs) -> NamedTuple

Translate Kuber's snake_case keyword arguments to the generated lowercase ones
(`label_selector` -> `labelselector`, `resource_version` -> `resourceversion`)
and drop `nothing` values: generated optional parameters are
`Union{Absent,T}`, so an explicit `nothing` would fail request validation
instead of being omitted.
"""
function _op_kwargs(kwargs)
    translated = Pair{Symbol,Any}[]
    for (k, v) in pairs(kwargs)      # pairs(), so a NamedTuple works too
        v === nothing && continue
        push!(translated, Symbol(lowercase(replace(String(k), "_" => ""))) => v)
    end
    return (; translated...)
end

"""
    _call(f, args...; kwargs...)

Invoke a generated operation, rewrapping its `ApiError` as a `KuberException`
so callers (and `k8s_retry_cond`) see Kuber's exception type. Operations return
the decoded value or throw; there are no `(result, response)` tuples and no
`check_api_response` any more.
"""
function _call(f, args...; kwargs...)
    try
        return f(args...; kwargs...)
    catch e
        e isa Runtime.ApiError && throw(KuberException(e))
        rethrow()
    end
end

# ── watch plumbing ─────────────────────────────────────────────────────────

"""
    watch(fn, ctx; buffersize=1024, stream=KuberEventStream(buffersize))

Run `fn(watchctx, stream)` with a watch-capable context.
"""
function watch(fn::Function, ctx::KuberContext; buffersize::Int = 1024,
               stream::KuberEventStream = KuberEventStream(buffersize))
    watchctx = KuberWatchContext(ctx, stream)
    fn(watchctx, stream)
end

"""
    watch(streamprocessor, ctx, watched, args...; kwargs...)

Run a watched call and a stream processor concurrently, ending when either
does.

`watched` (normally `list` or `get`) stays long-lived: its watch branch pumps
the stream inline and only returns when the watch is finished, so the `finally
close(stream)` blocks below remain the end-of-watch signal they were under the
0.2.x client — even though the underlying generated call now returns as soon as
the response head arrives.
"""
function watch(streamprocessor::Function, ctx::KuberContext, watched::Function, args...; kwargs...)
    watch(ctx) do watchctx, stream
        @sync begin
            @async try
                watched(watchctx, args...; kwargs...)
            finally
                close(stream)
            end
            @async try
                streamprocessor(stream)
            finally
                # Symmetric to the watcher task above: if the stream processor
                # dies (e.g. an exception while handling an event), close the
                # stream so the watch aborts too. Otherwise `@sync` silently
                # waits for the connection to end while events pile up
                # unconsumed — a deaf watch with no error surfaced.
                close(stream)
            end
        end
    end
end

"""
    watch(ctx, O, outstream; kwargs...)

Stream watch events for kind `O` onto `outstream`. Unlike the `watch(fn, ...)`
form this emits only events, with no initial list result.

That also means no resync frame after an expired `resourceVersion` (see
[`list`](@ref)): the watch recovers, but the consumer is not told what it missed
while it was gone. A consumer maintaining a cache wants the list frames — use
`watch(fn, ctx)` and drive `list` yourself.
"""
function watch(ctx::KuberContext, O::Symbol, outstream::Channel; kwargs...)
    list(KuberWatchContext(ctx, outstream), O; watch = true, push_initial = false, kwargs...)
end

"""
    _resource_version(object) -> Union{String,Nothing}

`metadata.resourceVersion` of a typed model or a raw JSON object. The generated
field is lowercase (`resourceversion`) and may be `ABSENT`.
"""
function _resource_version(object)
    if object isa AbstractDict
        metadata = get(object, "metadata", nothing)
        metadata isa AbstractDict || return nothing
        rv = get(metadata, "resourceVersion", nothing)
        return rv isa AbstractString ? String(rv) : nothing
    end
    hasproperty(object, :metadata) || return nothing
    metadata = _field(object.metadata)
    (metadata === nothing || !hasproperty(metadata, :resourceversion)) && return nothing
    rv = _field(metadata.resourceversion)
    return rv isa AbstractString ? String(rv) : nothing
end

"""
    _status_code(object) -> Union{Int,Nothing}

`code` of a k8s `Status`, typed or raw.
"""
function _status_code(object)
    raw = object isa AbstractDict ? get(object, "code", nothing) :
          (hasproperty(object, :code) ? _field(object.code) : nothing)
    return raw isa Integer ? Int(raw) : nothing
end

"""
    _to_event(item) -> KuberEvent

Second-stage decode of one raw watch frame. The codec hands over
`{"type": ..., "object": ...}` as JSON; the object is decoded to its typed
model via `KIND_TYPES`, and left as the raw JSON when the kind belongs to a
group this build does not ship.
"""
function _to_event(item)
    item isa AbstractDict || return KuberEvent("ERROR", item)
    type = String(get(item, "type", "ERROR"))
    object = get(item, "object", nothing)
    if object isa AbstractDict && haskey(object, "kind")
        object = try
            kuber_obj(object)
        catch
            object
        end
    end
    return KuberEvent(type, object)
end

"""
    _resync(ctx, client, op, args, callkwargs; max_tries, push_initial) -> (rv, stopped)

Recover from an expired `resourceVersion` by listing again, and deliver that
list to the consumer as a resync frame.

Watching from no `resourceVersion` at all would be simpler, and is what this did
first, but it is wrong for anything maintaining a cache: k8s replays current
state as synthetic `ADDED` events, so a consumer hears about everything that
still exists and never hears about what was **deleted while the watch was gone**.
Those entries would survive in its store for the lifetime of the process.

Listing instead gets complete state in one object plus a `resourceVersion` to
resume from, with no replay — the same answer client-go's reflector gives. The
list is pushed onto the stream exactly as the initial one was, which is what
makes the contract a single rule: *a list object means complete current state,
so discard anything cached that is not in it.*

`push_initial=false` says the consumer wants events only, and is honoured here
too: it still gets the recovery, but not the state, and has to track expiry
itself.

Returns the fresh `resourceVersion` and whether the consumer stopped the watch
while this was happening.
"""
function _resync(ctx::KuberWatchContext, client, op::Function, args::Vector,
                 callkwargs::NamedTuple; max_tries::Int, push_initial::Bool)
    result = k8s_retry(; max_tries = max_tries) do
        _call(op, args...; client, request_options = _call_options(ctx), callkwargs...)
    end
    if push_initial
        try
            put!(ctx.stream, result)
        catch e
            e isa InvalidStateException || rethrow()
            return (nothing, true)          # the consumer closed the stream
        end
    end
    return (_resource_version(result), false)
end

"""
    _pump_watch(ctx, mod, op, params, namespace, name, callkwargs, rv; max_tries, buffersize)

Stream watch events onto `ctx.stream` until the consumer stops the watch,
re-establishing the connection as needed. Returns when the watch is over.

The retry semantics here are dictated by what the runtime actually does (see
`test/characterize_retries.jl`):

- the generated call returns at the response head, so a *failure to establish*
  is what `k8s_retry` wraps; a failure mid-stream arrives on the raw channel
- a mid-stream drop on an item boundary closes the raw channel cleanly, exactly
  like a watch ending normally on `timeoutseconds`. So a clean close cannot mean
  "stop", and the watch is re-established from the last `resourceVersion` seen —
  which is what Kuber #68 asks for
- the consumer closing the public stream is therefore the *only* stop signal
  (Kuber #67/#68): it makes `put!` throw and `isopen` false
- a truncated item closes the raw channel with a `DecodeError`, and a connection
  aborted mid-chunk with an HTTP.jl error; re-establish for both
- `410 Gone` is not an `ApiError`: k8s answers an expired `resourceVersion` with
  an in-stream `ERROR` event. The answer is to **list again** and watch from the
  fresh `resourceVersion`, delivering that list as a resync frame — see
  `_resync`, and the "watching" section of the README for what a consumer owes
  it
"""
function _pump_watch(ctx::KuberWatchContext, mod::Module, op::Function, params::Vector{Symbol},
                     namespace, name, callkwargs::NamedTuple, rv::Union{String,Nothing};
                     max_tries::Int, buffersize::Int, push_initial::Bool = true)
    eventstream = ctx.stream
    client = client_for(ctx, mod)
    options = _call_options(ctx; watch = true)
    args = _positional(params, namespace, name, nothing)

    idle_restarts = 0
    while isopen(eventstream)
        raw = KuberEventStream(buffersize)
        rvkwargs = rv === nothing ? NamedTuple() : (; resourceversion = rv)
        try
            k8s_retry(; max_tries = max_tries) do
                _call(op, args...; client, watch = true, accept = WATCH_MEDIA, stream_to = raw,
                      request_options = options, rvkwargs..., callkwargs...)
            end
        catch
            close(raw)
            rethrow()
        end

        # Abort the transfer promptly when the consumer stops the watch. The pump
        # below blocks waiting for the next frame, which on a quiet resource can
        # be a long time — long enough that noticing the stop only on the next
        # frame would leave `watch()` hanging, and would keep the `@sync` in
        # `watch(streamprocessor, ...)` alive after the processor died, which is
        # the deaf watch Kuber #67 fixed.
        stopwatcher = @async begin
            while isopen(eventstream) && isopen(raw)
                sleep(0.25)
            end
            isopen(raw) && close(raw)
        end

        expired = false
        delivered = 0
        try
            for item in raw
                event = _to_event(item)
                if event.type == "ERROR" && _status_code(event.object) == 410
                    expired = true
                    break
                end
                put!(eventstream, event)
                delivered += 1
                seen = _resource_version(event.object)
                seen === nothing || (rv = seen)
            end
        catch e
            # the consumer closing the public stream is a stop, not a failure
            (isopen(eventstream) && !(e isa InvalidStateException)) || return nothing
            # Otherwise the stream died under us. A truncated item surfaces as a
            # DecodeError; a connection aborted mid-chunk surfaces as an HTTP.jl
            # error (`HTTP.ParseError: unexpected EOF while reading HTTP/1 data`),
            # which is the same failure `k8s_retry_cond` would retry on a
            # buffered call — so recover from both rather than killing the watch.
            (e isa Runtime.DecodeError || k8s_retry_cond(nothing, e)[2]) || rethrow()
        finally
            isopen(raw) && close(raw)    # also releases the stop watcher
            try
                wait(stopwatcher)        # never at the expense of the real error
            catch
            end
        end
        if expired
            rv, stopped = _resync(ctx, client, op, args, callkwargs; max_tries = max_tries,
                                  push_initial = push_initial)
            stopped && return nothing
        end

        # A watch that established and then ended without delivering anything is
        # not a failure, so `k8s_retry` above never sees it and nothing throttles
        # the next attempt. Back off, or a server that keeps closing empty
        # streams — an unservable resourceVersion, a proxy dropping long
        # connections — turns this loop into a hot one against the apiserver.
        if delivered == 0
            idle_restarts += 1
            _backoff(eventstream, min(0.25 * 2.0^min(idle_restarts - 1, 5), 8.0))
        else
            idle_restarts = 0
        end
    end
    return nothing
end

"""
    _backoff(eventstream, seconds)

Wait, but give up as soon as the consumer stops the watch.
"""
function _backoff(eventstream, seconds)
    deadline = time() + seconds
    while isopen(eventstream) && time() < deadline
        sleep(min(0.1, deadline - time()))
    end
    return nothing
end

# ── verbs ──────────────────────────────────────────────────────────────────

"""
    list(ctx, O; kwargs...)
    list(ctx, O, name; kwargs...)

List objects of kind `O`. In a watch context (or with `watch=true`) this streams
the initial list result followed by `KuberEvent`s, and returns only when the
watch ends.

**A list object on the stream means complete current state.** It is the first
frame, and it appears again whenever the watch has to resync — when the
`resourceVersion` expires, Kuber lists again rather than replaying, because a
replay would never mention what was deleted in the gap. A consumer keeping its
own cache should discard anything not in that list. `push_initial=false` opts out
of both frames.

`name` is for the few list operations that take a path parameter of their own —
`custom.metrics.k8s.io` addresses a metric as
`list(ctx, :MetricValue, "pods/*/http_requests")`. It is an error to pass one to
an operation with no such parameter.

Keyword Args:
- apiversion: force a group version instead of the server's preferred one
- namespace: the namespace to list in; `"*"` for all namespaces, `nothing` for
  cluster-scoped kinds
- resource_version: in a watch, resume from this resourceVersion instead of
  listing first. Outside one, the k8s "not older than" read — `"0"` means "any
  version you have cached", which is the cheap read
- max_tries: retries allowed for the call
- any parameter the operation documents (`label_selector`, `field_selector`,
  `limit`, `timeout_seconds`, …), snake_case or lowercase
"""
function list(ctx::Union{KuberContext,KuberWatchContext}, O::Symbol,
        name::Union{String,Nothing} = nothing;
        apiversion::Union{String,Nothing} = nothing,
        namespace::Union{String,Nothing} = _kubectx(ctx).namespace,
        max_tries::Int = retries(ctx, false),
        watch = isa(ctx, KuberWatchContext),
        resource_version = nothing,
        buffersize::Int = 1024,
        push_initial::Bool = true,
        kwargs...)
    mod = _resolve_module(ctx, O, apiversion; max_tries = max_tries)
    _, op, params, scope = _find_op(mod, :list, O, namespace)
    scope === :namespaced || (namespace = nothing)
    (name === nothing || _takes_name(params)) ||
        throw(ArgumentError("the list operation for $O takes no name"))
    client = client_for(ctx, mod)
    callkwargs = _op_kwargs(kwargs)

    result = nothing
    if !watch || resource_version === nothing
        args = _positional(params, namespace, name, nothing)
        # Outside a watch, `resource_version` is the k8s "not older than" read:
        # the list operation takes it as a query parameter, so forward it. In a
        # watch it means something else — where to resume from — and is consumed
        # by the pump below rather than sent with this call. G17.
        readkwargs = (!watch && resource_version !== nothing) ?
                     merge(callkwargs, (; resourceversion = String(resource_version))) :
                     callkwargs
        result = k8s_retry(; max_tries = max_tries) do
            _call(op, args...; client, request_options = _call_options(ctx), readkwargs...)
        end
    end
    watch || return result

    isa(ctx, KuberWatchContext) || throw(ArgumentError("watching requires a watch context"))
    if result !== nothing
        resource_version = _resource_version(result)
        # the event protocol's first item is the initial typed List result
        push_initial && put!(ctx.stream, result)
    end
    return _pump_watch(ctx, mod, op, params, namespace, name, callkwargs, resource_version;
                       max_tries = max_tries, buffersize = buffersize, push_initial = push_initial)
end

"""
    get(ctx, O, name; kwargs...)

Read one object of kind `O` by name. Accepts the same keyword arguments as
[`list`](@ref), and watches a single object in a watch context.

`resource_version` works here as it does on `list` — outside a watch it is the
"not older than" read. Kubernetes' OpenAPI document does not declare the
parameter on read operations even though the apiserver honours it, so the
generation pipeline adds it (`patch_k8s_spec.jq` §8).
"""
function get(ctx::Union{KuberContext,KuberWatchContext}, O::Symbol, name::String;
        apiversion::Union{String,Nothing} = nothing,
        namespace::Union{String,Nothing} = _kubectx(ctx).namespace,
        max_tries::Integer = retries(ctx, false),
        watch = isa(ctx, KuberWatchContext),
        resource_version = nothing,
        buffersize::Int = 1024,
        push_initial::Bool = true,
        kwargs...)
    mod = _resolve_module(ctx, O, apiversion; max_tries = max_tries)
    _, op, params, scope = _find_op(mod, :get, O, namespace)
    scope === :namespaced || (namespace = nothing)
    client = client_for(ctx, mod)
    callkwargs = _op_kwargs(kwargs)

    result = nothing
    if !watch || resource_version === nothing
        args = _positional(params, namespace, name, nothing)
        # As in `list`: outside a watch this is the "not older than" read, which
        # the operation takes as a query parameter. k8s does not document it on
        # reads — patch rule §8 declares it, because the apiserver honours it.
        # Inside a watch it means where to resume from, and is used below. G17.
        readkwargs = (!watch && resource_version !== nothing) ?
                     merge(callkwargs, (; resourceversion = String(resource_version))) :
                     callkwargs
        result = k8s_retry(; max_tries = Int(max_tries)) do
            _call(op, args...; client, request_options = _call_options(ctx), readkwargs...)
        end
    end
    watch || return result

    isa(ctx, KuberWatchContext) || throw(ArgumentError("watching requires a watch context"))
    if result !== nothing
        resource_version = _resource_version(result)
        push_initial && put!(ctx.stream, result)
    end
    # A read op has no watch mode — only collections do — so watch the collection
    # narrowed to this one object, preserving any field selector the caller gave
    # (k8s ANDs comma-separated selectors).
    _, listop, listparams, listscope = _find_op(mod, :list, O, namespace)
    selector = haskey(callkwargs, :fieldselector) ?
               "$(callkwargs.fieldselector),metadata.name=$name" : "metadata.name=$name"
    return _pump_watch(ctx, mod, listop, listparams, listscope === :namespaced ? namespace : nothing,
                       nothing, merge(callkwargs, (; fieldselector = selector)),
                       resource_version; max_tries = Int(max_tries), buffersize = buffersize,
                       push_initial = push_initial)
end

"""
    get(ctx, O; kwargs...)

List objects of kind `O` — the collection form of [`get`](@ref), equivalent to
[`list`](@ref).
"""
get(ctx::Union{KuberContext,KuberWatchContext}, O::Symbol; kwargs...) = list(ctx, O; kwargs...)

"""
    put!(ctx, obj)
    put!(ctx, O, obj)

Create an object. `obj` is a model or a JSON object; `O` is its kind, inferred
from the object when not given.
"""
function put!(ctx::KuberContext, v; max_tries::Int = retries(ctx, true), kwargs...)
    kind = kuber_kind(v)
    isempty(kind) && throw(ArgumentError("kind must be specified for $(typeof(v))"))
    put!(ctx, Symbol(kind), v; max_tries = max_tries, kwargs...)
end

function put!(ctx::KuberContext, O::Symbol, v::AbstractDict; max_tries::Int = retries(ctx, true), kwargs...)
    haskey(v, "kind") || (v = merge(Dict{String,Any}("kind" => String(O)), v))
    put!(ctx, O, kuber_obj(v); max_tries = max_tries, kwargs...)
end

function put!(ctx::KuberContext, O::Symbol, v;
        apiversion::Union{String,Nothing} = _field(hasproperty(v, :apiversion) ? v.apiversion : nothing),
        namespace::Union{String,Nothing} = ctx.namespace,
        max_tries::Int = retries(ctx, true),
        kwargs...)
    mod = _resolve_module(ctx, O, apiversion)
    _, op, params, scope = _find_op(mod, :create, O, namespace)
    scope === :namespaced || (namespace = nothing)
    args = _positional(params, namespace, nothing, v)
    client = client_for(ctx, mod)
    callkwargs = _op_kwargs(kwargs)
    return k8s_retry(; max_tries = max_tries) do
        _call(op, args...; client, request_options = _call_options(ctx), callkwargs...)
    end
end

"""
    delete!(ctx, obj)
    delete!(ctx, O, name)

Delete an object. Note that a delete can return either the deleted object or a
`Status` — see https://github.com/kubernetes-client/csharp/issues/44 — and that
the two are types from possibly different group modules, so compare
`kuber_kind(result)` rather than the type.

Because of that ambiguity the delete operations are the one place where the
patched specs describe the response as "anything" (see `patch_k8s_spec.jq` rule
5), so the payload's own `kind`/`apiVersion` is what types the result here.
"""
function delete!(ctx::KuberContext, v; max_tries::Int = retries(ctx, true), kwargs...)
    kind = kuber_kind(v)
    isempty(kind) && throw(ArgumentError("kind must be specified for $(typeof(v))"))
    metadata = _field(v.metadata)
    name = metadata === nothing ? nothing : _field(metadata.name)
    name === nothing && throw(ArgumentError("metadata.name must be specified for $(typeof(v))"))
    apiversion = _field(hasproperty(v, :apiversion) ? v.apiversion : nothing)
    delete!(ctx, Symbol(kind), String(name); apiversion = apiversion, max_tries = max_tries, kwargs...)
end

function delete!(ctx::KuberContext, O::Symbol, name::String;
        apiversion::Union{String,Nothing} = nothing,
        namespace::Union{String,Nothing} = ctx.namespace,
        max_tries::Int = retries(ctx, true),
        kwargs...)
    mod = _resolve_module(ctx, O, apiversion)
    _, op, params, scope = _find_op(mod, :delete, O, namespace)
    scope === :namespaced || (namespace = nothing)
    args = _positional(params, namespace, name, nothing)
    client = client_for(ctx, mod)
    callkwargs = _op_kwargs(kwargs)
    result = k8s_retry(; max_tries = max_tries) do
        _call(op, args...; client, request_options = _call_options(ctx), callkwargs...)
    end
    return _typed_result(result)
end

"""
    _typed_result(result)

Type an untyped (`Any`-schema) response from its own `kind`/`apiVersion`,
leaving it alone if the kind is unknown to this build.
"""
function _typed_result(result)
    result isa AbstractDict && haskey(result, "kind") || return result
    return try
        kuber_obj(result)
    catch
        result
    end
end

"""
    _patch_payload(patch) -> AbstractDict | AbstractVector

Normalize whatever a caller passes as a patch into something the generated body
type can be decoded from.

Two shapes reach here besides a plain dictionary or vector. JSON **text** is
parsed — that is what the 0.2.x client accepted. A **generated model** is
encoded to its JSON object first: patching an object with a whole desired object
is how JuliaRun updates Secrets (`api.jl:252`), and a model cannot be decoded
into the open `Patch` struct directly, which wants an object rather than a
struct.
"""
_patch_payload(patch) = Runtime._encode(patch)
_patch_payload(patch::AbstractString) = JSON.parse(patch)
_patch_payload(patch::AbstractDict) = patch
_patch_payload(patch::AbstractVector) = patch

"""
    update!(ctx, obj, patch, patch_type)
    update!(ctx, O, name, patch, patch_type)

Patch an object. `patch_type` is the patch media type, and must be one k8s
documents for a PATCH — `"application/merge-patch+json"`,
`"application/strategic-merge-patch+json"`, `"application/json-patch+json"`,
`"application/apply-patch+yaml"` or `"application/apply-patch+cbor"`. There is
no plain `application/json` variant.

The shape of `patch` follows the media type, as the protocol requires:

- a **merge, strategic-merge or apply patch** is an object — a `Dict`, a model,
  or JSON text — merged into the target: `Dict("spec" => Dict("replicas" => 2))`
- a **json-patch** is an array of RFC 6902 operations:
  `[Dict("op" => "replace", "path" => "/spec/replicas", "value" => 2)]`

An object patch may equally be a generated model or JSON text (see
`_patch_payload`); a json-patch may be a vector or the JSON text of one.

Kubernetes' OpenAPI document declares one object schema for all five, which is
untrue of json-patch; `gen/openapi_v1/patch_k8s_spec.jq` §6 corrects it, and
`OP_BODIES` carries the resulting type per media type.
"""
function update!(ctx::KuberContext, v, patch, patch_type; max_tries::Int = retries(ctx, true), kwargs...)
    kind = kuber_kind(v)
    isempty(kind) && throw(ArgumentError("kind must be specified for $(typeof(v))"))
    metadata = _field(v.metadata)
    name = metadata === nothing ? nothing : _field(metadata.name)
    name === nothing && throw(ArgumentError("metadata.name must be specified for $(typeof(v))"))
    apiversion = _field(hasproperty(v, :apiversion) ? v.apiversion : nothing)
    update!(ctx, Symbol(kind), String(name), patch, patch_type;
            apiversion = apiversion, max_tries = max_tries, kwargs...)
end

function update!(ctx::KuberContext, O::Symbol, name::String, patch, patch_type;
        apiversion::Union{String,Nothing} = nothing,
        namespace::Union{String,Nothing} = ctx.namespace,
        max_tries::Int = retries(ctx, true),
        kwargs...)
    mod = _resolve_module(ctx, O, apiversion)
    key, op, params, scope = _find_op(mod, :patch, O, namespace)
    scope === :namespaced || (namespace = nothing)
    media = OP_BODIES[key]
    bodytype = get(media, String(patch_type), nothing)
    bodytype === nothing && throw(ArgumentError(
        "unsupported patch type $patch_type for $O; the API documents $(join(sort!(collect(keys(media))), ", "))"))
    # The body type depends on the media type: a merge, strategic-merge or apply
    # patch is the generated `Patch` model (an open object), a json-patch is the
    # `JSONPatch` array of operations. Either way a caller's plain Dict or Vector
    # has to be decoded into it rather than passed through. A patch handed over
    # as JSON text is parsed first — that is what the 0.2.x client accepted.
    body = patch isa bodytype ? patch : Runtime._decode(bodytype, _patch_payload(patch), false)
    args = _positional(params, namespace, name, body)
    client = client_for(ctx, mod)
    callkwargs = _op_kwargs(kwargs)
    return k8s_retry(; max_tries = max_tries) do
        _call(op, args...; client, content_type = patch_type,
              request_options = _call_options(ctx), callkwargs...)
    end
end

"""
Fetch logs of the specified Pod

Parameters:
- name::String (required)

Keyword Args:
- container::String : The container for which to stream logs. Defaults to only container if there is one container in the pod.
- follow::Bool : Follow the log stream of the pod. Defaults to false.
- limit_bytes::Int64 : If set, the number of bytes to read from the server before terminating the log output. This may not display a complete final line of logging, and may return slightly more or slightly less than the specified limit.
- pretty::String : If 'true', then the output is pretty printed.
- previous::Bool : Return previous terminated container logs. Defaults to false.
- since_seconds::Int64 : A relative time in seconds before the current time from which to show logs. If this value precedes the time a pod was started, only logs since the pod start will be returned. If this value is in the future, no logs will be returned. Only one of since_seconds or since_time may be specified.
- tail_lines::Int64 : If set, the number of lines from the end of the logs to show. If not specified, logs are shown from the creation of the container or since_seconds or since_time
- timestamps::Bool : If true, add an RFC3339 or RFC3339Nano timestamp at the beginning of every line of log output. Defaults to false.

Returns: String of all log entries, one per line
"""
get_logs(ctx::KuberContext, pod_name::String; kwargs...) = get(ctx, :PodLog, pod_name; kwargs...)

"""
    _composite_metric_name(metricname) -> String
    _composite_metric_name(objecttype, metricname) -> String
    _composite_metric_name(objecttype, objectname, metricname) -> String

The path segment `custom.metrics.k8s.io` addresses a metric by:
`metrics/<metricname>` for every object in the namespace,
`<objecttype>/*/<metricname>` for every object of a type, and
`<objecttype>/<objectname>/<metricname>` for one object.
"""
_composite_metric_name(metricname::String) = "metrics/" * metricname
_composite_metric_name(objecttype::String, metricname::String) = objecttype * "/*/" * metricname
_composite_metric_name(objecttype::String, objectname::String, metricname::String) =
    objecttype * "/" * objectname * "/" * metricname

"""
    list_namespaced_custom_metrics(ctx, metricname; kwargs...)
    list_namespaced_custom_metrics(ctx, objecttype, metricname; kwargs...)
    list_namespaced_custom_metrics(ctx, objecttype, objectname, metricname; kwargs...)

Read a custom metric for objects in `ctx`'s namespace.

`custom.metrics.k8s.io` addresses a metric by a *composite name* rather than by
a resource name: `metrics/<metricname>` for every object in the namespace,
`<objecttype>/*/<metricname>` for every object of a type, and
`<objecttype>/<objectname>/<metricname>` for one object. These build that name.

The group is served by a metrics adapter (prometheus-adapter and the like), not
by the apiserver, so it is not in Kubernetes' own OpenAPI documents and Kuber
does not ship it. Capture it from a cluster that serves it and register it:

```sh
gen/openapi_v1/fetch_specs.sh --from-cluster custom.metrics.k8s.io/v1beta1
```

See `Metrics.md`, and [`Kuber.register!`](@ref) for plugging the generated
module in.
"""
list_namespaced_custom_metrics(ctx::KuberContext, args::String...; kwargs...) =
    list(ctx, :MetricValue, _composite_metric_name(args...); kwargs...)

"""
    list_custom_metrics(ctx, objecttype, metricname; kwargs...)
    list_custom_metrics(ctx, objecttype, objectname, metricname; kwargs...)

Read a custom metric for cluster-scoped objects — the same composite naming as
[`list_namespaced_custom_metrics`](@ref), without a namespace.
"""
list_custom_metrics(ctx::KuberContext, objecttype::String, rest::String...; kwargs...) =
    list(ctx, :MetricValue, _composite_metric_name(objecttype, rest...); namespace = nothing, kwargs...)
