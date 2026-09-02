const DEFAULT_NAMESPACE = "default"
const DEFAULT_URI = "http://localhost:8001"

const Runtime = OpenAPI.Runtime

using .ApiImpl: GROUP_MODULES, MODULE_GVS, KIND_TYPES, OPS, OP_PARAMS

"""
The media type that scopes the watch codec.

Registering a decoder for it does nothing on its own: codecs match on the
*received* Content-Type and a real apiserver always replies with a bare
`application/json`, even for a watch. Since OpenAPI `1ff9ba8` a streaming call
falls back to the media type the call asked for, so passing
`accept = WATCH_MEDIA` is what makes the codec fire — and it fires for exactly
those calls, leaving buffered calls on the same client decoding typed models.
"""
const WATCH_MEDIA = "application/json;stream=watch"

const KuberEventStream = Channel{Any}

"""
    KuberEvent(type, object)

One item from a watch stream. `type` is `ADDED`, `MODIFIED`, `DELETED`,
`BOOKMARK` or `ERROR`; `object` is the typed model when the kind is known and
the raw JSON object otherwise.

Kuber-owned rather than the generated `WatchEvent` model, so that `event.type`
keeps working at call sites — the generated field is named `type_`, since
`type` collides with a reserved name.
"""
struct KuberEvent
    type::String
    object::Any
end

show(io::IO, e::KuberEvent) = print(io, "KuberEvent(", e.type, ", ", typeof(e.object), ")")

"""
    _field(x, default=nothing)

Read a model field that may be `ABSENT`.

The one user-visible semantic change of the OpenAPI 1.0 models: a field that is
absent from the payload is `ABSENT`, and `nothing` now means an explicit JSON
`null`. The old client collapsed both to `nothing`.
"""
_field(x, default = nothing) = x isa Runtime.Absent ? default : x

"""
    kuber_props(x, default=Dict{String,String}()) -> AbstractDict

Read a Kubernetes string map — `metadata.labels`, `metadata.annotations`,
`nodeSelector`, … — as a dictionary.

k8s declares these as open objects, so the generator gives each one a model type
whose entries live in `additional_properties` rather than making it a plain
`Dict`. This normalizes the shapes a caller can meet: `ABSENT` or `null`, a real
dictionary, or one of those generated structs.

```julia
kuber_props(pod.metadata.annotations)["my.annotation"]
```
"""
function kuber_props(x, default = Dict{String,String}())
    x = _field(x)
    x === nothing && return default
    x isa AbstractDict && return x
    hasproperty(x, :additional_properties) || return default
    return _field(x.additional_properties, default)
end

"""
    _lookup(obj, name) -> value or nothing

One step of a path walk: a field of a model, a key of a dictionary, an index
into a vector, or an entry of an open struct's `additional_properties`.
Everything absent — a missing field, an out-of-range index, `ABSENT`, `null` —
comes back as `nothing`, which is what makes the walk uniform.
"""
function _lookup(obj, name)
    if name isa Integer
        obj isa AbstractVector || return nothing
        checkbounds(Bool, obj, name) || return nothing
        return _field(obj[name])
    end
    if obj isa AbstractDict
        return _field(get(obj, name isa Symbol ? String(name) : name, nothing))
    end
    sym = Symbol(name)
    hasproperty(obj, sym) && return _field(getproperty(obj, sym))
    # a k8s string map (labels, annotations, resource limits) is an open struct,
    # so its entries are not fields — reach them by their own name
    props = kuber_props(obj, nothing)
    props === nothing && return nothing
    return _field(get(props, name isa Symbol ? String(name) : name, nothing))
end

