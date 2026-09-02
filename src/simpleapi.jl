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
        mod === nothing && throw(ArgumentError("this build of Kuber does not include $apiversion"))
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
    for p in params
        if p === :namespace
            namespace === nothing && throw(ArgumentError("a namespace is required for this operation"))
            push!(args, String(namespace))
        elseif p === :name
            name === nothing && throw(ArgumentError("a name is required for this operation"))
            push!(args, String(name))
        elseif p === :body
            body === nothing && throw(ArgumentError("a request body is required for this operation"))
            push!(args, body)
        else
            throw(ArgumentError("unsupported path parameter $p"))
        end
    end
    return args
end

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
  an in-stream `ERROR` event, and the protocol's answer is to start over
  without one
"""
function _pump_watch(ctx::KuberWatchContext, mod::Module, op::Function, params::Vector{Symbol},
                     namespace, name, callkwargs::NamedTuple, rv::Union{String,Nothing};
                     max_tries::Int, buffersize::Int)
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
        expired && (rv = nothing)      # start over: our resourceVersion is too old

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

List objects of kind `O`. In a watch context (or with `watch=true`) this streams
the initial list result followed by `KuberEvent`s, and returns only when the
watch ends.

Keyword Args:
- apiversion: force a group version instead of the server's preferred one
- namespace: the namespace to list in; `"*"` for all namespaces, `nothing` for
  cluster-scoped kinds
- resource_version: watch from this resourceVersion instead of listing first
- max_tries: retries allowed for the call
- any parameter the operation documents (`label_selector`, `field_selector`,
  `limit`, `timeout_seconds`, …), snake_case or lowercase
"""
function list(ctx::Union{KuberContext,KuberWatchContext}, O::Symbol;
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
    client = client_for(ctx, mod)
    callkwargs = _op_kwargs(kwargs)

    result = nothing
    if !watch || resource_version === nothing
        args = _positional(params, namespace, nothing, nothing)
        result = k8s_retry(; max_tries = max_tries) do
            _call(op, args...; client, request_options = _call_options(ctx), callkwargs...)
        end
    end
    watch || return result

    isa(ctx, KuberWatchContext) || throw(ArgumentError("watching requires a watch context"))
    if result !== nothing
        resource_version = _resource_version(result)
        # the event protocol's first item is the initial typed List result
        push_initial && put!(ctx.stream, result)
    end
    return _pump_watch(ctx, mod, op, params, namespace, nothing, callkwargs, resource_version;
                       max_tries = max_tries, buffersize = buffersize)
end

"""
    get(ctx, O, name; kwargs...)

Read one object of kind `O` by name. Accepts the same keyword arguments as
[`list`](@ref), and watches a single object in a watch context.
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
        result = k8s_retry(; max_tries = Int(max_tries)) do
            _call(op, args...; client, request_options = _call_options(ctx), callkwargs...)
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
                       resource_version; max_tries = Int(max_tries), buffersize = buffersize)
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
    update!(ctx, obj, patch, patch_type)
    update!(ctx, O, name, patch, patch_type)

Patch an object. `patch_type` is the patch media type, and must be one k8s
documents for a PATCH — `"application/merge-patch+json"`,
`"application/strategic-merge-patch+json"`, `"application/json-patch+json"`,
`"application/apply-patch+yaml"` or `"application/apply-patch+cbor"`. There is
no plain `application/json` variant.
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
    bodytype, media = OP_BODIES[key]
    patch_type in media || throw(ArgumentError(
        "unsupported patch type $patch_type for $O; the API documents $(join(media, ", "))"))
    # the body parameter is the generated `Patch` type — an open object — so a
    # plain Dict has to be decoded into it rather than passed through
    body = patch isa bodytype ? patch : Runtime._decode(bodytype, patch, false)
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

const _CUSTOM_METRICS_MESSAGE = """
custom metrics are not available in the OpenAPI 1.0 trial build of Kuber.

The models used to be hand-spliced into the legacy Swagger document; the new \
pipeline needs an OpenAPI v3 document for custom.metrics.k8s.io/v1beta1, \
captured from a cluster that serves it (see OpenAPIv1TrialBranchPlan.md §0).\
"""

list_namespaced_custom_metrics(args...; kwargs...) = error(_CUSTOM_METRICS_MESSAGE)
list_custom_metrics(args...; kwargs...) = error(_CUSTOM_METRICS_MESSAGE)
