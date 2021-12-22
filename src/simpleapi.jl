# simple Julia APIs over Kubernetes Swagger interface

function sel(label::String, op::Symbol)
    @assert op === :exists
    label
end
sel(label::String, op::Symbol, items::String...) = label * " " * string(op) * " (" * join(items, ",") * ")"
sel(cnd::String...) = join(cnd, ", ")

_delopts(; kwargs...) = Typedefs.MetaV1.DeleteOptions(; preconditions=Typedefs.MetaV1.Preconditions(; kwargs...), kwargs...)

_kubectx(ctx::KuberContext) = ctx
_kubectx(ctx::KuberWatchContext) = ctx.ctx

function _get_apictx(ctx::Union{KuberContext,KuberWatchContext}, O::Symbol, apiversion::Union{String,Nothing}; max_tries::Int=retries(ctx, false))
    kubectx = _kubectx(ctx)
    kubectx.initialized || set_api_versions!(kubectx; max_tries=max_tries)

    if apiversion !== nothing
        k = Kuber.api_group_type(ctx, apiversion)
        apictx = k(kubectx.client)
    else
        kapi = kubectx.modelapi[O]
        apictx = kapi.api(kubectx.client)
    end
    apictx
end

_api_function(ctx::Union{KuberContext,KuberWatchContext}, name::Symbol) = isdefined(apimodule(ctx), name) ? apimodule(ctx).eval(name) : nothing
_api_function(ctx::Union{KuberContext,KuberWatchContext}, name) = _api_function(ctx, Symbol(name))

function watch(fn::Function, ctx::KuberContext; buffersize::Int=1024, stream::KuberEventStream=KuberEventStream(buffersize))
    watchctx = KuberWatchContext(ctx, stream)
    fn(watchctx, stream)
end

function watch(streamprocessor::Function, ctx::KuberContext, watched::Function, args...; kwargs...)
    watch(ctx) do watchctx, stream
        @sync begin
            @async try
                watched(watchctx, args...; kwargs...)
            finally
                close(stream)
            end
            @async streamprocessor(stream)
        end
    end
end

function list(ctx::Union{KuberContext,KuberWatchContext}, O::Symbol, name::String;
        apiversion::Union{String,Nothing}=nothing,
        namespace::Union{String,Nothing}=_kubectx(ctx).namespace,
        max_tries::Int=retries(ctx, false),
        watch=isa(ctx, KuberWatchContext),
        resourceVersion=nothing,
        kwargs...)
    apictx = _get_apictx(ctx, O, apiversion; max_tries=max_tries)
    namespaced = (namespace !== nothing) && !isempty(namespace)
    allnamespaces = namespaced && (namespace == "*")

    eventstream = isa(ctx, KuberWatchContext) ? ctx.stream : nothing
    result = nothing
    args = Any[name]
    if allnamespaces
        apicall = apimodule(ctx).eval(Symbol("list$(O)ForAllNamespaces"))
    elseif namespaced
        apicall = apimodule(ctx).eval(Symbol("listNamespaced$O"))
        push!(args, namespace)
    else
        apicall = apimodule(ctx).eval(Symbol("list$O"))
    end

    if !watch || resourceVersion === nothing
        result = k8s_retry(; max_tries=max_tries) do
            apicall(apictx, args...; kwargs...)
        end
    end

    # if not watching, return the first result
    watch || (return result)
    if result !== nothing
        resourceVersion = result.metadata.resourceVersion
        # push the first Event consisting of existing data
        put!(eventstream, result)
    end

    # start watch and return the HTTP response object on completion
    return k8s_retry(; max_tries=max_tries) do
        apicall(apictx, eventstream, args...; watch=watch, resourceVersion=resourceVersion, kwargs...)
    end
end

function list(ctx::Union{KuberContext,KuberWatchContext}, O::Symbol;
        apiversion::Union{String,Nothing}=nothing,
        namespace::Union{String,Nothing}=_kubectx(ctx).namespace,
        max_tries::Int=retries(ctx, false),
        watch=isa(ctx, KuberWatchContext),
        resourceVersion=nothing,
        kwargs...)
    apictx = _get_apictx(ctx, O, apiversion; max_tries=max_tries)
    namespaced = (namespace !== nothing) && !isempty(namespace)
    allnamespaces = namespaced && (namespace == "*")

    eventstream = isa(ctx, KuberWatchContext) ? ctx.stream : nothing

    result = nothing
    args = Any[]
    if allnamespaces
        apicall = apimodule(ctx).eval(Symbol("list$(O)ForAllNamespaces"))
    elseif namespaced
        apicall = apimodule(ctx).eval(Symbol("listNamespaced$O"))
        push!(args, namespace)
    else
        apicall = apimodule(ctx).eval(Symbol("list$O"))
    end

    if !watch || resourceVersion === nothing
        result = k8s_retry(; max_tries=max_tries) do
            apicall(apictx, args...; kwargs...)
        end
    end

    # if not watching, retuen the first result
    watch || (return result)
    if result !== nothing
        resourceVersion = result.metadata.resourceVersion
        # push the first Event consisting of existing data
        put!(eventstream, result)
    end

    # start watch and return the HTTP response object on completion
    return k8s_retry(; max_tries=max_tries) do
        apicall(apictx, eventstream, args...; watch=watch, resourceVersion=resourceVersion, kwargs...)
    end
