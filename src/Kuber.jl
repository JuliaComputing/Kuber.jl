module Kuber

include("api/Kubernetes.jl")
using .Kubernetes
using JSON
using Swagger

import Base: convert, get, put!
import Swagger: SwaggerModel

convert{T<:SwaggerModel}(::Type{T}, json::String) = convert(T, JSON.parse(json))

macro K_str(json)
    quote
        j = JSON.parse($json)
        eval(Symbol(j["kind"]))(j)
    end
end

export @K_str

##
# default global context to make apis easy

const DEFAULT_NAMESPACE = "default"
const DEFAULT_URI = "http://localhost:8001/"

type KuberContext
    api::DefaultApi
    namespace::String

    function KuberContext()
        new(DefaultApi(Swagger.Client(DEFAULT_URI)), DEFAULT_NAMESPACE)
    end
end

const _global_ctx = KuberContext()

function set_server(uri::String=DEFAULT_URI)
    global _global_ctx
    client = Swagger.Client(uri)
    _global_ctx.api = DefaultApi(client)
end

function set_ns(namespace::String)
    global _global_ctx
    _global_ctx.namespace = namespace
end

# simpler names for frequent types
typealias ComponentStatus           V1ComponentStatus
typealias Endpoints                 V1Endpoints
typealias Namespace                 V1Namespace
typealias Pod                       V1Pod
typealias PodTemplate               V1PodTemplate
typealias ReplicationController     V1ReplicationController
typealias Service                   V1Service

typealias DeleteOptions             V1DeleteOptions
typealias Preconditions             V1Preconditions

for fn in (:get, :put!, :update!, :delete!)
    @eval begin
        $fn{T<:SwaggerModel}(::Type{T}, args...; kwargs...) = $fn(_global_ctx, T, args...; kwargs...)
        $fn{T<:SwaggerModel}(t::T, args...; kwargs...) = $fn(_global_ctx, t, args...; kwargs...)

        $fn{T<:SwaggerModel}(f::Function, ::Type{T}, args...; kwargs...) = f($fn(_global_ctx, T, args...; kwargs...))
        $fn{T<:SwaggerModel}(f::Function, t::T, args...; kwargs...) = f($fn(_global_ctx, t, args...; kwargs...))
    end
end

get(ctx::KuberContext, ::Type{ComponentStatus}) = listCoreV1ComponentStatus(ctx.api)
get(ctx::KuberContext, ::Type{ComponentStatus}, compname::String) = readCoreV1ComponentStatus(ctx.api, compname)
get(ctx::KuberContext, ::Type{Endpoints}) = listCoreV1EndpointsForAllNamespaces(ctx.api)
get(ctx::KuberContext, ::Type{Namespace}) = listCoreV1Namespace(ctx.api)
get(ctx::KuberContext, ::Type{Pod}) = listCoreV1NamespacedPod(ctx.api, ctx.namespace)
get(ctx::KuberContext, ::Type{PodTemplate}) = listCoreV1NamespacedPodTemplate(ctx.api, ctx.namespace)
get(ctx::KuberContext, ::Type{ReplicationController}) = listCoreV1NamespacedReplicationController(ctx.api, ctx.namespace)
get(ctx::KuberContext, ::Type{Service}) = listCoreV1NamespacedService(ctx.api, ctx.namespace)

put!(ctx::KuberContext, ns::Namespace) = createCoreV1Namespace(ctx.api, ns)
put!(ctx::KuberContext, pod::Pod) = createCoreV1NamespacedPod(ctx.api, ctx.namespace, pod)
put!(ctx::KuberContext, pt::PodTemplate) = createCoreV1NamespacedPodTemplate(ctx.api, ctx.namespace, pt)
put!(ctx::KuberContext, rc::ReplicationController) = createCoreV1NamespacedReplicationController(ctx.api, ctx.namespace, rc)
put!(ctx::KuberContext, rc::Service) = createCoreV1NamespacedService(ctx.api, ctx.namespace, rc)

_delopts(; kwargs...) = DeleteOptions(; preconditions=Preconditions(; kwargs...), kwargs...)
delete!(ctx::KuberContext, ::Type{Namespace},  ns::String; kwargs...) = deleteCoreV1Namespace(ctx.api, nctx.amespace, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{Pod}, pod::String; kwargs...) = deleteCoreV1NamespacedPod(ctx.api, pod, ctx.namespace, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{PodTemplate}, pt::String; kwargs...) = deleteCoreV1NamespacedPodTemplate(ctx.api, pt, ctx.namespace, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{ReplicationController}, rc::String; kwargs...) = deleteCoreV1NamespacedReplicationController(ctx.api, rc, ctx.namespace, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{Service}, service::String) = deleteCoreV1NamespacedService(ctx.api, service, ctx.namespace)

export set_server, set_ns
export ComponentStatus, Endpoints, Namespace, Pod, PodTemplate, ReplicationController, Service
export get, put!, update!, delete!

end # module
