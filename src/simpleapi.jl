# simple Julia APIs over Kubernetes Swagger interface

# TODO: Deployment
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
