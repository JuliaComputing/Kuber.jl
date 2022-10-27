const DEFAULT_NAMESPACE = "default"
const DEFAULT_URI = "http://localhost:8001"

"""delay customized by TPS requirement"""
k8s_delay(tps, max_tries=1) = ExponentialBackOff(n=max_tries, first_delay=(1/tps), factor=1.75, jitter=0.1)

"""
Swagger status codes that can be retried.
0: network error (HTTP was not even attempted)
500-504: unexpected server error
"""
const k8s_retryable_codes = [0, 500, 501, 502, 503, 504]

function k8s_retry_cond(s, e, retryable_codes=k8s_retryable_codes)
    if (e isa Swagger.ApiException) && (e.status in retryable_codes)
        return (s, true)
    end
    (s, false)
end

"""
Retry api call automatically (if `max_tries > 1`) on certain retryable failures.
Backoff to use when retrying k8s APIs. The default minimum is 2 TPS.
"""
k8s_retry(f; max_tries=1, tps=2) = retry(f, delays=k8s_delay(tps,max_tries), check=k8s_retry_cond)()

const KuberEventStream = Channel{Any}

struct KApi
    api::DataType
    types::Module
end

mutable struct KuberContext
    apimodule::Module
    client::Swagger.Client
    apis::Dict{Symbol,Vector{KApi}}
    modelapi::Dict{Symbol,KApi}
    namespace::String
    default_retries::Int
    retry_all_apis::Bool
    initialized::Bool

    function KuberContext(apimodule::Module=ApiImpl; kwargs...)
        kctx = new(apimodule)

        rtfn = (default,data)->kuber_type(kctx, default, data)
        swaggerclient = Swagger.Client(DEFAULT_URI; get_return_type=rtfn, kwargs...)
        swaggerclient.headers["Connection"] = "close"

        kctx.client = swaggerclient
        kctx.apis = Dict{Symbol,Vector}()
        kctx.modelapi = Dict{Symbol,KApi}()
        kctx.namespace = DEFAULT_NAMESPACE
        kctx.default_retries = 5
        kctx.retry_all_apis = false
        kctx.initialized = false
        return kctx
    end
end

struct KuberWatchContext
    ctx::KuberContext
    stream::KuberEventStream
end

apimodule(ctx::KuberContext) = ctx.apimodule
apimodule(ctx::KuberWatchContext) = apimodule(ctx.ctx)

"""
    set_retries(ctx; count=5, all_apis=false)

Args:
- ctx: the context to set the options for

Keyword Args:
- count: how many times to retry (default 5)
- all_apis: whether to retry even mutating APIs e.g. `put!` (default false)
"""
function set_retries(ctx::KuberContext; count::Int=ctx.default_retries, all_apis::Bool=ctx.all_apis)
    ctx.default_retries = count
    ctx.retry_all_apis = all_apis
    ctx
end
retries(ctx::KuberContext, mutating::Bool=true) = (mutating && !ctx.retry_all_apis) ? 1 : ctx.default_retries
retries(watch::KuberWatchContext, mutating::Bool=true) = retries(watch.ctx, mutating)

get_client(ctx::KuberContext) = ctx.client
get_client(ctx::KuberWatchContext) = ctx.ctx.client

get_timeout(ctx::Union{KuberContext,KuberWatchContext}) = get_client(ctx).timeout[]

function set_timeout(ctx::Union{KuberContext,KuberWatchContext}, timeout::Integer)
    Swagger.set_timeout(get_client(ctx), timeout)
    ctx
end

function with_timeout(fn, ctx::Union{KuberContext,KuberWatchContext}, timeout::Integer)
    old_timeout = get_timeout(ctx)
    set_timeout(ctx, timeout)
    try
        fn(ctx)
    finally
        set_timeout(ctx, old_timeout)
    end
end

convert(::Type{Vector{UInt8}}, s::T) where {T<:AbstractString} = collect(codeunits(s))
convert(::Type{T}, json::String) where {T<:SwaggerModel} = convert(T, JSON.parse(json))
convert(::Type{Dict{String,Any}}, model::T) where {T<:SwaggerModel} = JSON.parse(JSON.json(model))

is_json_mime(mime::T) where {T <: AbstractString} = ("*/*" == mime) || occursin(r"(?i)application/json(;.*)?", mime) || occursin(r"(?i)application/(.*)-patch\+json(;.*)?", mime)

kind_to_type(ctx::KuberContext, kind::String, version::Union{String,Nothing}=nothing) = kind_to_type(ctx, Symbol(kind), version)
function kind_to_type(ctx::KuberContext, kind::Symbol, version::Union{String,Nothing}=nothing)
    types = (version === nothing) ? (ctx.modelapi[kind]).types : api_typedefs(ctx, version)
    getfield(types, kind)
end