"""
    getpropertyat(obj, path...)

Walk a path of field names, vector indices and open-struct keys, returning
`nothing` the moment any step is absent.

The replacement for `OpenAPI.Clients.getpropertyat`, which OpenAPI.jl 1.0 does
not have (`OpenAPIv1ConsumerGaps.md` C2). Deliberately **not exported**: it is a
compatibility shim for consumers porting off 0.2.x, not a shape this API wants
to encourage.

Two differences from the 0.x version, both forced by the runtime:

- **`ABSENT` counts as absent.** On 0.x an unset field was `nothing` and 0.x
  overrode `Base.hasproperty` to say so. On 1.0 every field exists and an unset
  one is `ABSENT`, so a plain `hasproperty` walk answers `true` for everything —
  the trap that makes `container_resource` in JuliaRun's `clustermgmt.jl` return
  `ABSENT` instead of falling through.
- **A path element may name an open-struct entry**, so
  `getpropertyat(node, :metadata, :labels, "role")` reads a label without a
  separate `kuber_props` call.

Field names are the *generated* ones, which lowercase the JSON name — `:nodename`,
not `:nodeName` (C4). This helper does not fold case: a wrong name reads as
absent, exactly as a wrong name should.

A vector met by a non-integer path element is mapped over, as on 0.x:
`getpropertyat(podlist, :items, :metadata, :name)` returns a vector of names.

```julia
Kuber.getpropertyat(pod, :spec, :containers, 1, :image)
Kuber.getpropertyat(pod, :metadata, :labels, "app")
```
"""
function getpropertyat(obj, path...)
    val = _field(obj)
    (val === nothing || isempty(path)) && return val

    val = _lookup(val, path[1])
    rest = Base.tail(path)
    (isempty(rest) || val === nothing) && return val

    if val isa AbstractVector && !(rest[1] isa Integer)
        return [getpropertyat(item, rest...) for item in val]
    end
    return getpropertyat(val, rest...)
end

"""
    haspropertyat(obj, path...)

Whether every step of a path is present — the question
`getpropertyat(obj, path...) !== nothing` answers, without fetching the value.

The replacement for `OpenAPI.Clients.haspropertyat`; see
[`getpropertyat`](@ref) for why `ABSENT` is the interesting case and why neither
is exported.

Mapped over a vector met by a non-integer path element, as on 0.x, so the result
is a `Vector{Bool}` there rather than a `Bool`.
"""
function haspropertyat(obj, path...)
    val = _field(obj)
    val === nothing && return false
    isempty(path) && return true

    val = _lookup(val, path[1])
    val === nothing && return false
    rest = Base.tail(path)
    isempty(rest) && return true

    if val isa AbstractVector && !(rest[1] isa Integer)
        return [haspropertyat(item, rest...) for item in val]
    end
    return haspropertyat(val, rest...)
end

mutable struct KuberContext
    server::String
    clients::Dict{Module,Runtime.Client}
    client_kwargs::NamedTuple
    request_options::NamedTuple
    apis::Dict{Symbol,Vector{Module}}
    modelapi::Dict{Symbol,Module}
    namespace::String
    default_retries::Int
    retry_all_apis::Bool
    initialized::Bool

    function KuberContext(; kwargs...)
        new(
            DEFAULT_URI,
            Dict{Module,Runtime.Client}(),
            NamedTuple(kwargs),
            NamedTuple(),
            Dict{Symbol,Vector{Module}}(),
            Dict{Symbol,Module}(),
            DEFAULT_NAMESPACE,
            5,
            false,
            false,
        )
    end
end

struct KuberWatchContext
    ctx::KuberContext
    stream::KuberEventStream
end

_kubectx(ctx::KuberContext) = ctx
_kubectx(ctx::KuberWatchContext) = ctx.ctx

show(io::IO, ctx::KuberContext) = print(io, "Kubernetes namespace ", ctx.namespace, " at ", ctx.server)

get_server(ctx::Union{KuberContext,KuberWatchContext}) = _kubectx(ctx).server
get_ns(ctx::Union{KuberContext,KuberWatchContext}) = _kubectx(ctx).namespace

"""
    set_ns(ctx, namespace)

Set the namespace this context should operate with.
"""
set_ns(ctx::KuberContext, namespace::String) = (ctx.namespace = namespace)

# ── clients ────────────────────────────────────────────────────────────────

"""
    client_for(ctx, mod) -> Runtime.Client

The client for one generated group module, built on first use.

There is deliberately one client *per module*: a `Runtime.Client` is bound to
its module's compiled `_SPEC`, and sharing one across modules fails ("requested
node is not a compiled schema location"). This mirrors the per-API-struct
`apictx` the old client needed.
"""
client_for(ctx::KuberContext, mod::Module) = get!(() -> _new_client(ctx, mod), ctx.clients, mod)
client_for(ctx::KuberWatchContext, mod::Module) = client_for(ctx.ctx, mod)

function _new_client(ctx::KuberContext, mod::Module)
    client = mod.Client(ctx.server; require_credentials = false, ctx.client_kwargs...)
    # cheap and uniform: every client can watch, but only calls that pass
    # `accept = WATCH_MEDIA` decode through this codec
    Runtime.codec!(client, WATCH_MEDIA; decode = (bytes, _) -> JSON.parse(String(bytes)))
    return client
