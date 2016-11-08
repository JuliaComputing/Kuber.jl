# simple Julia APIs over Kubernetes Swagger interface

function sel(label::String, op::Symbol)
    @assert op === :exists
    label
end
sel(label::String, op::Symbol, items::String...) = label * " " * string(op) * " (" * join(items, ",") * ")"
sel(cnd::String...) = join(cnd, ", ")

# TODO: Deployment
# fieldSelector not supported yet (see: https://github.com/kubernetes/kubernetes/issues/15128)
get(ctx::KuberContext, ::Type{ComponentStatus}, compname::String) = readCoreV1ComponentStatus(ctx.api, compname)
get(ctx::KuberContext, ::Type{ComponentStatus}; label_selector=nothing) = listCoreV1ComponentStatus(ctx.api; labelSelector=label_selector)
get(ctx::KuberContext, ::Type{Namespace}; label_selector=nothing) = listCoreV1Namespace(ctx.api; labelSelector=label_selector)
get(ctx::KuberContext, ::Type{Endpoints}; label_selector=nothing) = listCoreV1EndpointsForAllNamespaces(ctx.api; labelSelector=label_selector)
get(ctx::KuberContext, ::Type{Pod}; label_selector=nothing) = listCoreV1NamespacedPod(ctx.api, ctx.namespace; labelSelector=label_selector)
get(ctx::KuberContext, ::Type{PodTemplate}; label_selector=nothing) = listCoreV1NamespacedPodTemplate(ctx.api, ctx.namespace; labelSelector=label_selector)
get(ctx::KuberContext, ::Type{ReplicationController}; label_selector=nothing) = listCoreV1NamespacedReplicationController(ctx.api, ctx.namespace; labelSelector=label_selector)
get(ctx::KuberContext, ::Type{Service}; label_selector=nothing) = listCoreV1NamespacedService(ctx.api, ctx.namespace; labelSelector=label_selector)
get(ctx::KuberContext, ::Type{PersistentVolume}; label_selector=nothing) = listCoreV1PersistentVolume(ctx.api; labelSelector=label_selector)
get(ctx::KuberContext, ::Type{PersistentVolumeClaim}; label_selector=nothing) = listCoreV1NamespacedPersistentVolumeClaim(ctx.api, ctx.namespace; labelSelector=label_selector)
get(ctx::KuberContext, ::Type{Job}; label_selector=nothing) = listBatchV1NamespacedJob(ctx.api, ctx.namespace; labelSelector=label_selector)
get(ctx::KuberContext, ::Type{Secret}; label_selector=nothing) = listCoreV1NamespacedSecret(ctx.api, ctx.namespace; labelSelector=label_selector)

put!(ctx::KuberContext, ns::Namespace) = createCoreV1Namespace(ctx.api, ns)
put!(ctx::KuberContext, epts::Endpoints) = createCoreV1NamespacedEndpoints(ctx.api, ctx.namespace, epts)
put!(ctx::KuberContext, pod::Pod) = createCoreV1NamespacedPod(ctx.api, ctx.namespace, pod)
put!(ctx::KuberContext, pt::PodTemplate) = createCoreV1NamespacedPodTemplate(ctx.api, ctx.namespace, pt)
put!(ctx::KuberContext, rc::ReplicationController) = createCoreV1NamespacedReplicationController(ctx.api, ctx.namespace, rc)
put!(ctx::KuberContext, svc::Service) = createCoreV1NamespacedService(ctx.api, ctx.namespace, svc)
put!(ctx::KuberContext, pv::PersistentVolume) = createCoreV1PersistentVolume(ctx.api, pv)
put!(ctx::KuberContext, pvc::PersistentVolumeClaim) = createCoreV1NamespacedPersistentVolumeClaim(ctx.api, ctx.namespace, pvc)
put!(ctx::KuberContext, job::Job) = createBatchV1NamespacedJob(ctx.api, ctx.namespace, job)
put!(ctx::KuberContext, secret::Secret) = createCoreV1NamespacedSecret(ctx.api, ctx.namespace, secret)