end

function get(ctx::Union{KuberContext,KuberWatchContext}, O::Symbol, name::String;
        apiversion::Union{String,Nothing}=nothing,
        max_tries::Integer=retries(ctx),
        watch=isa(ctx, KuberWatchContext),
        resourceVersion=nothing,
        kwargs...)
    apictx = _get_apictx(ctx, O, apiversion; max_tries=max_tries)

    eventstream = isa(ctx, KuberWatchContext) ? ctx.stream : nothing
    result = nothing
    args = Any[name]
    if (apicall = _api_function(ctx, "read$O")) !== nothing
        # nothing
    elseif (apicall = _api_function(ctx, "readNamespaced$O")) !== nothing
        push!(args, _kubectx(ctx).namespace)
    else
        throw(ArgumentError("No API functions could be located using :$O"))
    end

    if !watch || resourceVersion === nothing
        result = k8s_retry(; max_tries=max_tries) do
            apicall(apictx, args...; kwargs...)
        end
    end

    # if not watching, retuen the first result
    watch || (return result)
    if result !== nothing
        resourceVersion = result.metadata.resourceVersion
        # push the first Event consisting of existing data
        put!(eventstream, result)
    end

    # start watch and return the HTTP response object on completion
    return k8s_retry(; max_tries=max_tries) do
        apicall(apictx, eventstream, args...; watch=watch, resourceVersion=resourceVersion, kwargs...)
    end
end

function get(ctx::Union{KuberContext,KuberWatchContext}, O::Symbol;
        apiversion::Union{String,Nothing}=nothing,
        label_selector=nothing,
        namespace::Union{String,Nothing}=_kubectx(ctx).namespace,
        max_tries::Integer=retries(ctx, false),
        watch=isa(ctx, KuberWatchContext),
        resourceVersion=nothing,
        kwargs...)
    apictx = _get_apictx(ctx, O, apiversion; max_tries=max_tries)

    eventstream = isa(ctx, KuberWatchContext) ? ctx.stream : nothing
    result = nothing
    args = Any[]
    apiname = "list$O"
    namespace === nothing && (apiname *= "ForAllNamespaces")
    if (apicall = _api_function(ctx, apiname)) !== nothing
        # nothing
    elseif (apicall = _api_function(ctx, "listNamespaced$O")) !== nothing
        push!(args, namespace)
    else
        throw(ArgumentError("No API functions could be located using :$O"))
    end

    if !watch || resourceVersion === nothing
        result = k8s_retry(; max_tries=max_tries) do
            apicall(apictx, args...; labelSelector=label_selector, kwargs...)
        end
    end

    # if not watching, retuen the first result
    watch || (return result)
    if result !== nothing
        resourceVersion = result.metadata.resourceVersion
        # push the first Event consisting of existing data
        put!(eventstream, result)
    end

    # start watch and return the HTTP response object on completion
    return k8s_retry(; max_tries=max_tries) do
        apicall(apictx, eventstream, args...; watch=watch, resourceVersion=resourceVersion, labelSelector=label_selector, kwargs...)
    end
end

function watch(ctx::KuberContext, O::Symbol, outstream::Channel, name::String;
        apiversion::Union{String,Nothing}=nothing,
        namespace::Union{String,Nothing}=ctx.namespace,
        max_tries::Int=retries(ctx, false),
        kwargs...)
    apictx = _get_apictx(ctx, O, apiversion; max_tries=max_tries)
    namespaced = (namespace !== nothing) && !isempty(namespace)
    allnamespaces = namespaced && (namespace == "*")

    if allnamespaces
        apicall = apimodule(ctx).eval(Symbol("watch$(O)ForAllNamespaces"))
        return k8s_retry(; max_tries=max_tries) do
            apicall(apictx, outstream, name; kwargs...)
        end
    elseif namespaced
        apicall = apimodule(ctx).eval(Symbol("watchNamespaced$O"))
        return k8s_retry(; max_tries=max_tries) do
            apicall(apictx, outstream, name, namespace; kwargs...)
        end
    else
        apicall = apimodule(ctx).eval(Symbol("watch$O"))
        return k8s_retry(; max_tries=max_tries) do
            apicall(apictx, outstream, name; kwargs...)
        end
    end