end

# ── exceptions ─────────────────────────────────────────────────────────────

"""
    KuberException(code, message, status, response)

A failed Kubernetes API call. `status` is the decoded k8s `Status` object when
the server sent one (its `message` and `code` take precedence), and `response`
is the underlying `OpenAPI.Runtime.ApiError` or HTTP response.
"""
struct KuberException <: Exception
    code::Int
    message::String
    status::Any
    response::Any
end

showerror(io::IO, e::KuberException) = print(io, "KuberException(", e.code, "): ", e.message)

"""
    KuberException(err::Runtime.ApiError)

Rewrap a generated operation's error. The body is parsed here rather than read
off `err.decoded`: k8s error statuses are mostly undocumented in the OpenAPI
document, and for an undocumented status the runtime leaves `decoded` as raw
bytes.
"""
function KuberException(err::Runtime.ApiError)
    code = err.status
    message = "HTTP $code in $(err.operation_id)"
    status = nothing
    body = isvalid(String, err.body) ? String(copy(err.body)) : ""
    if !isempty(body)
        message = body
        parsed = try
            JSON.parse(body)
        catch
            nothing
        end
        if parsed isa AbstractDict && get(parsed, "kind", nothing) == "Status"
            status = try
                kuber_obj(parsed)
            catch
                parsed
            end
            m = get(parsed, "message", nothing)
            (m isa AbstractString && !isempty(m)) && (message = m)
            c = get(parsed, "code", nothing)
            (c isa Integer && c != 0) && (code = c)
        end
    end
    return KuberException(code, message, status, err)
end

# ── retries ────────────────────────────────────────────────────────────────

"""
Delays between attempts, customized by TPS requirement. The default minimum is
2 TPS.

`max_tries` is the number of **attempts**, so there are `max_tries - 1` delays
between them. It used to be passed straight through as `ExponentialBackOff`'s
`n`, which is a count of *retries* — so `max_tries=1` made two requests, and a
mutating call, which takes `retries(ctx, true) == 1`, was retried once despite
`set_retries`' `all_apis=false` meaning it should not be (G20).
"""
k8s_delay(tps, max_tries = 1) =
    ExponentialBackOff(n = max(0, max_tries - 1), first_delay = (1 / tps), factor = 1.75, jitter = 0.1)

"""
Response codes that can be retried: 500-504 are unexpected server errors, and 0
is kept for callers that construct a `KuberException` for a failure where no
HTTP status was obtained.
"""
const k8s_retryable_codes = [0, 429, 500, 501, 502, 503, 504]

"""How long a 429's `Retry-After` may hold a call, however large the header says."""
const RETRY_AFTER_CAP = 30.0

"""
    _retry_after(e) -> Float64

The `Retry-After` a 429 asked for, in seconds, or `0.0`.

Scoped to 429 on purpose. A 5xx may carry the header too, but honouring an
arbitrary server-supplied delay on every transient failure changes the timing of
every retry in the client; 429 is the case where the server is deliberately
pacing us and the number means what it says.

Only the delta-seconds form is read. `Retry-After` may also be an HTTP date,
which Kubernetes does not send — `tryparse` returns `nothing` for one and the
backoff is used instead, which is the safe direction.
"""
function _retry_after(e)
    code = e isa KuberException ? e.code : (e isa Runtime.ApiError ? e.status : 0)
    code == 429 || return 0.0
    err = e isa KuberException ? e.response : e
    err isa Runtime.ApiError || return 0.0
    for (name, value) in err.headers
        lowercase(name) == "retry-after" || continue
        secs = tryparse(Float64, strip(value))
        secs === nothing && continue
        return clamp(secs, 0.0, RETRY_AFTER_CAP)
    end
    return 0.0
end