put!(ctx::KuberContext, ::Type{Namespace}, ns::Dict{String,Any}) = createCoreV1Namespace(ctx.api, ns)
put!(ctx::KuberContext, ::Type{Endpoints}, epts::Dict{String,Any}) = createCoreV1NamespacedEndpoints(ctx.api, ctx.namespace, epts)
put!(ctx::KuberContext, ::Type{Pod}, pod::Dict{String,Any}) = createCoreV1NamespacedPod(ctx.api, ctx.namespace, pod)
put!(ctx::KuberContext, ::Type{PodTemplate}, pt::Dict{String,Any}) = createCoreV1NamespacedPodTemplate(ctx.api, ctx.namespace, pt)
put!(ctx::KuberContext, ::Type{ReplicationController}, rc::Dict{String,Any}) = createCoreV1NamespacedReplicationController(ctx.api, ctx.namespace, rc)
put!(ctx::KuberContext, ::Type{Service}, svc::Dict{String,Any}) = createCoreV1NamespacedService(ctx.api, ctx.namespace, svc)
put!(ctx::KuberContext, ::Type{PersistentVolume}, pv::Dict{String,Any}) = createCoreV1PersistentVolume(ctx.api, pv)
put!(ctx::KuberContext, ::Type{PersistentVolumeClaim}, pvc::Dict{String,Any}) = createCoreV1NamespacedPersistentVolumeClaim(ctx.api, ctx.namespace, pvc)
put!(ctx::KuberContext, ::Type{Job}, job::Dict{String,Any}) = createBatchV1NamespacedJob(ctx.api, ctx.namespace, job)
put!(ctx::KuberContext, ::Type{Secret}, secret::Dict{String,Any}) = createCoreV1NamespacedSecret(ctx.api, ctx.namespace, secret)

_delopts(; kwargs...) = DeleteOptions(; preconditions=Preconditions(; kwargs...), kwargs...)
delete!(ctx::KuberContext, ::Type{Namespace}, ns::String; kwargs...) = deleteCoreV1Namespace(ctx.api, nctx.amespace, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{Endpoints}, epts::String; kwargs...) = deleteCoreV1NamespacedEndpoints(ctx.api, epts, ctx.namespace, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{Pod}, pod::String; kwargs...) = deleteCoreV1NamespacedPod(ctx.api, pod, ctx.namespace, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{PodTemplate}, pt::String; kwargs...) = deleteCoreV1NamespacedPodTemplate(ctx.api, pt, ctx.namespace, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{ReplicationController}, rc::String; kwargs...) = deleteCoreV1NamespacedReplicationController(ctx.api, rc, ctx.namespace, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{Service}, service::String) = deleteCoreV1NamespacedService(ctx.api, service, ctx.namespace)
delete!(ctx::KuberContext, ::Type{PersistentVolume}, pv::String; kwargs...) = deleteCoreV1PersistentVolume(ctx.api, pv, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{PersistentVolumeClaim}, pvc::String; kwargs...) = deleteCoreV1NamespacedPersistentVolumeClaim(ctx.api, pvc, ctx.namespace, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{Job}, job::String; kwargs...) = deleteBatchV1NamespacedJob(ctx.api, job, ctx.namespace, _delopts(; kwargs...))
delete!(ctx::KuberContext, ::Type{Secret}, secret::String; kwargs...) = deleteCoreV1NamespacedSecret(ctx.api, secret, ctx.namespace, _delopts(; kwargs...))

# TODO: take keyword parameters for allowed attributes instead of patch, create patch in the function
update!(ctx::KuberContext, ::Type{Namespace}, ns::String, patch, patch_type) = patchCoreV1Namespace(ctx.api, ns, patch; _mediaType=patch_type)
update!(ctx::KuberContext, ::Type{PersistentVolume}, pv::String, patch, patch_type) = patchCoreV1PersistentVolume(ctx.api, pv, patch; _mediaType=patch_type)
for (T,fn) in (Endpoints=>:patchCoreV1NamespacedEndpoints, Pod=>:patchCoreV1NamespacedPod, PodTemplate=>:patchCoreV1NamespacedPodTemplate,
                ReplicationController=>:patchCoreV1NamespacedReplicationController, Service=>:patchCoreV1NamespacedService,
                PersistentVolumeClaim=>:patchCoreV1NamespacedPersistentVolumeClaim, Job=>:patchBatchV1NamespacedJob, Secret=>:patchCoreV1NamespacedSecret)
    @eval begin
        update!(ctx::KuberContext, ::Type{$T}, name::String, patch, patch_type) = $fn(ctx.api, name, ctx.namespace, patch; _mediaType=patch_type)
    end
end
