# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

struct CoordinationV1Api <: OpenAPI.APIClientImpl
    client::OpenAPI.Clients.Client
end

"""
The default API base path for APIs in `CoordinationV1Api`.
This can be used to construct the `OpenAPI.Clients.Client` instance.
"""
basepath(::Type{ CoordinationV1Api }) = "http://localhost"

const _returntypes_create_coordination_v1_namespaced_lease = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApiCoordinationV1Lease,
    Regex("^" * replace("201", "x"=>".") * "\$") => IoK8sApiCoordinationV1Lease,
    Regex("^" * replace("202", "x"=>".") * "\$") => IoK8sApiCoordinationV1Lease,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_create_coordination_v1_namespaced_lease(_api::CoordinationV1Api, namespace::String, body::IoK8sApiCoordinationV1Lease; pretty=nothing, dry_run=nothing, field_manager=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "POST", _returntypes_create_coordination_v1_namespaced_lease, "/apis/coordination.k8s.io/v1/namespaces/{namespace}/leases", ["BearerToken", ], body)
    OpenAPI.Clients.set_param(_ctx.path, "namespace", namespace)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "dryRun", dry_run)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "fieldManager", field_manager)  # type String
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""create a Lease

Params:
- namespace::String (required)
- body::IoK8sApiCoordinationV1Lease (required)
- pretty::String
- dry_run::String
- field_manager::String

Return: IoK8sApiCoordinationV1Lease, OpenAPI.Clients.ApiResponse
"""
function create_coordination_v1_namespaced_lease(_api::CoordinationV1Api, namespace::String, body::IoK8sApiCoordinationV1Lease; pretty=nothing, dry_run=nothing, field_manager=nothing, _mediaType=nothing)
    _ctx = _oacinternal_create_coordination_v1_namespaced_lease(_api, namespace, body; pretty=pretty, dry_run=dry_run, field_manager=field_manager, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function create_coordination_v1_namespaced_lease(_api::CoordinationV1Api, response_stream::Channel, namespace::String, body::IoK8sApiCoordinationV1Lease; pretty=nothing, dry_run=nothing, field_manager=nothing, _mediaType=nothing)
    _ctx = _oacinternal_create_coordination_v1_namespaced_lease(_api, namespace, body; pretty=pretty, dry_run=dry_run, field_manager=field_manager, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_delete_coordination_v1_collection_namespaced_lease = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApimachineryPkgApisMetaV1Status,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_delete_coordination_v1_collection_namespaced_lease(_api::CoordinationV1Api, namespace::String; pretty=nothing, allow_watch_bookmarks=nothing, __continue__=nothing, dry_run=nothing, field_selector=nothing, grace_period_seconds=nothing, label_selector=nothing, limit=nothing, orphan_dependents=nothing, propagation_policy=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, body=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "DELETE", _returntypes_delete_coordination_v1_collection_namespaced_lease, "/apis/coordination.k8s.io/v1/namespaces/{namespace}/leases", ["BearerToken", ], body)
    OpenAPI.Clients.set_param(_ctx.path, "namespace", namespace)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "allowWatchBookmarks", allow_watch_bookmarks)  # type Bool
    OpenAPI.Clients.set_param(_ctx.query, "continue", __continue__)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "dryRun", dry_run)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "fieldSelector", field_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "gracePeriodSeconds", grace_period_seconds)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "labelSelector", label_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "limit", limit)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "orphanDependents", orphan_dependents)  # type Bool
    OpenAPI.Clients.set_param(_ctx.query, "propagationPolicy", propagation_policy)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "resourceVersion", resource_version)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "timeoutSeconds", timeout_seconds)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "watch", watch)  # type Bool
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""delete collection of Lease

Params:
- namespace::String (required)
- pretty::String
- allow_watch_bookmarks::Bool
- __continue__::String
- dry_run::String
- field_selector::String
- grace_period_seconds::Int64
- label_selector::String
- limit::Int64
- orphan_dependents::Bool
- propagation_policy::String
- resource_version::String
- timeout_seconds::Int64
- watch::Bool
- body::IoK8sApimachineryPkgApisMetaV1DeleteOptions

Return: IoK8sApimachineryPkgApisMetaV1Status, OpenAPI.Clients.ApiResponse
"""
function delete_coordination_v1_collection_namespaced_lease(_api::CoordinationV1Api, namespace::String; pretty=nothing, allow_watch_bookmarks=nothing, __continue__=nothing, dry_run=nothing, field_selector=nothing, grace_period_seconds=nothing, label_selector=nothing, limit=nothing, orphan_dependents=nothing, propagation_policy=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, body=nothing, _mediaType=nothing)
    _ctx = _oacinternal_delete_coordination_v1_collection_namespaced_lease(_api, namespace; pretty=pretty, allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, dry_run=dry_run, field_selector=field_selector, grace_period_seconds=grace_period_seconds, label_selector=label_selector, limit=limit, orphan_dependents=orphan_dependents, propagation_policy=propagation_policy, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, body=body, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function delete_coordination_v1_collection_namespaced_lease(_api::CoordinationV1Api, response_stream::Channel, namespace::String; pretty=nothing, allow_watch_bookmarks=nothing, __continue__=nothing, dry_run=nothing, field_selector=nothing, grace_period_seconds=nothing, label_selector=nothing, limit=nothing, orphan_dependents=nothing, propagation_policy=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, body=nothing, _mediaType=nothing)
    _ctx = _oacinternal_delete_coordination_v1_collection_namespaced_lease(_api, namespace; pretty=pretty, allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, dry_run=dry_run, field_selector=field_selector, grace_period_seconds=grace_period_seconds, label_selector=label_selector, limit=limit, orphan_dependents=orphan_dependents, propagation_policy=propagation_policy, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, body=body, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_delete_coordination_v1_namespaced_lease = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApimachineryPkgApisMetaV1Status,
    Regex("^" * replace("202", "x"=>".") * "\$") => IoK8sApimachineryPkgApisMetaV1Status,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_delete_coordination_v1_namespaced_lease(_api::CoordinationV1Api, name::String, namespace::String; pretty=nothing, dry_run=nothing, grace_period_seconds=nothing, orphan_dependents=nothing, propagation_policy=nothing, body=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "DELETE", _returntypes_delete_coordination_v1_namespaced_lease, "/apis/coordination.k8s.io/v1/namespaces/{namespace}/leases/{name}", ["BearerToken", ], body)
    OpenAPI.Clients.set_param(_ctx.path, "name", name)  # type String
    OpenAPI.Clients.set_param(_ctx.path, "namespace", namespace)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "dryRun", dry_run)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "gracePeriodSeconds", grace_period_seconds)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "orphanDependents", orphan_dependents)  # type Bool
    OpenAPI.Clients.set_param(_ctx.query, "propagationPolicy", propagation_policy)  # type String
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""delete a Lease