"""
    k8s_retry_cond(s, e, retryable_codes=k8s_retryable_codes)

Whether a failed call should be retried. Pinned to what
`test/characterize_retries.jl` observes at the OpenAPI commit this branch
targets:

- `Runtime.ApiError` (any non-2xx) carries `.status`; retry the retryable ones.
- transport failures are HTTP.jl exceptions now — the old
  `is_request_interrupted` helper does not exist. HTTP.jl 2.x puts them all
  under `HTTP.HTTPError`, so the rule is stated as an exclusion list: retry
  every `HTTPError` (and the raw `IOError`/`EOFError` a reset connection can
  still surface) except the ones that are decisions rather than accidents.

A watch that dies mid-stream never reaches this function: the watch call
already returned at the response head, so there is no in-flight call to retry.
Stop vs re-watch is decided in the watch loop by whether the consumer closed
the channel (see `simpleapi.jl`), which is what preserves the semantics of
Kuber #67/#68.
"""
const _DECISIVE_HTTP_ERRORS = Union{
    HTTP.CanceledError,          # somebody deliberately cancelled the request
    HTTP.StatusError,            # a status, already covered by ApiError
    HTTP.TooManyRedirectsError,
    HTTP.AddressInUseError,
    HTTP.RetryDeniedError,
}

function k8s_retry_cond(s, e, retryable_codes = k8s_retryable_codes)
    (e isa Runtime.ApiError) && (return (s, e.status in retryable_codes))
    (e isa KuberException) && (return (s, e.code in retryable_codes))
    (e isa _DECISIVE_HTTP_ERRORS) && (return (s, false))
    (e isa HTTP.HTTPError || e isa Base.IOError || e isa EOFError) && (return (s, true))
    return (s, false)
end

"""
    _root_cause(e) -> Exception

Dig a real failure out of the wrappers concurrency adds around it.
`watch(processor, ctx, …)` runs the watched call and the processor under
`@sync`, so a failure in either reaches the caller as a `CompositeException` of
`TaskFailedException`s rather than as itself.

A composite carrying more than one exception is left alone: there is no single
cause to report.
"""
_root_cause(e) = e
_root_cause(e::TaskFailedException) = _root_cause(e.task.result)
function _root_cause(e::CompositeException)
    length(e.exceptions) == 1 || return e
    return _root_cause(e.exceptions[1])
end

"""
    is_retryable(e) -> Bool

Whether a failure is transient — an accident worth retrying rather than an
answer. This is the classification Kuber's own retries use, exposed because
consumers need to make the same judgement about calls they drive themselves.

It replaces `OpenAPI.Clients.is_request_interrupted`, which does not exist in
OpenAPI.jl 1.0. Transport failures are HTTP.jl exceptions now, so the rule is
stated as an exclusion list (see [`k8s_retry_cond`](@ref)): every `HTTP.HTTPError`
except the ones that are decisions, plus `ApiError`/`KuberException` carrying a
5xx.

```julia
try
    pods = list(ctx, :Pod)
catch e
    Kuber.is_retryable(e) || rethrow()
    ...
end
```

Two things it deliberately does not answer:

- **`OpenAPI.Clients.is_longpoll_timeout` has no successor.** Watches on this
  branch carry no overall deadline (`set_timeout` is not applied to them), so a
  watch does not end on one — it ends when the consumer closes the stream, and
  that is not an exception at all.
- **A `DecodeError` is not retryable here.** A response that does not match the
  schema is spec drift, not a hiccup. The watch pump separately recovers from a
  truncated *stream item*, which arrives the same way but means the connection
  died mid-frame.

Exceptions raised inside a task are unwrapped first, so this works on what
`watch` actually throws.
"""
is_retryable(e) = k8s_retry_cond(nothing, _root_cause(e))[2]

"""
    k8s_retry(f; max_tries=1, tps=2)

Call `f`, retrying transient failures up to `max_tries` **attempts** in total
(so `max_tries=1` calls it once and never retries). The last failure is
rethrown; a failure [`k8s_retry_cond`](@ref) calls decisive is rethrown at once.

Written as an explicit loop rather than `Base.retry` so a 429's `Retry-After`
can be honoured: `Base.retry` takes its delays from an iterator that never sees
the exception, so the server's own pacing is unreachable from it. The backoff is
still the floor — `Retry-After` only ever lengthens a wait (G19).
"""
function k8s_retry(f; max_tries::Integer = 1, tps = 2)
    delays = collect(k8s_delay(tps, max_tries))
    attempt = 1
    while true
        try
            return f()
        catch e
            (attempt <= length(delays) && k8s_retry_cond(nothing, e)[2]) || rethrow()
            sleep(max(delays[attempt], _retry_after(e)))
            attempt += 1
        end
    end
end

