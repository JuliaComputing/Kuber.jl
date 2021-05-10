# simple Julia APIs over Kubernetes Swagger interface

function sel(label::String, op::Symbol)
    @assert op === :exists
    label
end
sel(label::String, op::Symbol, items::String...) = label * " " * string(op) * " (" * join(items, ",") * ")"
sel(cnd::String...) = join(cnd, ", ")

_delopts(; kwargs...) = Typedefs.MetaV1.DeleteOptions(; preconditions=Typedefs.MetaV1.Preconditions(; kwargs...), kwargs...)

function _get_apictx(ctx::KuberContext, O::Symbol, apiversion::Union{String,Nothing})
    if apiversion !== nothing
        k = Kuber.api_group_type(apiversion)
        apictx = k(ctx.client)
    else
        kapi = ctx.modelapi[O]
        apictx = kapi.api(ctx.client)
    end
    apictx
end

_api_function(name::Symbol) = isdefined(@__MODULE__, name) ? eval(name) : nothing
_api_function(name) = _api_function(Symbol(name))

function list(ctx::KuberContext, O::Symbol, name::String; apiversion::Union{String,Nothing}=nothing, namespace::Union{String,Nothing}=ctx.namespace, kwargs...)
    ctx.initialized || set_api_versions!(ctx)

    apictx = _get_apictx(ctx, O, apiversion)
    namespaced = (namespace !== nothing) && !isempty(namespace)
    allnamespaces = namespaced && (namespace == "*")

    if allnamespaces
        apicall = eval(Symbol("list$(O)ForAllNamespaces"))
        return apicall(apictx, name; kwargs...)
    elseif namespaced
        apicall = eval(Symbol("listNamespaced$O"))
        return apicall(apictx, name, namespace; kwargs...)
    else
        apicall = eval(Symbol("list$O"))
        return apicall(apictx, name; kwargs...)
    end
end

function list(ctx::KuberContext, O::Symbol; apiversion::Union{String,Nothing}=nothing, namespace::Union{String,Nothing}=ctx.namespace, kwargs...)
    ctx.initialized || set_api_versions!(ctx)

    apictx = _get_apictx(ctx, O, apiversion)
    namespaced = (namespace !== nothing) && !isempty(namespace)
    allnamespaces = namespaced && (namespace == "*")

    if allnamespaces
        apicall = eval(Symbol("list$(O)ForAllNamespaces"))
        return apicall(apictx; kwargs...)
    elseif namespaced
        apicall = eval(Symbol("listNamespaced$O"))
        return apicall(apictx, namespace; kwargs...)
    else
        apicall = eval(Symbol("list$O"))
        return apicall(apictx; kwargs...)
    end
end

function get(ctx::KuberContext, O::Symbol, name::String; apiversion::Union{String,Nothing}=nothing, max_tries::Integer=1, kwargs...)
    ctx.initialized || set_api_versions!(ctx; max_tries=max_tries)

    apictx = _get_apictx(ctx, O, apiversion)
    if (apicall = _api_function("read$O")) !== nothing
        @repeat max_tries try
            return apicall(apictx, name; kwargs...)
        catch e
            @retry if isa(e, IOError)
                @debug("Retrying ", nameof(apicall))
                sleep(2)
            end
        end
    elseif (apicall = _api_function("readNamespaced$O")) !== nothing
        @repeat max_tries try
            return apicall(apictx, name, ctx.namespace; kwargs...)
        catch e
            @retry if isa(e, IOError)
                @debug("Retrying ", nameof(apicall))
                sleep(2)
            end
        end
    else
        throw(ArgumentError("No API functions could be located using :$O"))
    end
end

function get(ctx::KuberContext, O::Symbol; apiversion::Union{String,Nothing}=nothing, label_selector=nothing, namespace::Union{String,Nothing}=ctx.namespace, max_tries::Integer=1)
    ctx.initialized || set_api_versions!(ctx; max_tries=max_tries)

    apictx = _get_apictx(ctx, O, apiversion)
    apiname = "list$O"
    namespace === nothing && (apiname *= "ForAllNamespaces")
    if (apicall = _api_function(apiname)) !== nothing
        @repeat max_tries try
            return apicall(apictx; labelSelector=label_selector)
        catch e
            @retry if isa(e, IOError)
                @debug("Retrying ", nameof(apicall))
                sleep(2)
            end
        end
    elseif (apicall = _api_function("listNamespaced$O")) !== nothing
        @repeat max_tries try
            return apicall(apictx, namespace; labelSelector=label_selector)
        catch e
            @retry if isa(e, IOError)
                @debug("Retrying ", nameof(apicall))
                sleep(2)
            end
        end
    else
        throw(ArgumentError("No API functions could be located using :$O"))
    end
end

function put!(ctx::KuberContext, v::T) where {T<:SwaggerModel}
    vjson = convert(Dict{String,Any}, v)
    put!(ctx, Symbol(vjson["kind"]), vjson)
end