Params:
- name::String (required)
- namespace::String (required)
- pretty::String
- dry_run::String
- grace_period_seconds::Int64
- orphan_dependents::Bool
- propagation_policy::String
- body::IoK8sApimachineryPkgApisMetaV1DeleteOptions

Return: IoK8sApimachineryPkgApisMetaV1Status, OpenAPI.Clients.ApiResponse
"""
function delete_coordination_v1_namespaced_lease(_api::CoordinationV1Api, name::String, namespace::String; pretty=nothing, dry_run=nothing, grace_period_seconds=nothing, orphan_dependents=nothing, propagation_policy=nothing, body=nothing, _mediaType=nothing)
    _ctx = _oacinternal_delete_coordination_v1_namespaced_lease(_api, name, namespace; pretty=pretty, dry_run=dry_run, grace_period_seconds=grace_period_seconds, orphan_dependents=orphan_dependents, propagation_policy=propagation_policy, body=body, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function delete_coordination_v1_namespaced_lease(_api::CoordinationV1Api, response_stream::Channel, name::String, namespace::String; pretty=nothing, dry_run=nothing, grace_period_seconds=nothing, orphan_dependents=nothing, propagation_policy=nothing, body=nothing, _mediaType=nothing)
    _ctx = _oacinternal_delete_coordination_v1_namespaced_lease(_api, name, namespace; pretty=pretty, dry_run=dry_run, grace_period_seconds=grace_period_seconds, orphan_dependents=orphan_dependents, propagation_policy=propagation_policy, body=body, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_get_coordination_v1_a_p_i_resources = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApimachineryPkgApisMetaV1APIResourceList,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_get_coordination_v1_a_p_i_resources(_api::CoordinationV1Api; _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_get_coordination_v1_a_p_i_resources, "/apis/coordination.k8s.io/v1/", ["BearerToken", ])
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""get available resources

Params:

Return: IoK8sApimachineryPkgApisMetaV1APIResourceList, OpenAPI.Clients.ApiResponse
"""
function get_coordination_v1_a_p_i_resources(_api::CoordinationV1Api; _mediaType=nothing)
    _ctx = _oacinternal_get_coordination_v1_a_p_i_resources(_api; _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function get_coordination_v1_a_p_i_resources(_api::CoordinationV1Api, response_stream::Channel; _mediaType=nothing)
    _ctx = _oacinternal_get_coordination_v1_a_p_i_resources(_api; _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_list_coordination_v1_lease_for_all_namespaces = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApiCoordinationV1LeaseList,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_list_coordination_v1_lease_for_all_namespaces(_api::CoordinationV1Api; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_list_coordination_v1_lease_for_all_namespaces, "/apis/coordination.k8s.io/v1/leases", ["BearerToken", ])
    OpenAPI.Clients.set_param(_ctx.query, "allowWatchBookmarks", allow_watch_bookmarks)  # type Bool
    OpenAPI.Clients.set_param(_ctx.query, "continue", __continue__)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "fieldSelector", field_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "labelSelector", label_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "limit", limit)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "resourceVersion", resource_version)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "timeoutSeconds", timeout_seconds)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "watch", watch)  # type Bool
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""list or watch objects of kind Lease

