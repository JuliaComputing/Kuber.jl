const DEFAULT_NAMESPACE = "default"
const DEFAULT_URI = "http://localhost:8001"

struct KApi
    api::DataType
    types::Module
end

mutable struct KuberContext
    client::Swagger.Client
    apis::Dict{Symbol,Vector{KApi}}
    modelapi::Dict{Symbol,KApi}
    namespace::String
    initialized::Bool

    function KuberContext()
        ctx = Swagger.Client(DEFAULT_URI)
        ctx.headers["Connection"] = "close"
        new(ctx, Dict{Symbol,Vector}(), Dict{Symbol,KApi}(), DEFAULT_NAMESPACE, false)
    end
end

convert(::Type{Vector{UInt8}}, s::T) where {T<:AbstractString} = collect(codeunits(s))
convert(::Type{T}, json::String) where {T<:SwaggerModel} = convert(T, JSON.parse(json))
convert(::Type{Dict{String,Any}}, model::T) where {T<:SwaggerModel} = JSON.parse(JSON.json(model))

is_json_mime(mime::T) where {T <: AbstractString} = ("*/*" == mime) || occursin(r"(?i)application/json(;.*)?", mime) || occursin(r"(?i)application/(.*)-patch\+json(;.*)?", mime)

kind_to_type(ctx::KuberContext, kind::String, version::Union{String,Nothing}=nothing) = kind_to_type(ctx, Symbol(kind), version)
function kind_to_type(ctx::KuberContext, kind::Symbol, version::Union{String,Nothing}=nothing)
    types = (version === nothing) ? (ctx.modelapi[kind]).types : api_typedefs(version)
    getfield(types, kind)
end

kuber_type(ctx::KuberContext, d) = kuber_type(ctx, Any, d)
kuber_type(ctx::KuberContext, T, data::String) = kuber_type(ctx, T, JSON.parse(data))

function kuber_type(ctx::KuberContext, T, resp::HTTP.Response)
    ctype = HTTP.header(resp, "Content-Type", "application/json")
    !is_json_mime(ctype) && return T
    kuber_type(ctx, T, String(copy(resp.body)))
end

function kuber_type(ctx::KuberContext, T, j::Dict{String,Any})
    if ("kind" in keys(j)) && !isempty(ctx.apis)
        kind = j["kind"]
        version = ("apiVersion" in keys(j)) ? j["apiVersion"] : nothing
        try
            T = kind_to_type(ctx, kind, version)
        catch ex
            @warn("Type not found.", kind, version)
        end
    end
    T
end

kuber_obj(ctx::KuberContext, data::String) = kuber_obj(ctx, JSON.parse(data))
kuber_obj(ctx::KuberContext, j::Dict{String,Any}) = convert(kind_to_type(ctx, j["kind"], get(j, "apiVersion", nothing)), j)

show(io::IO, ctx::KuberContext) = print("Kubernetes namespace ", ctx.namespace, " at ", ctx.client.root)

get_server(ctx::KuberContext) = ctx.client.root
get_ns(ctx::KuberContext) = ctx.namespace

function set_server(ctx::KuberContext, uri::String=DEFAULT_URI, reset_api_versions::Bool=false; max_tries=1, kwargs...)
    rtfn = (default,data)->kuber_type(ctx, default, data)
    ctx.client = Swagger.Client(uri; get_return_type=rtfn, kwargs...)
    ctx.client.headers["Connection"] = "close"
    reset_api_versions && set_api_versions!(ctx; max_tries=max_tries)
    ctx.client
end

set_ns(ctx::KuberContext, namespace::String) = (ctx.namespace = namespace)

camel(a) = string(uppercase(a[1])) * (a[2:end])

api_group(group) = api_group(String(group))
function api_group(group::String)
    endswith(group, ".k8s.io") && (group = group[1:end-7])
    group_parts = split(group, ".")
    join([camel(String(x)) for x in group_parts])
end

api_group_type(group_ver) = api_group_type(String(group_ver))
function api_group_type(group_ver::String)
    group, ver = occursin('/', group_ver) ? split(group_ver, "/") : ("Core", group_ver)
    group = api_group(group)
    ver = camel(ver)
    getfield(@__MODULE__, Symbol(group * ver * "Api"))