function put!(ctx::KuberContext, O::Symbol, d::Dict{String,Any})
    ctx.initialized || set_api_versions!(ctx)

    apictx = _get_apictx(ctx, O, get(d, "apiVersion", nothing))
    if (apicall = _api_function("create$O")) !== nothing
        return apicall(apictx, d)
    elseif (apicall = _api_function("createNamespaced$O")) !== nothing
        return apicall(apictx, ctx.namespace, d)
    else
        throw(ArgumentError("No API functions could be located using :$O"))
    end
end

function delete!(ctx::KuberContext, v::T; kwargs...) where {T<:SwaggerModel}
    vjson = convert(Dict{String,Any}, v)
    kind = vjson["kind"]
    name = vjson["metadata"]["name"]
    delete!(ctx, Symbol(kind), name; apiversion=get(vjson, "apiVersion", nothing), kwargs...)
end

function delete!(ctx::KuberContext, O::Symbol, name::String; apiversion::Union{String,Nothing}=nothing, kwargs...)
    ctx.initialized || set_api_versions!(ctx)
    apictx = _get_apictx(ctx, O, apiversion)

    params = [apictx, name]

    if (apicall = _api_function("delete$O")) !== nothing
        return apicall(params...; kwargs...)
    elseif (apicall = _api_function("deleteNamespaced$O")) !== nothing
        push!(params, ctx.namespace)
        return apicall(params...; kwargs...)
    else
        throw(ArgumentError("No API functions could be located using :$O"))
    end
end

function update!(ctx::KuberContext, v::T, patch, patch_type) where {T<:SwaggerModel}
    vjson = convert(Dict{String,Any}, v)
    kind = vjson["kind"]
    name = vjson["metadata"]["name"]
    update!(ctx, Symbol(kind), name, patch, patch_type; apiversion=get(vjson, "apiVersion", nothing))
end

function update!(ctx::KuberContext, O::Symbol, name::String, patch, patch_type; apiversion::Union{String,Nothing}=nothing)
    ctx.initialized || set_api_versions!(ctx)

    apictx = _get_apictx(ctx, O, apiversion)

    if (apicall = _api_function("patch$O")) !== nothing
        return apicall(apictx, name, patch; _mediaType=patch_type)
    elseif (apicall = _api_function("patchNamespaced$O")) !== nothing
        return apicall(apictx, name, ctx.namespace, patch; _mediaType=patch_type)
    else
        throw(ArgumentError("No API functions could be located using :$O"))
    end
end

"""
Fetch logs of the specified Pod

Parameters:
- name::String (required)

Keyword Args:
- container::String : The container for which to stream logs. Defaults to only container if there is one container in the pod.
- follow::Bool : Follow the log stream of the pod. Defaults to false.
- limitBytes::Int32 : If set, the number of bytes to read from the server before terminating the log output. This may not display a complete final line of logging, and may return slightly more or slightly less than the specified limit.
- pretty::String : If 'true', then the output is pretty printed.
- previous::Bool : Return previous terminated container logs. Defaults to false.
- sinceSeconds::Int32 : A relative time in seconds before the current time from which to show logs. If this value precedes the time a pod was started, only logs since the pod start will be returned. If this value is in the future, no logs will be returned. Only one of sinceSeconds or sinceTime may be specified.
- sinceTime::String : An RFC3339 timestamp from which to show logs. If this value precedes the time a pod was started, only logs since the pod start will be returned. If this value is in the future, no logs will be returned. Only one of sinceSeconds or sinceTime may be specified.
- tailLines::Int32 : If set, the number of lines from the end of the logs to show. If not specified, logs are shown from the creation of the container or sinceSeconds or sinceTime
- timestamps::Bool : If true, add an RFC3339 or RFC3339Nano timestamp at the beginning of every line of log output. Defaults to false.

Returns: String of all log entries, one per line
"""
get_logs(ctx::KuberContext, pod_name::String; kwargs...) = get(ctx, :PodLog, pod_name; kwargs...)

list_namespaced_custom_metrics(ctx::KuberContext, metricname::String; kwargs...) = list(ctx, :MetricValue, "metrics/"*metricname; kwargs...)
list_namespaced_custom_metrics(ctx::KuberContext, objecttype::String, metricname::String; kwargs...) = list(ctx, :MetricValue, objecttype * "/*/" * metricname; kwargs...)
list_namespaced_custom_metrics(ctx::KuberContext, objecttype::String, objectname::String, metricname::String; kwargs...) = list(ctx, :MetricValue, objecttype * "/" * objectname * "/" * metricname; kwargs...)

list_custom_metrics(ctx::KuberContext, objecttype::String, metricname::String; kwargs...) = list(ctx, :MetricValue, objecttype * "/*/" * metricname; namespace=nothing, kwargs...)
list_custom_metrics(ctx::KuberContext, objecttype::String, objectname::String, metricname::String; kwargs...) = list(ctx, :MetricValue, objecttype * "/" * objectname * "/" * metricname; namespace=nothing, kwargs...)