end

function watch(ctx::KuberContext, O::Symbol, outstream::Channel;
        apiversion::Union{String,Nothing}=nothing,
        namespace::Union{String,Nothing}=ctx.namespace,
        max_tries::Int=retries(ctx, false),
        kwargs...)
    apictx = _get_apictx(ctx, O, apiversion; max_tries=max_tries)
    namespaced = (namespace !== nothing) && !isempty(namespace)
    allnamespaces = namespaced && (namespace == "*")

    if allnamespaces
        apicall = apimodule(ctx).eval(Symbol("watch$(O)ForAllNamespaces"))
        return k8s_retry(; max_tries=max_tries) do
            apicall(apictx, outstream; kwargs...)
        end
    elseif namespaced
        apicall = apimodule(ctx).eval(Symbol("watchNamespaced$O"))
        return k8s_retry(; max_tries=max_tries) do
            apicall(apictx, outstream, namespace; kwargs...)
        end
    else
        apicall = apimodule(ctx).eval(Symbol("watch$O"))
        return k8s_retry(; max_tries=max_tries) do
            apicall(apictx, outstream; kwargs...)
        end
    end
end

function put!(ctx::KuberContext, v::T; max_tries::Int=retries(ctx, true)) where {T<:SwaggerModel}
    vjson = convert(Dict{String,Any}, v)
    put!(ctx, Symbol(vjson["kind"]), vjson; max_tries=max_tries)
end

function put!(ctx::KuberContext, O::Symbol, d::Dict{String,Any}; max_tries::Int=retries(ctx, true))
    apictx = _get_apictx(ctx, O, get(d, "apiVersion", nothing))
    if (apicall = _api_function(ctx, "create$O")) !== nothing
        return k8s_retry(; max_tries=max_tries) do
            apicall(apictx, d)
        end
    elseif (apicall = _api_function(ctx, "createNamespaced$O")) !== nothing
        return k8s_retry(; max_tries=max_tries) do
            apicall(apictx, ctx.namespace, d)
        end
    else
        throw(ArgumentError("No API functions could be located using :$O"))
    end
end

function delete!(ctx::KuberContext, v::T; max_tries::Int=retries(ctx, true), kwargs...) where {T<:SwaggerModel}
    vjson = convert(Dict{String,Any}, v)
    kind = vjson["kind"]
    name = vjson["metadata"]["name"]
    delete!(ctx, Symbol(kind), name; apiversion=get(vjson, "apiVersion", nothing), max_tries=max_tries, kwargs...)
end

function delete!(ctx::KuberContext, O::Symbol, name::String; apiversion::Union{String,Nothing}=nothing, max_tries::Int=retries(ctx, true), kwargs...)
    apictx = _get_apictx(ctx, O, apiversion)

    params = [apictx, name]

    if (apicall = _api_function(ctx, "delete$O")) !== nothing
        return k8s_retry(; max_tries=max_tries) do
            apicall(params...; kwargs...)
        end
    elseif (apicall = _api_function(ctx, "deleteNamespaced$O")) !== nothing
        push!(params, ctx.namespace)
        return k8s_retry(; max_tries=max_tries) do
            apicall(params...; kwargs...)
        end
    else
        throw(ArgumentError("No API functions could be located using :$O"))
    end
end

function update!(ctx::KuberContext, v::T, patch, patch_type; max_tries::Int=retries(ctx, true)) where {T<:SwaggerModel}
    vjson = convert(Dict{String,Any}, v)
    kind = vjson["kind"]
    name = vjson["metadata"]["name"]
    update!(ctx, Symbol(kind), name, patch, patch_type; apiversion=get(vjson, "apiVersion", nothing), max_tries=max_tries)
end

function update!(ctx::KuberContext, O::Symbol, name::String, patch, patch_type; apiversion::Union{String,Nothing}=nothing, max_tries::Int=retries(ctx, true))
    apictx = _get_apictx(ctx, O, apiversion)

    if (apicall = _api_function(ctx, "patch$O")) !== nothing
        return k8s_retry(; max_tries=max_tries) do
            apicall(apictx, name, patch; _mediaType=patch_type)
        end
    elseif (apicall = _api_function(ctx, "patchNamespaced$O")) !== nothing
        return k8s_retry(; max_tries=max_tries) do
            apicall(apictx, name, ctx.namespace, patch; _mediaType=patch_type)
        end
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