"""
    set_retries(ctx; count=5, all_apis=false)

Args:
- ctx: the context to set the options for

Keyword Args:
- count: how many **attempts** a retryable call gets in total (default 5, so up
  to four retries). This counted retries rather than attempts until G20, which
  is why a mutating call — pinned to a count of 1 — used to be retried once
- all_apis: whether to retry even mutating APIs e.g. `put!` (default false)

The count is a budget of requests, not of Kuber-level attempts: HTTP.jl's own
retry layer is off by default on a `KuberContext` so that it means what it says.
"""
function set_retries(ctx::KuberContext; count::Int = ctx.default_retries, all_apis::Bool = ctx.retry_all_apis)
    ctx.default_retries = count
    ctx.retry_all_apis = all_apis
    ctx
end
retries(ctx::KuberContext, mutating::Bool = true) = (mutating && !ctx.retry_all_apis) ? 1 : ctx.default_retries
retries(watch::KuberWatchContext, mutating::Bool = true) = retries(watch.ctx, mutating)

# ── request options / timeouts ─────────────────────────────────────────────

"""
    get_request_options(ctx) -> NamedTuple

The HTTP.jl options passed with every call made through this context.
"""
get_request_options(ctx::Union{KuberContext,KuberWatchContext}) = _kubectx(ctx).request_options

"""
    set_request_options(ctx; kwargs...)

Merge HTTP.jl request options (`connect_timeout`, `request_timeout`,
`read_idle_timeout`, `sslconfig`, …) into the context's per-call defaults.

`retry` is set to `false` when the context is built, so that `set_retries` and
`max_tries` are the only thing deciding how many requests a call makes. Pass
`retry=true` here to put HTTP.jl's retry layer back underneath Kuber's — the two
compose multiplicatively, and HTTP.jl's has no notion of which calls are
mutating.
"""
function set_request_options(ctx::Union{KuberContext,KuberWatchContext}; kwargs...)
    kubectx = _kubectx(ctx)
    kubectx.request_options = merge(kubectx.request_options, NamedTuple(kwargs))
    ctx
end

"""
    get_timeout(ctx) -> Union{Nothing,Real}

The overall per-request deadline in seconds, or `nothing` when none is set.
"""
get_timeout(ctx::Union{KuberContext,KuberWatchContext}) = get(get_request_options(ctx), :request_timeout, nothing)

"""
    set_timeout(ctx, timeout)

Set the overall per-request deadline, in seconds.

This is HTTP.jl 2.x's `request_timeout` option, replacing the 0.2.x client's
mutable `timeout[]`. It is *not* applied to watch calls: a watch has no
meaningful overall deadline, and k8s bounds one with the `timeoutseconds` query
parameter instead.
"""
set_timeout(ctx::Union{KuberContext,KuberWatchContext}, timeout::Real) =
    set_request_options(ctx; request_timeout = timeout)

"""
    with_timeout(fn, ctx, timeout)

Run `fn(ctx)` with a context-local request deadline, restoring the previous
request options afterwards.
"""
function with_timeout(fn, ctx::Union{KuberContext,KuberWatchContext}, timeout::Real)
    kubectx = _kubectx(ctx)
    old = kubectx.request_options
    set_timeout(ctx, timeout)
    try
        fn(ctx)
    finally
        kubectx.request_options = old
    end
end

"""
    _call_options(ctx; watch=false)

The request options for one call. A watch drops `request_timeout` (see
`set_timeout`) but keeps connect and idle timeouts, which do bound a stalled
connection.
"""
function _call_options(ctx::Union{KuberContext,KuberWatchContext}; watch::Bool = false)
    # HTTP.jl 2.x retries idempotent requests on a retryable status by default,
    # underneath `k8s_retry` — so every Kuber attempt cost several requests,
    # `max_tries` bounded none of them, and a mutating call could be retried by
    # a layer that has no idea it is mutating. Kuber owns retrying (G20).
    # Merged this way round so `set_request_options(ctx; retry=true)` wins, and
    # applied here rather than on the context so the client constructor — which
    # takes no `retry` — never sees it.
    opts = merge((; retry = false), get_request_options(ctx))
    (watch && haskey(opts, :request_timeout)) || return opts
    return Base.structdiff(opts, NamedTuple{(:request_timeout,)})
end

# ── types and conversions ──────────────────────────────────────────────────