kuber_type(ctx::KuberContext, d) = kuber_type(ctx, Any, d)
kuber_type(ctx::KuberContext, T, data::String) = kuber_type(ctx, T, JSON.parse(data))

function header(resp::Downloads.Response, name::AbstractString, defaultval::AbstractString)
    for (n,v) in resp.headers
        (n == name) && (return v)
    end
    return defaultval
end

function kuber_type(ctx::KuberContext, T, resp::Downloads.Response)
    ctype = header(resp, "Content-Type", "application/json")
    !is_json_mime(ctype) && return T
    kuber_type(ctx, T, String(copy(resp.body)))
end

function kuber_type(ctx::KuberContext, T, j::Dict{String,Any})
    if haskey(j, "kind") && !isempty(ctx.apis)
        kind = j["kind"]
        version = haskey(j, "apiVersion") ? j["apiVersion"] : nothing
        try
            T = kind_to_type(ctx, kind, version)
        catch ex
            @warn("Type not found.", kind, version)
        end
    elseif haskey(j, "type") && haskey(j, "object")
        return apimodule(ctx).Kubernetes.IoK8sApimachineryPkgApisMetaV1WatchEvent
    end
    T
end

kuber_obj(ctx::KuberContext, data::String) = kuber_obj(ctx, JSON.parse(data))
kuber_obj(ctx::KuberContext, j::Dict{String,Any}) = convert(kind_to_type(ctx, j["kind"], get(j, "apiVersion", nothing)), j)

show(io::IO, ctx::KuberContext) = print(io, "Kubernetes namespace ", ctx.namespace, " at ", ctx.client.root)

get_server(ctx::KuberContext) = ctx.client.root
get_ns(ctx::KuberContext) = ctx.namespace

"""
    set_server(ctx, uri, reset_api_versions=false; max_tries=5, kwargs...)

Set the Kubernetes API server endpoint for a context.

Args:
- ctx: the context for which to set the API server endpoint
- uri: the API server endpoint uri
- reset_api_versions: whether to probe the server again for API versions supported (false by default)

Keyword Args:
- max_tries: retries allowed while probing API versions from server
- verbose: Log API versions
- kwargs: other keyword args to pass on while constructing the client for API server (see Swagger.jl - https://github.com/JuliaComputing/Swagger.jl#readme)
"""
function set_server(
    ctx::KuberContext,
    uri::String=DEFAULT_URI,
    reset_api_versions::Bool=false;
    max_tries=retries(ctx, false),
    verbose::Bool=false,
    kwargs...
)
    rtfn = (default,data)->kuber_type(ctx, default, data)
    ctx.client = Swagger.Client(uri; get_return_type=rtfn, kwargs...)
    ctx.client.headers["Connection"] = "close"
    reset_api_versions && set_api_versions!(
        ctx;
        max_tries=max_tries,
        verbose=verbose
    )
    ctx.client
end

"""
    set_ns(ctx, namespace)

Set the namespace this context should operate with.

Args:
- ctx: the context to set the namespace for
- namespace: the namespace to set (String)
"""
set_ns(ctx::KuberContext, namespace::String) = (ctx.namespace = namespace)

camel(a) = string(uppercase(a[1])) * (a[2:end])

api_group(group) = api_group(String(group))
function api_group(group::String)
    endswith(group, ".k8s.io") && (group = group[1:end-7])
    group_parts = split(group, ".")
    join([camel(String(x)) for x in group_parts])
end

api_group_type(ctx::Union{KuberContext,KuberWatchContext}, group_ver) = api_group_type(ctx, String(group_ver))
function api_group_type(ctx::Union{KuberContext,KuberWatchContext}, group_ver::String)
    group, ver = occursin('/', group_ver) ? split(group_ver, "/") : ("Core", group_ver)
    group = api_group(group)
    ver = camel(ver)
    getfield(apimodule(ctx), Symbol(group * ver * "Api"))
end

api_typedefs(ctx::Union{KuberContext,KuberWatchContext}, group_ver) = api_typedefs(ctx, String(group_ver))
function api_typedefs(ctx::Union{KuberContext,KuberWatchContext}, group_ver::String)
    group, ver = occursin('/', group_ver) ? split(group_ver, "/") : ("Core", group_ver)
    group = api_group(group)
    ver = camel(ver)
    getfield(getfield(apimodule(ctx), :Typedefs), Symbol(group * ver))
end

# api_method(ctx::Union{KuberContext,KuberWatchContext}, group::Symbol, verb::String, object::String) = getfield(apimodule(ctx), Symbol(verb * String(group)[1:end-3] * object))
# function api_method(ctx::Union{KuberContext,KuberWatchContext}, group_ver::String, verb::String, object::String)
#     group, ver = occursin('/', group_ver) ? split(group_ver, "/") : ("Core", group_ver)
#     group = api_group(group)
#     ver = camel(ver)
#     getfield(apimodule(ctx), Symbol(verb * group * ver * object))
# end