Params:
- allow_watch_bookmarks::Bool
- __continue__::String
- field_selector::String
- label_selector::String
- limit::Int64
- pretty::String
- resource_version::String
- timeout_seconds::Int64
- watch::Bool

Return: IoK8sApiCoordinationV1LeaseList, OpenAPI.Clients.ApiResponse
"""
function list_coordination_v1_lease_for_all_namespaces(_api::CoordinationV1Api; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = _oacinternal_list_coordination_v1_lease_for_all_namespaces(_api; allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, field_selector=field_selector, label_selector=label_selector, limit=limit, pretty=pretty, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function list_coordination_v1_lease_for_all_namespaces(_api::CoordinationV1Api, response_stream::Channel; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = _oacinternal_list_coordination_v1_lease_for_all_namespaces(_api; allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, field_selector=field_selector, label_selector=label_selector, limit=limit, pretty=pretty, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_list_coordination_v1_namespaced_lease = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApiCoordinationV1LeaseList,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_list_coordination_v1_namespaced_lease(_api::CoordinationV1Api, namespace::String; pretty=nothing, allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_list_coordination_v1_namespaced_lease, "/apis/coordination.k8s.io/v1/namespaces/{namespace}/leases", ["BearerToken", ])
    OpenAPI.Clients.set_param(_ctx.path, "namespace", namespace)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "allowWatchBookmarks", allow_watch_bookmarks)  # type Bool
    OpenAPI.Clients.set_param(_ctx.query, "continue", __continue__)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "fieldSelector", field_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "labelSelector", label_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "limit", limit)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "resourceVersion", resource_version)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "timeoutSeconds", timeout_seconds)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "watch", watch)  # type Bool
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""list or watch objects of kind Lease

Params:
- namespace::String (required)
- pretty::String
- allow_watch_bookmarks::Bool
- __continue__::String
- field_selector::String
- label_selector::String
- limit::Int64
- resource_version::String
- timeout_seconds::Int64
- watch::Bool

Return: IoK8sApiCoordinationV1LeaseList, OpenAPI.Clients.ApiResponse
"""
function list_coordination_v1_namespaced_lease(_api::CoordinationV1Api, namespace::String; pretty=nothing, allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = _oacinternal_list_coordination_v1_namespaced_lease(_api, namespace; pretty=pretty, allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, field_selector=field_selector, label_selector=label_selector, limit=limit, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function list_coordination_v1_namespaced_lease(_api::CoordinationV1Api, response_stream::Channel, namespace::String; pretty=nothing, allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = _oacinternal_list_coordination_v1_namespaced_lease(_api, namespace; pretty=pretty, allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, field_selector=field_selector, label_selector=label_selector, limit=limit, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_patch_coordination_v1_namespaced_lease = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApiCoordinationV1Lease,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_patch_coordination_v1_namespaced_lease(_api::CoordinationV1Api, name::String, namespace::String, body::Any; pretty=nothing, dry_run=nothing, field_manager=nothing, force=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "PATCH", _returntypes_patch_coordination_v1_namespaced_lease, "/apis/coordination.k8s.io/v1/namespaces/{namespace}/leases/{name}", ["BearerToken", ], body)
    OpenAPI.Clients.set_param(_ctx.path, "name", name)  # type String
    OpenAPI.Clients.set_param(_ctx.path, "namespace", namespace)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "dryRun", dry_run)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "fieldManager", field_manager)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "force", force)  # type Bool
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? ["application/json-patch+json", "application/merge-patch+json", "application/strategic-merge-patch+json", "application/apply-patch+yaml", ] : [_mediaType])
    return _ctx