end

api_typedefs(group_ver) = api_typedefs(String(group_ver))
function api_typedefs(group_ver::String)
    group, ver = occursin('/', group_ver) ? split(group_ver, "/") : ("Core", group_ver)
    group = api_group(group)
    ver = camel(ver)
    getfield(getfield(@__MODULE__, :Typedefs), Symbol(group * ver))
end

api_method(group::Symbol, verb::String, object::String) = getfield(@__MODULE__, Symbol(verb * String(group)[1:end-3] * object))
function api_method(group_ver::String, verb::String, object::String)
    group, ver = occursin('/', group_ver) ? split(group_ver, "/") : ("Core", group_ver)
    group = api_group(group)
    ver = camel(ver)
    getfield(@__MODULE__, Symbol(verb * group * ver * object))
end

function override_pref(name, server_pref, override)
    if override !== nothing
        for (n,v) in override
            (n == name) && (return v)
        end
    end
    server_pref
end

function fetch_misc_apis_versions(ctx::KuberContext; override=nothing, verbose::Bool=false, max_tries=1)
    apis = ctx.apis
    vers = @repeat max_tries try
        getAPIVersions(ApisApi(ctx.client))
    catch e
        @retry if isa(e, IOError)
            @debug("Retrying getAPIVersions")
            sleep(2)
        end
    end
    api_groups = vers.groups
    for apigrp in api_groups
        name = apigrp.name
        pref_vers_type = apigrp.preferredVersion
        pref_vers_version = override_pref(name, pref_vers_type.version, override)
        pref_vers = name * "/" * pref_vers_version
        verbose && @info("$name ($(api_group(name))) versions", supported=join(map(x->x.version, apigrp.versions), ", "), preferred=pref_vers_version)

        try
            apis[Symbol(api_group(name))] = [KApi(api_group_type(pref_vers), api_typedefs(pref_vers))]
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
                gt = api_group_type(api_vers.groupVersion)
                td = api_typedefs(api_vers.groupVersion)
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

function fetch_core_version(ctx::KuberContext; override=nothing, verbose::Bool=false, max_tries=1)
    apis = ctx.apis
    api_vers = @repeat max_tries try
        getCoreAPIVersions(CoreApi(ctx.client))
    catch e
        @retry if isa(e, IOError)
            @debug("Retrying getCoreAPIVersions")
            sleep(2)
        end
    end
    name = "Core"
    pref_vers = override_pref(name, api_vers.versions[1], override)
    verbose && @info("Core versions", supported=join(api_vers.versions, ", "), preferred=pref_vers)
    apis[:Core] = [KApi(getfield(@__MODULE__, Symbol("Core" * camel(pref_vers) * "Api")), getfield(getfield(@__MODULE__, :Typedefs), Symbol("Core" * camel(pref_vers))))]
    for api_vers in api_vers.versions
        try
            gt = getfield(@__MODULE__, Symbol("Core" * camel(api_vers) * "Api"))
            td = getfield(getfield(@__MODULE__, :Typedefs), Symbol("Core" * camel(api_vers)))
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
    apis[:Apis] = [KApi(Kuber.Kubernetes.ApisApi, Kuber.Typedefs.Apis)]
    apis[:MetaV1] = [KApi(Kuber.Kubernetes.ApisApi, Kuber.Typedefs.MetaV1)]
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
            haskey(modelapi, name) && (types === Kuber.Typedefs.ExtensionsV1beta1) && continue
            modelapi[name] = apiver
        end
    end
    modelapi
end

function set_api_versions!(ctx::KuberContext; override=nothing, verbose::Bool=false, max_tries=1)
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

"""
Retry function `f` for `max_tries` number of times if function fails with `IOError`
"""
function retry_on_error(f::Function; max_tries=1)
    @repeat max_tries try
        return f()
    catch e
        @retry if isa(e, IOError)
            @debug("Retrying Kubernetes API call ...")
            sleep(2)
        end
    end
end

"""
Macro to retry an expression on `IOError`. Note that the variable `max_tries` needs to be inscope for this to work.
"""
macro retry_on_error(e)
   esc(quote
      retry_on_error(;max_tries=max_tries) do
          $(e)
      end
   end)
end
