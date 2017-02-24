# simple Julia APIs over Kubernetes Swagger interface

function sel(label::String, op::Symbol)
    @assert op === :exists
    label
end
sel(label::String, op::Symbol, items::String...) = label * " " * string(op) * " (" * join(items, ",") * ")"
sel(cnd::String...) = join(cnd, ", ")

# TODO: Deployment
# fieldSelector not supported yet (see: https://github.com/kubernetes/kubernetes/issues/15128)
get(ctx::KuberContext, ::Type{ComponentStatus}, name::String)                   = readCoreV1ComponentStatus(ctx.api, name)
get(ctx::KuberContext, ::Type{Namespace}, name::String)                         = readCoreV1Namespace(ctx.api, name)
get(ctx::KuberContext, ::Type{ResourceQuota}, name::String)                     = readCoreV1NamespacedResourceQuota(ctx.api, name, ctx.namespace)

for (T,fn) in (ComponentStatus=>:listCoreV1ComponentStatus, Namespace=>:listCoreV1Namespace, PersistentVolume=>:listCoreV1PersistentVolume,
                ClusterRoleBinding=>:listRbacAuthorizationV1alpha1ClusterRoleBinding, ClusterRole=>:listRbacAuthorizationV1alpha1ClusterRole,
                Node=>:listCoreV1Node)
    @eval get(ctx::KuberContext, ::Type{$T}; label_selector=nothing) = $fn(ctx.api; labelSelector=label_selector)
end

for (T,fn) in (Endpoints=>:listCoreV1NamespacedEndpoints, ResourceQuota=>:listCoreV1NamespacedResourceQuota,
                Pod=>:listCoreV1NamespacedPod, PodTemplate=>:listCoreV1NamespacedPodTemplate, ReplicationController=>:listCoreV1NamespacedReplicationController,
                Service=>:listCoreV1NamespacedService, PersistentVolumeClaim=>:listCoreV1NamespacedPersistentVolumeClaim, Job=>:listBatchV1NamespacedJob,
                Secret=>:listCoreV1NamespacedSecret, RoleBinding=>:listRbacAuthorizationV1alpha1NamespacedRoleBinding, Role=>:listRbacAuthorizationV1alpha1NamespacedRole)
    @eval get(ctx::KuberContext, ::Type{$T}; label_selector=nothing) = $fn(ctx.api, ctx.namespace; labelSelector=label_selector)
end

for (T,fn) in (Namespace=>:createCoreV1Namespace, PersistentVolume=>:createCoreV1PersistentVolume,
                ClusterRoleBinding=>:createRbacAuthorizationV1alpha1ClusterRoleBinding, ClusterRole=>:createRbacAuthorizationV1alpha1ClusterRole)
    @eval put!(ctx::KuberContext, ::Type{$T}, d::Dict{String,Any}) = $fn(ctx.api, d)
    @eval put!(ctx::KuberContext, v::$T) = $fn(ctx.api, v)
end

for (T,fn) in (ResourceQuota=>:createCoreV1NamespacedResourceQuota, Endpoints=>:createCoreV1NamespacedEndpoints, Pod=>:createCoreV1NamespacedPod,
                PodTemplate=>:createCoreV1NamespacedPodTemplate, ReplicationController=>:createCoreV1NamespacedReplicationController,
                Service=>:createCoreV1NamespacedService, PersistentVolumeClaim=>:createCoreV1NamespacedPersistentVolumeClaim,
                Job=>:createBatchV1NamespacedJob, Secret=>:createCoreV1NamespacedSecret, RoleBinding=>:createRbacAuthorizationV1alpha1NamespacedRoleBinding,
                Role=>:createRbacAuthorizationV1alpha1NamespacedRole)
    @eval put!(ctx::KuberContext, ::Type{$T}, d::Dict{String,Any}) = $fn(ctx.api, ctx.namespace, d)
    @eval put!(ctx::KuberContext, v::$T) = $fn(ctx.api, ctx.namespace, v)
end

_delopts(; kwargs...) = DeleteOptions(; preconditions=Preconditions(; kwargs...), kwargs...)
delete!(ctx::KuberContext, ::Type{Service}, service::String) = deleteCoreV1NamespacedService(ctx.api, service, ctx.namespace)

for (T,fn) in (Namespace=>:deleteCoreV1Namespace, PersistentVolume=>:deleteCoreV1PersistentVolume,
                ClusterRoleBinding=>:deleteRbacAuthorizationV1alpha1ClusterRoleBinding, ClusterRole=>:deleteRbacAuthorizationV1alpha1ClusterRole)
    @eval delete!(ctx::KuberContext, ::Type{$T}, name::String; kwargs...) = $fn(ctx.api, name, _delopts(; kwargs...))
end

for (T,fn) in (ResourceQuota=>:deleteCoreV1NamespacedResourceQuota, Endpoints=>:deleteCoreV1NamespacedEndpoints, Pod=>:deleteCoreV1NamespacedPod,
                PodTemplate=>:deleteCoreV1NamespacedPodTemplate, ReplicationController=>:deleteCoreV1NamespacedReplicationController,
                PersistentVolumeClaim=>:deleteCoreV1NamespacedPersistentVolumeClaim, Job=>:deleteBatchV1NamespacedJob, Secret=>:deleteCoreV1NamespacedSecret,
                RoleBinding=>:deleteRbacAuthorizationV1alpha1NamespacedRoleBinding, Role=>:deleteRbacAuthorizationV1alpha1NamespacedRole)
    @eval delete!(ctx::KuberContext, ::Type{$T}, name::String; kwargs...) = $fn(ctx.api, name, ctx.namespace, _delopts(; kwargs...))
end

# TODO: take keyword parameters for allowed attributes instead of patch, create patch in the function
for (T,fn) in (Namespace=>:patchCoreV1Namespace, PersistentVolume=>:patchCoreV1PersistentVolume,
                ClusterRoleBinding=>:patchRbacAuthorizationV1alpha1ClusterRoleBinding, ClusterRole=>:patchRbacAuthorizationV1alpha1ClusterRole)
    @eval update!(ctx::KuberContext, ::Type{$T}, name::String, patch, patch_type) = $fn(ctx.api, name, patch; _mediaType=patch_type)
end

for (T,fn) in (Endpoints=>:patchCoreV1NamespacedEndpoints, Pod=>:patchCoreV1NamespacedPod, PodTemplate=>:patchCoreV1NamespacedPodTemplate,
                ReplicationController=>:patchCoreV1NamespacedReplicationController, Service=>:patchCoreV1NamespacedService,
                PersistentVolumeClaim=>:patchCoreV1NamespacedPersistentVolumeClaim, Job=>:patchBatchV1NamespacedJob, Secret=>:patchCoreV1NamespacedSecret,
                ResourceQuota=>:patchCoreV1NamespacedResourceQuota, RoleBinding=>:patchRbacAuthorizationV1alpha1NamespacedRoleBinding,
                Role=>:patchRbacAuthorizationV1alpha1NamespacedRole)
    @eval update!(ctx::KuberContext, ::Type{$T}, name::String, patch, patch_type) = $fn(ctx.api, name, ctx.namespace, patch; _mediaType=patch_type)
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
get_logs(ctx::KuberContext, pod_name::String; kwargs...) = readCoreV1NamespacedPodLog(ctx.api, pod_name, ctx.namespace; kwargs...)