"""
    kind_to_type(ctx, kind, apiversion=nothing) -> Type

The generated model type for a kind. Without an `apiversion`, the group module
the context resolved for that kind decides — so this follows the server's
preferred version, as it did before.

Note that the meta kinds (`Status`, `DeleteOptions`, `WatchEvent`) exist as a
separate type in *every* group module. Types from two modules are never
identical, so compare kinds rather than types when a response may come from a
group other than the one you asked about.
"""
kind_to_type(ctx::Union{KuberContext,KuberWatchContext}, kind::String, apiversion = nothing) =
    kind_to_type(ctx, Symbol(kind), apiversion)
function kind_to_type(ctx::Union{KuberContext,KuberWatchContext}, kind::Symbol, apiversion = nothing)
    kubectx = _kubectx(ctx)
    if apiversion === nothing
        kubectx.initialized || set_api_versions!(kubectx)
        mod = get(kubectx.modelapi, kind, nothing)
        mod === nothing && throw(KeyError(kind))
        apiversion = MODULE_GVS[mod]
    end
    return KIND_TYPES[(String(apiversion), String(kind))]
end

"""
    kuber_type(json) -> Type

The model type a JSON payload decodes to, from its `kind` and `apiVersion`.
Replaces the old response-sniffing hook, which is no longer needed: with the
specs patched to be true, buffered responses decode to their documented type.
This remains useful for watch frames and for hand-held payloads.
"""
kuber_type(j::AbstractDict) = KIND_TYPES[(String(get(j, "apiVersion", "v1")), String(j["kind"]))]
kuber_type(ctx::Union{KuberContext,KuberWatchContext}, j) = kuber_type(j)

"""
    kuber_obj(json) -> model

Decode a JSON string or object into the typed model its `kind`/`apiVersion`
names.
"""
kuber_obj(j::AbstractDict) = Runtime._decode(kuber_type(j), j, false)
kuber_obj(data::AbstractString) = kuber_obj(JSON.parse(data))
kuber_obj(ctx::Union{KuberContext,KuberWatchContext}, j) = kuber_obj(j)

"""
    kuber_kind(model) -> String

The k8s kind of a model, read off the value rather than its type so that it
works for the same kind coming from different group modules.
"""
kuber_kind(v) = String(_field(v.kind, ""))

# ── discovery ──────────────────────────────────────────────────────────────

camel(a) = string(uppercase(a[1])) * (a[2:end])

"""
    api_group(group)

Get the API group name as a string, given the full group specifier.
E.g.:
    "apiregistration.k8s.io" => "ApiRegistration"
    "karpenter.sh" => "KarpenterSh"
"""
api_group(group) = api_group(String(group))
function api_group(group::String)
    endswith(group, ".k8s.io") && (group = group[1:end-7])
    group_parts = split(group, ".")
    join([camel(String(x)) for x in group_parts])
end

"""
    api_module(ctx, apiversion) -> Module

The generated module serving a group version, e.g. `"apps/v1"`.
"""
api_module(ctx::Union{KuberContext,KuberWatchContext}, apiversion) = GROUP_MODULES[String(apiversion)]

function override_pref(name, server_pref, override)
    if override !== nothing
        for (n, v) in override
            (n == name) && (return v)
        end
    end
    server_pref
end

"""
    _discovery_get(ctx, path)

The two k8s discovery endpoints are the only calls Kuber makes that are not
generated operations — they were the sole reason the old client needed the
generated `ApisApi`/`CoreApi` wrappers. Plain HTTP.jl is enough, and keeps
discovery independent of which group modules happen to be shipped.
"""
function _discovery_get(ctx::KuberContext, path::String; max_tries::Int = retries(ctx, false))
    url = rstrip(ctx.server, '/') * path
    headers = Pair{String,String}[get(ctx.client_kwargs, :headers, ())...]
    k8s_retry(; max_tries = max_tries) do
        resp = HTTP.get(url, headers; status_exception = false, _call_options(ctx)...)
        (200 <= resp.status <= 299) ||
            throw(KuberException(resp.status, "discovery request to $path failed", nothing, resp))
        JSON.parse(String(resp.body))
    end
end

function fetch_core_version(ctx::KuberContext; override = nothing, verbose::Bool = false, max_tries = retries(ctx, false))
    versions = String.(_discovery_get(ctx, "/api"; max_tries = max_tries)["versions"])
    preferred = override_pref("Core", versions[1], override)
    supported = String[]
    mods = Module[]
    for v in unique([preferred; versions])
        mod = get(GROUP_MODULES, v, nothing)
        if mod === nothing
            verbose && @info("unsupported Core $v")
            continue
        end
        mod in mods && continue
        push!(mods, mod)
        push!(supported, v)
    end
    isempty(mods) || (ctx.apis[:Core] = mods)
    if verbose
        @info("Core versions",
            on_apiserver = join(versions, ", "),
            preferred = preferred,
            supported = join(supported, ", "),
        )
    end
    return ctx.apis
