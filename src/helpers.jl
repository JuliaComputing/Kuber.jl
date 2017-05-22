const DEFAULT_NAMESPACE = "default"
const DEFAULT_URI = "http://localhost:8001/"

immutable KApi
    api::DataType
    types::Module
end

type KuberContext
    client::Swagger.Client
    apis::Dict{Symbol,Vector{KApi}}
    modelapi::Dict{Symbol,KApi}
    namespace::String

    function KuberContext()
        new(Swagger.Client(DEFAULT_URI), Dict{Symbol,Vector}(), Dict{Symbol,KApi}(), DEFAULT_NAMESPACE)
    end
end

convert{T<:SwaggerModel}(::Type{T}, json::String) = convert(T, JSON.parse(json))
convert{T<:SwaggerModel}(::Type{Dict{String,Any}}, model::T) = JSON.parse(JSON.json(model))

is_json_mime(mime::String) = ("*/*" == mime) || ismatch(r"(?i)application/json(;.*)?", mime)

# TODO: optionally take apiVersion string, instead of taking preferred version from the context
kind_to_type(ctx::KuberContext, kind::String) = kind_to_type(ctx, Symbol(kind))
function kind_to_type(ctx::KuberContext, kind::Symbol)
    kapi = ctx.modelapi[kind]
    eval(kapi.types, kind)
end

kuber_type(ctx::KuberContext, d) = kuber_type(ctx, Any, d)
kuber_type(ctx::KuberContext, T, data::String) = kuber_type(ctx, T, JSON.parse(data))

function kuber_type(ctx::KuberContext, T, resp::Response)
    ctype = get(resp.headers, "Content-Type", "application/json")
    !is_json_mime(ctype) && return T
    kuber_type(ctx, T, String(resp.data))
end

function kuber_type(ctx::KuberContext, T, j::Dict{String,Any})
    if ("kind" in keys(j)) && !isempty(ctx.apis)
        try
            T = kind_to_type(ctx, j["kind"])
        catch
            println(STDERR, "Type not found: $(j["kind"])")
        end
    end
    T
end

kuber_obj(ctx::KuberContext, data::String) = kuber_obj(ctx, JSON.parse(data))
kuber_obj(ctx::KuberContext, j::Dict{String,Any}) = convert(kind_to_type(ctx, j["kind"]), j)

show(io::IO, ctx::KuberContext) = print("Kubernetes namespace ", ctx.namespace, " at ", ctx.client.root)

get_server(ctx::KuberContext) = ctx.client.root
get_ns(ctx::KuberContext) = ctx.namespace

function set_server(ctx::KuberContext, uri::String=DEFAULT_URI, reset_api_versions::Bool=false; kwargs...)
    rtfn = (default,data)->kuber_type(ctx, default, data)
    ctx.client = Swagger.Client(uri; get_return_type=rtfn, kwargs...)
    reset_api_versions && set_api_versions!(ctx)
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

api_group_type(group_name) = api_group_type(String(group_name))
function api_group_type(group_name::String)
    group, ver = split(group_name, "/")
    group = api_group(group)
    ver = camel(ver)
    eval(Symbol(group * ver * "Api"))
end

api_typedefs(group_name) = api_typedefs(String(group_name))
function api_typedefs(group_name::String)
    group, ver = split(group_name, "/")
    group = api_group(group)
    ver = camel(ver)
    eval(eval(:Typedefs), Symbol(group * ver))
end

function api_method(group_name::String, verb::String, object::String)
    group, ver = split(group_name, "/")
    endswith(group, ".k8s.io") && (group = group[1:end-7])
    group_parts = split(group, ".")
    group = join([camel(String(x)) for x in group_parts])
    ver = camel(ver)
    eval(Symbol(verb * group * ver * object))
end

api_method(group::Symbol, verb::String, object::String) = eval(Symbol(verb * String(group)[1:end-3] * object))

function fetch_misc_apis_versions(ctx::KuberContext)
    apis = ctx.apis
    vers = getAPIVersions(ApisApi(ctx.client))
    api_groups = get(vers.groups)
    for apigrp in api_groups
        name = get(apigrp.name)
        pref_vers_type = get(apigrp.preferredVersion)
        pref_vers = get(pref_vers_type.groupVersion)
        apis[Symbol(api_group(name))] = [KApi(api_group_type(pref_vers), api_typedefs(pref_vers))]
        for api_vers in get(apigrp.versions)
            try
                gt = api_group_type(get(api_vers.groupVersion))
                td = api_typedefs(get(api_vers.groupVersion))
                ka = KApi(gt, td)
                kalist = apis[Symbol(api_group(name))]
                (ka == kalist[1]) || push!(kalist, ka)
            catch
                info("unsupported ", get(api_vers.groupVersion))
            end
        end
    end
    apis
end

function fetch_core_version(ctx::KuberContext)
    apis = ctx.apis
    api_vers = getCoreAPIVersions(CoreApi(ctx.client))
    name = "Core"
    pref_vers = get(api_vers.versions)[1]
    apis[:Core] = [KApi(eval(Symbol("Core" * camel(pref_vers) * "Api")), eval(eval(:Typedefs), Symbol("Core" * camel(pref_vers))))]
    for api_vers in get(api_vers.versions)
        try
            gt = eval(Symbol("Core" * camel(api_vers) * "Api"))
            td = eval(eval(:Typedefs), Symbol("Core" * camel(api_vers)))
            ka = KApi(gt, td)
            kalist = apis[:Core]
            (ka == kalist[1]) || push!(kalist, ka)
        catch
            info("unsupported Core ", api_vers)
        end
    end
    apis
end

function fetch_api_machinery(ctx::KuberContext)
    apis = ctx.apis
    apis[:Apis] = [KApi(Kuber.Kubernetes.ApisApi, Kuber.Typedefs.Apis)]
    apis
end

function build_model_api_map(ctx::KuberContext)
    #info("building model - api map...")
    modelapi = ctx.modelapi
    for (apigroup,apivers) in ctx.apis
        apiver = apivers[1]
        types = apiver.types
        #info("building model for ", apiver)

        for name in names(types, true)
            ((name === :eval) || (name === Symbol("#eval")) || (name === Symbol(split(string(types), '.')[end]))) && continue
            modelapi[name] = apiver
        end
    end
    modelapi
end

function set_api_versions!(ctx::KuberContext)
    empty!(ctx.apis)
    empty!(ctx.modelapi)

    # bootstrap: the api machinery types
    fetch_api_machinery(ctx)
    build_model_api_map(ctx)

    # fetch apis and map the types
    fetch_core_version(ctx)
    fetch_misc_apis_versions(ctx)
    build_model_api_map(ctx)
    nothing
end