function override_pref(name, server_pref, override)
    if override !== nothing
        for (n,v) in override
            (n == name) && (return v)
        end
    end
    server_pref
end

function fetch_misc_apis_versions(ctx::KuberContext; override=nothing, verbose::Bool=false, max_tries=retries(ctx, false))
    apis = ctx.apis
    vers = k8s_retry(; max_tries=max_tries) do
        apimodule(ctx).Kubernetes.getAPIVersions(apimodule(ctx).ApisApi(ctx.client))
    end
    api_groups = vers.groups
    for apigrp in api_groups
        name = apigrp.name
        pref_vers_type = apigrp.preferredVersion
        pref_vers_version = override_pref(name, pref_vers_type.version, override)
        pref_vers = name * "/" * pref_vers_version
        verbose && @info("$name ($(api_group(name))) versions", supported=join(map(x->x.version, apigrp.versions), ", "), preferred=pref_vers_version)

        try
            apis[Symbol(api_group(name))] = [KApi(api_group_type(ctx, pref_vers), api_typedefs(ctx, pref_vers))]
        catch ex
            if isa(ex, UndefVarError)
                @info("unsupported $pref_vers")
                continue
            else
                rethrow()
            end
        end

        for api_vers in apigrp.versions
            try
                gt = api_group_type(ctx, api_vers.groupVersion)
                td = api_typedefs(ctx, api_vers.groupVersion)
                ka = KApi(gt, td)
                kalist = apis[Symbol(api_group(name))]
                (ka == kalist[1]) || push!(kalist, ka)
            catch
                @info("unsupported $(api_vers.groupVersion)")
            end
        end
    end
    apis
end

function fetch_core_version(ctx::KuberContext; override=nothing, verbose::Bool=false, max_tries=retries(ctx, false))
    apis = ctx.apis
    api_vers = k8s_retry(; max_tries=max_tries) do
        apimodule(ctx).getCoreAPIVersions(apimodule(ctx).CoreApi(ctx.client))
    end
    name = "Core"
    pref_vers = override_pref(name, api_vers.versions[1], override)
    verbose && @info("Core versions", supported=join(api_vers.versions, ", "), preferred=pref_vers)
    apis[:Core] = [KApi(getfield(apimodule(ctx), Symbol("Core" * camel(pref_vers) * "Api")), getfield(getfield(apimodule(ctx), :Typedefs), Symbol("Core" * camel(pref_vers))))]
    for api_vers in api_vers.versions
        try
            gt = getfield(apimodule(ctx), Symbol("Core" * camel(api_vers) * "Api"))
            td = getfield(getfield(apimodule(ctx), :Typedefs), Symbol("Core" * camel(api_vers)))
            ka = KApi(gt, td)
            kalist = apis[:Core]
            (ka == kalist[1]) || push!(kalist, ka)
        catch
            @info("unsupported Core $api_vers")
        end
    end
    apis
end

function fetch_api_machinery(ctx::KuberContext)
    apis = ctx.apis
    apis[:Apis] = [KApi(apimodule(ctx).Kubernetes.ApisApi, apimodule(ctx).Typedefs.Apis)]
    apis[:MetaV1] = [KApi(apimodule(ctx).Kubernetes.ApisApi, apimodule(ctx).Typedefs.MetaV1)]
    apis
end

function build_model_api_map(ctx::KuberContext)
    #@info("building model - api map...")
    modelapi = ctx.modelapi
    for (apigroup,apivers) in ctx.apis
        apiver = apivers[1]
        types = apiver.types
        #@info("building model for $apiver")

        for name in names(types; all=true)
            (name in [:eval, Symbol("#eval"), :include, Symbol("#include"), Symbol(split(string(types), '.')[end])]) && continue
            # de-prioritize extensions for the default simpleapi mapping (so if a model already has a dedicated api version, do not use extensions)
            haskey(modelapi, name) && (types === apimodule(ctx).Typedefs.ExtensionsV1beta1) && continue
            modelapi[name] = apiver
        end
    end
    modelapi
end

function set_api_versions!(ctx::KuberContext; override=nothing, verbose::Bool=false, max_tries=retries(ctx, false))
    ctx.initialized = false
    empty!(ctx.apis)
    empty!(ctx.modelapi)

    # bootstrap: the api machinery types
    fetch_api_machinery(ctx)
    build_model_api_map(ctx)

    # fetch apis and map the types
    fetch_core_version(ctx; override=override, verbose=verbose, max_tries=max_tries)
    fetch_misc_apis_versions(ctx; override=override, verbose=verbose, max_tries=max_tries)
    build_model_api_map(ctx)

    # add custom models
    ctx.modelapi[:PodLog] = ctx.modelapi[:Pod]
    ctx.initialized = true
    nothing
end