end

function fetch_all_apis_versions(ctx::KuberContext; override = nothing, verbose::Bool = false, max_tries = retries(ctx, false))
    groups = _discovery_get(ctx, "/apis"; max_tries = max_tries)["groups"]
    for grp in groups
        name = String(grp["name"])
        preferred = override_pref(name, String(grp["preferredVersion"]["version"]), override)
        onserver = String[String(v["version"]) for v in grp["versions"]]
        supported = String[]
        mods = Module[]
        for v in unique([preferred; onserver])
            mod = get(GROUP_MODULES, string(name, "/", v), nothing)
            if mod === nothing
                verbose && @info("unsupported $name/$v")
                continue
            end
            mod in mods && continue
            push!(mods, mod)
            push!(supported, v)
        end
        isempty(mods) || (ctx.apis[Symbol(api_group(name))] = mods)
        if verbose
            @info("$name ($(api_group(name))) versions",
                on_apiserver = join(onserver, ", "),
                preferred = preferred,
                supported = join(supported, ", "),
            )
        end
    end
    return ctx.apis
end

"""
    build_model_api_map(ctx)

Map each addressable kind to the group module that serves it, for the
symbol-based simple API.

Kinds come from `KIND_TYPES`, not from a `names()` scan of the module: the old
scan pulled in every model type including ones that are not addressable
resources, while `x-kubernetes-group-version-kind` gives exactly the kinds the
API server will answer for.

Core is registered first and earlier registrations win, so the meta kinds that
every group redefines (`Status`, `WatchEvent`, `DeleteOptions`) resolve to core
deterministically rather than by dictionary order.
"""
function build_model_api_map(ctx::KuberContext)
    modelapi = ctx.modelapi
    groups = [:Core; sort!(filter(!=(:Core), collect(keys(ctx.apis))))]
    for group in groups
        haskey(ctx.apis, group) || continue
        mod = ctx.apis[group][1]     # the preferred version
        gv = MODULE_GVS[mod]
        for (apiversion, kind) in keys(KIND_TYPES)
            apiversion == gv || continue
            get!(modelapi, Symbol(kind), mod)
        end
    end
    return modelapi
end

function set_api_versions!(ctx::KuberContext; override = nothing, verbose::Bool = false, max_tries = retries(ctx, false))
    ctx.initialized = false
    empty!(ctx.apis)
    empty!(ctx.modelapi)

    fetch_core_version(ctx; override = override, verbose = verbose, max_tries = max_tries)
    fetch_all_apis_versions(ctx; override = override, verbose = verbose, max_tries = max_tries)
    build_model_api_map(ctx)

    # pod logs are addressed as their own kind but served by the core module
    haskey(ctx.modelapi, :Pod) && (ctx.modelapi[:PodLog] = ctx.modelapi[:Pod])
    ctx.initialized = true
    nothing
end

"""
    set_server(ctx, uri, reset_api_versions=false; max_tries=5, verbose=false, kwargs...)

Set the Kubernetes API server endpoint for a context.

Args:
- ctx: the context for which to set the API server endpoint
- uri: the API server endpoint uri
- reset_api_versions: whether to probe the server again for API versions supported (false by default)

Keyword Args:
- max_tries: retries allowed while probing API versions from server
- verbose: Log API versions
- kwargs: defaults for every generated client this context builds — `headers`
  (e.g. a bearer token), `request_options` (HTTP.jl options, including TLS
  configuration), `validate_requests`, …
"""
function set_server(
    ctx::KuberContext,
    uri::String = DEFAULT_URI,
    reset_api_versions::Bool = false;
    max_tries = retries(ctx, false),
    verbose::Bool = false,
    kwargs...
)
    ctx.server = uri
    isempty(kwargs) || (ctx.client_kwargs = merge(ctx.client_kwargs, NamedTuple(kwargs)))
    empty!(ctx.clients)          # clients are bound to the server they were built with
    reset_api_versions && set_api_versions!(ctx; max_tries = max_tries, verbose = verbose)
    ctx.server
end