end

@doc raw"""partially update the specified Lease

Params:
- name::String (required)
- namespace::String (required)
- body::Any (required)
- pretty::String
- dry_run::String
- field_manager::String
- force::Bool

Return: IoK8sApiCoordinationV1Lease, OpenAPI.Clients.ApiResponse
"""
function patch_coordination_v1_namespaced_lease(_api::CoordinationV1Api, name::String, namespace::String, body::Any; pretty=nothing, dry_run=nothing, field_manager=nothing, force=nothing, _mediaType=nothing)
    _ctx = _oacinternal_patch_coordination_v1_namespaced_lease(_api, name, namespace, body; pretty=pretty, dry_run=dry_run, field_manager=field_manager, force=force, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function patch_coordination_v1_namespaced_lease(_api::CoordinationV1Api, response_stream::Channel, name::String, namespace::String, body::Any; pretty=nothing, dry_run=nothing, field_manager=nothing, force=nothing, _mediaType=nothing)
    _ctx = _oacinternal_patch_coordination_v1_namespaced_lease(_api, name, namespace, body; pretty=pretty, dry_run=dry_run, field_manager=field_manager, force=force, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_read_coordination_v1_namespaced_lease = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApiCoordinationV1Lease,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_read_coordination_v1_namespaced_lease(_api::CoordinationV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, __export__=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_read_coordination_v1_namespaced_lease, "/apis/coordination.k8s.io/v1/namespaces/{namespace}/leases/{name}", ["BearerToken", ])
    OpenAPI.Clients.set_param(_ctx.path, "name", name)  # type String
    OpenAPI.Clients.set_param(_ctx.path, "namespace", namespace)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "exact", exact)  # type Bool
    OpenAPI.Clients.set_param(_ctx.query, "export", __export__)  # type Bool
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""read the specified Lease

Params:
- name::String (required)
- namespace::String (required)
- pretty::String
- exact::Bool
- __export__::Bool

Return: IoK8sApiCoordinationV1Lease, OpenAPI.Clients.ApiResponse
"""
function read_coordination_v1_namespaced_lease(_api::CoordinationV1Api, name::String, namespace::String; pretty=nothing, exact=nothing, __export__=nothing, _mediaType=nothing)
    _ctx = _oacinternal_read_coordination_v1_namespaced_lease(_api, name, namespace; pretty=pretty, exact=exact, __export__=__export__, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function read_coordination_v1_namespaced_lease(_api::CoordinationV1Api, response_stream::Channel, name::String, namespace::String; pretty=nothing, exact=nothing, __export__=nothing, _mediaType=nothing)
    _ctx = _oacinternal_read_coordination_v1_namespaced_lease(_api, name, namespace; pretty=pretty, exact=exact, __export__=__export__, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_replace_coordination_v1_namespaced_lease = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApiCoordinationV1Lease,
    Regex("^" * replace("201", "x"=>".") * "\$") => IoK8sApiCoordinationV1Lease,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_replace_coordination_v1_namespaced_lease(_api::CoordinationV1Api, name::String, namespace::String, body::IoK8sApiCoordinationV1Lease; pretty=nothing, dry_run=nothing, field_manager=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "PUT", _returntypes_replace_coordination_v1_namespaced_lease, "/apis/coordination.k8s.io/v1/namespaces/{namespace}/leases/{name}", ["BearerToken", ], body)
    OpenAPI.Clients.set_param(_ctx.path, "name", name)  # type String
    OpenAPI.Clients.set_param(_ctx.path, "namespace", namespace)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "dryRun", dry_run)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "fieldManager", field_manager)  # type String
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""replace the specified Lease

Params:
- name::String (required)
- namespace::String (required)
- body::IoK8sApiCoordinationV1Lease (required)
- pretty::String
- dry_run::String
- field_manager::String

Return: IoK8sApiCoordinationV1Lease, OpenAPI.Clients.ApiResponse
"""
function replace_coordination_v1_namespaced_lease(_api::CoordinationV1Api, name::String, namespace::String, body::IoK8sApiCoordinationV1Lease; pretty=nothing, dry_run=nothing, field_manager=nothing, _mediaType=nothing)
    _ctx = _oacinternal_replace_coordination_v1_namespaced_lease(_api, name, namespace, body; pretty=pretty, dry_run=dry_run, field_manager=field_manager, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function replace_coordination_v1_namespaced_lease(_api::CoordinationV1Api, response_stream::Channel, name::String, namespace::String, body::IoK8sApiCoordinationV1Lease; pretty=nothing, dry_run=nothing, field_manager=nothing, _mediaType=nothing)
    _ctx = _oacinternal_replace_coordination_v1_namespaced_lease(_api, name, namespace, body; pretty=pretty, dry_run=dry_run, field_manager=field_manager, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_watch_coordination_v1_lease_list_for_all_namespaces = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApimachineryPkgApisMetaV1WatchEvent,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_watch_coordination_v1_lease_list_for_all_namespaces(_api::CoordinationV1Api; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_watch_coordination_v1_lease_list_for_all_namespaces, "/apis/coordination.k8s.io/v1/watch/leases", ["BearerToken", ])
    OpenAPI.Clients.set_param(_ctx.query, "allowWatchBookmarks", allow_watch_bookmarks)  # type Bool
    OpenAPI.Clients.set_param(_ctx.query, "continue", __continue__)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "fieldSelector", field_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "labelSelector", label_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "limit", limit)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "resourceVersion", resource_version)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "timeoutSeconds", timeout_seconds)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "watch", watch)  # type Bool
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""watch individual changes to a list of Lease. deprecated: use the 'watch' parameter with a list operation instead.

Params:
- allow_watch_bookmarks::Bool
- __continue__::String
- field_selector::String
- label_selector::String
- limit::Int64
- pretty::String
- resource_version::String
- timeout_seconds::Int64
- watch::Bool

Return: IoK8sApimachineryPkgApisMetaV1WatchEvent, OpenAPI.Clients.ApiResponse
"""
function watch_coordination_v1_lease_list_for_all_namespaces(_api::CoordinationV1Api; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = _oacinternal_watch_coordination_v1_lease_list_for_all_namespaces(_api; allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, field_selector=field_selector, label_selector=label_selector, limit=limit, pretty=pretty, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function watch_coordination_v1_lease_list_for_all_namespaces(_api::CoordinationV1Api, response_stream::Channel; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = _oacinternal_watch_coordination_v1_lease_list_for_all_namespaces(_api; allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, field_selector=field_selector, label_selector=label_selector, limit=limit, pretty=pretty, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_watch_coordination_v1_namespaced_lease = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApimachineryPkgApisMetaV1WatchEvent,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_watch_coordination_v1_namespaced_lease(_api::CoordinationV1Api, name::String, namespace::String; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_watch_coordination_v1_namespaced_lease, "/apis/coordination.k8s.io/v1/watch/namespaces/{namespace}/leases/{name}", ["BearerToken", ])
    OpenAPI.Clients.set_param(_ctx.path, "name", name)  # type String
    OpenAPI.Clients.set_param(_ctx.path, "namespace", namespace)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "allowWatchBookmarks", allow_watch_bookmarks)  # type Bool
    OpenAPI.Clients.set_param(_ctx.query, "continue", __continue__)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "fieldSelector", field_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "labelSelector", label_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "limit", limit)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "resourceVersion", resource_version)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "timeoutSeconds", timeout_seconds)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "watch", watch)  # type Bool
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""watch changes to an object of kind Lease. deprecated: use the 'watch' parameter with a list operation instead, filtered to a single item with the 'fieldSelector' parameter.

Params:
- name::String (required)
- namespace::String (required)
- allow_watch_bookmarks::Bool
- __continue__::String
- field_selector::String
- label_selector::String
- limit::Int64
- pretty::String
- resource_version::String
- timeout_seconds::Int64
- watch::Bool

Return: IoK8sApimachineryPkgApisMetaV1WatchEvent, OpenAPI.Clients.ApiResponse
"""
function watch_coordination_v1_namespaced_lease(_api::CoordinationV1Api, name::String, namespace::String; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = _oacinternal_watch_coordination_v1_namespaced_lease(_api, name, namespace; allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, field_selector=field_selector, label_selector=label_selector, limit=limit, pretty=pretty, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function watch_coordination_v1_namespaced_lease(_api::CoordinationV1Api, response_stream::Channel, name::String, namespace::String; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = _oacinternal_watch_coordination_v1_namespaced_lease(_api, name, namespace; allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, field_selector=field_selector, label_selector=label_selector, limit=limit, pretty=pretty, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_watch_coordination_v1_namespaced_lease_list = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApimachineryPkgApisMetaV1WatchEvent,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_watch_coordination_v1_namespaced_lease_list(_api::CoordinationV1Api, namespace::String; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_watch_coordination_v1_namespaced_lease_list, "/apis/coordination.k8s.io/v1/watch/namespaces/{namespace}/leases", ["BearerToken", ])
    OpenAPI.Clients.set_param(_ctx.path, "namespace", namespace)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "allowWatchBookmarks", allow_watch_bookmarks)  # type Bool
    OpenAPI.Clients.set_param(_ctx.query, "continue", __continue__)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "fieldSelector", field_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "labelSelector", label_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "limit", limit)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "resourceVersion", resource_version)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "timeoutSeconds", timeout_seconds)  # type Int64
    OpenAPI.Clients.set_param(_ctx.query, "watch", watch)  # type Bool
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""watch individual changes to a list of Lease. deprecated: use the 'watch' parameter with a list operation instead.

Params:
- namespace::String (required)
- allow_watch_bookmarks::Bool
- __continue__::String
- field_selector::String
- label_selector::String
- limit::Int64
- pretty::String
- resource_version::String
- timeout_seconds::Int64
- watch::Bool

Return: IoK8sApimachineryPkgApisMetaV1WatchEvent, OpenAPI.Clients.ApiResponse
"""
function watch_coordination_v1_namespaced_lease_list(_api::CoordinationV1Api, namespace::String; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = _oacinternal_watch_coordination_v1_namespaced_lease_list(_api, namespace; allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, field_selector=field_selector, label_selector=label_selector, limit=limit, pretty=pretty, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function watch_coordination_v1_namespaced_lease_list(_api::CoordinationV1Api, response_stream::Channel, namespace::String; allow_watch_bookmarks=nothing, __continue__=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, pretty=nothing, resource_version=nothing, timeout_seconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = _oacinternal_watch_coordination_v1_namespaced_lease_list(_api, namespace; allow_watch_bookmarks=allow_watch_bookmarks, __continue__=__continue__, field_selector=field_selector, label_selector=label_selector, limit=limit, pretty=pretty, resource_version=resource_version, timeout_seconds=timeout_seconds, watch=watch, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

export create_coordination_v1_namespaced_lease
export delete_coordination_v1_collection_namespaced_lease
export delete_coordination_v1_namespaced_lease
export get_coordination_v1_a_p_i_resources
export list_coordination_v1_lease_for_all_namespaces
export list_coordination_v1_namespaced_lease
export patch_coordination_v1_namespaced_lease
export read_coordination_v1_namespaced_lease
export replace_coordination_v1_namespaced_lease
export watch_coordination_v1_lease_list_for_all_namespaces
export watch_coordination_v1_namespaced_lease
export watch_coordination_v1_namespaced_lease_list
