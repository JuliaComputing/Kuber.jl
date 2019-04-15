# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.


struct SchedulingV1beta1Api <: SwaggerApi
    client::Swagger.Client
end

"""

create a PriorityClass
Param: body::IoK8sApiSchedulingV1beta1PriorityClass (required)
Param: includeUninitialized::Bool
Param: pretty::String
Param: dryRun::String
Return: IoK8sApiSchedulingV1beta1PriorityClass
"""
function createSchedulingV1beta1PriorityClass(_api::SchedulingV1beta1Api, body; includeUninitialized=nothing, pretty=nothing, dryRun=nothing, _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "POST", IoK8sApiSchedulingV1beta1PriorityClass, "/apis/scheduling.k8s.io/v1beta1/priorityclasses", ["BearerToken"], body)
    Swagger.set_param(_ctx.query, "includeUninitialized", includeUninitialized)  # type Bool
    Swagger.set_param(_ctx.query, "pretty", pretty)  # type String
    Swagger.set_param(_ctx.query, "dryRun", dryRun)  # type String
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["*/*"] : [_mediaType])
    Swagger.exec(_ctx)
end

"""

delete collection of PriorityClass
Param: includeUninitialized::Bool
Param: pretty::String
Param: __continue__::String
Param: fieldSelector::String
Param: labelSelector::String
Param: limit::Int32
Param: resourceVersion::String
Param: timeoutSeconds::Int32
Param: watch::Bool
Return: IoK8sApimachineryPkgApisMetaV1Status
"""
function deleteSchedulingV1beta1CollectionPriorityClass(_api::SchedulingV1beta1Api; includeUninitialized=nothing, pretty=nothing, __continue__=nothing, fieldSelector=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "DELETE", IoK8sApimachineryPkgApisMetaV1Status, "/apis/scheduling.k8s.io/v1beta1/priorityclasses", ["BearerToken"])
    Swagger.set_param(_ctx.query, "includeUninitialized", includeUninitialized)  # type Bool
    Swagger.set_param(_ctx.query, "pretty", pretty)  # type String
    Swagger.set_param(_ctx.query, "continue", __continue__)  # type String
    Swagger.set_param(_ctx.query, "fieldSelector", fieldSelector)  # type String
    Swagger.set_param(_ctx.query, "labelSelector", labelSelector)  # type String
    Swagger.set_param(_ctx.query, "limit", limit)  # type Int32
    Swagger.set_param(_ctx.query, "resourceVersion", resourceVersion)  # type String
    Swagger.set_param(_ctx.query, "timeoutSeconds", timeoutSeconds)  # type Int32
    Swagger.set_param(_ctx.query, "watch", watch)  # type Bool
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["*/*"] : [_mediaType])
    Swagger.exec(_ctx)
end

"""

delete a PriorityClass
Param: name::String (required)
Param: body::IoK8sApimachineryPkgApisMetaV1DeleteOptions (required)
Param: pretty::String
Param: dryRun::String
Param: gracePeriodSeconds::Int32
Param: orphanDependents::Bool
Param: propagationPolicy::String
Return: IoK8sApimachineryPkgApisMetaV1Status
"""
function deleteSchedulingV1beta1PriorityClass(_api::SchedulingV1beta1Api, name::String, body; pretty=nothing, dryRun=nothing, gracePeriodSeconds=nothing, orphanDependents=nothing, propagationPolicy=nothing, _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "DELETE", IoK8sApimachineryPkgApisMetaV1Status, "/apis/scheduling.k8s.io/v1beta1/priorityclasses/{name}", ["BearerToken"], body)
    Swagger.set_param(_ctx.path, "name", name)  # type String
    Swagger.set_param(_ctx.query, "pretty", pretty)  # type String
    Swagger.set_param(_ctx.query, "dryRun", dryRun)  # type String
    Swagger.set_param(_ctx.query, "gracePeriodSeconds", gracePeriodSeconds)  # type Int32
    Swagger.set_param(_ctx.query, "orphanDependents", orphanDependents)  # type Bool
    Swagger.set_param(_ctx.query, "propagationPolicy", propagationPolicy)  # type String
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["*/*"] : [_mediaType])
    Swagger.exec(_ctx)
end

"""

get available resources
Return: IoK8sApimachineryPkgApisMetaV1APIResourceList
"""
function getSchedulingV1beta1APIResources(_api::SchedulingV1beta1Api; _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "GET", IoK8sApimachineryPkgApisMetaV1APIResourceList, "/apis/scheduling.k8s.io/v1beta1/", ["BearerToken"])
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf"] : [_mediaType])
    Swagger.exec(_ctx)
end

"""

list or watch objects of kind PriorityClass
Param: includeUninitialized::Bool
Param: pretty::String
Param: __continue__::String
Param: fieldSelector::String
Param: labelSelector::String
Param: limit::Int32
Param: resourceVersion::String
Param: timeoutSeconds::Int32
Param: watch::Bool
Return: IoK8sApiSchedulingV1beta1PriorityClassList
"""
function listSchedulingV1beta1PriorityClass(_api::SchedulingV1beta1Api; includeUninitialized=nothing, pretty=nothing, __continue__=nothing, fieldSelector=nothing, labelSelector=nothing, limit=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "GET", IoK8sApiSchedulingV1beta1PriorityClassList, "/apis/scheduling.k8s.io/v1beta1/priorityclasses", ["BearerToken"])
    Swagger.set_param(_ctx.query, "includeUninitialized", includeUninitialized)  # type Bool
    Swagger.set_param(_ctx.query, "pretty", pretty)  # type String
    Swagger.set_param(_ctx.query, "continue", __continue__)  # type String
    Swagger.set_param(_ctx.query, "fieldSelector", fieldSelector)  # type String
    Swagger.set_param(_ctx.query, "labelSelector", labelSelector)  # type String
    Swagger.set_param(_ctx.query, "limit", limit)  # type Int32
    Swagger.set_param(_ctx.query, "resourceVersion", resourceVersion)  # type String
    Swagger.set_param(_ctx.query, "timeoutSeconds", timeoutSeconds)  # type Int32
    Swagger.set_param(_ctx.query, "watch", watch)  # type Bool
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["*/*"] : [_mediaType])
    Swagger.exec(_ctx)
end

"""

partially update the specified PriorityClass
Param: name::String (required)
Param: body::IoK8sApimachineryPkgApisMetaV1Patch (required)
Param: pretty::String
Param: dryRun::String
Return: IoK8sApiSchedulingV1beta1PriorityClass
"""
function patchSchedulingV1beta1PriorityClass(_api::SchedulingV1beta1Api, name::String, body; pretty=nothing, dryRun=nothing, _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "PATCH", IoK8sApiSchedulingV1beta1PriorityClass, "/apis/scheduling.k8s.io/v1beta1/priorityclasses/{name}", ["BearerToken"], body)
    Swagger.set_param(_ctx.path, "name", name)  # type String
    Swagger.set_param(_ctx.query, "pretty", pretty)  # type String
    Swagger.set_param(_ctx.query, "dryRun", dryRun)  # type String
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["application/json-patch+json", "application/merge-patch+json", "application/strategic-merge-patch+json"] : [_mediaType])
    Swagger.exec(_ctx)
end

"""

read the specified PriorityClass
Param: name::String (required)
Param: pretty::String
Param: exact::Bool
Param: __export__::Bool
Return: IoK8sApiSchedulingV1beta1PriorityClass
"""
function readSchedulingV1beta1PriorityClass(_api::SchedulingV1beta1Api, name::String; pretty=nothing, exact=nothing, __export__=nothing, _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "GET", IoK8sApiSchedulingV1beta1PriorityClass, "/apis/scheduling.k8s.io/v1beta1/priorityclasses/{name}", ["BearerToken"])
    Swagger.set_param(_ctx.path, "name", name)  # type String
    Swagger.set_param(_ctx.query, "pretty", pretty)  # type String
    Swagger.set_param(_ctx.query, "exact", exact)  # type Bool
    Swagger.set_param(_ctx.query, "export", __export__)  # type Bool
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["*/*"] : [_mediaType])
    Swagger.exec(_ctx)
end

"""

replace the specified PriorityClass
Param: name::String (required)
Param: body::IoK8sApiSchedulingV1beta1PriorityClass (required)
Param: pretty::String
Param: dryRun::String
Return: IoK8sApiSchedulingV1beta1PriorityClass
"""
function replaceSchedulingV1beta1PriorityClass(_api::SchedulingV1beta1Api, name::String, body; pretty=nothing, dryRun=nothing, _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "PUT", IoK8sApiSchedulingV1beta1PriorityClass, "/apis/scheduling.k8s.io/v1beta1/priorityclasses/{name}", ["BearerToken"], body)
    Swagger.set_param(_ctx.path, "name", name)  # type String
    Swagger.set_param(_ctx.query, "pretty", pretty)  # type String
    Swagger.set_param(_ctx.query, "dryRun", dryRun)  # type String
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["*/*"] : [_mediaType])
    Swagger.exec(_ctx)
end

"""

watch changes to an object of kind PriorityClass. deprecated: use the 'watch' parameter with a list operation instead, filtered to a single item with the 'fieldSelector' parameter.
Param: name::String (required)
Param: __continue__::String
Param: fieldSelector::String
Param: includeUninitialized::Bool
Param: labelSelector::String
Param: limit::Int32
Param: pretty::String
Param: resourceVersion::String
Param: timeoutSeconds::Int32
Param: watch::Bool
Return: IoK8sApimachineryPkgApisMetaV1WatchEvent
"""
function watchSchedulingV1beta1PriorityClass(_api::SchedulingV1beta1Api, name::String; __continue__=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "GET", IoK8sApimachineryPkgApisMetaV1WatchEvent, "/apis/scheduling.k8s.io/v1beta1/watch/priorityclasses/{name}", ["BearerToken"])
    Swagger.set_param(_ctx.path, "name", name)  # type String
    Swagger.set_param(_ctx.query, "continue", __continue__)  # type String
    Swagger.set_param(_ctx.query, "fieldSelector", fieldSelector)  # type String
    Swagger.set_param(_ctx.query, "includeUninitialized", includeUninitialized)  # type Bool
    Swagger.set_param(_ctx.query, "labelSelector", labelSelector)  # type String
    Swagger.set_param(_ctx.query, "limit", limit)  # type Int32
    Swagger.set_param(_ctx.query, "pretty", pretty)  # type String
    Swagger.set_param(_ctx.query, "resourceVersion", resourceVersion)  # type String
    Swagger.set_param(_ctx.query, "timeoutSeconds", timeoutSeconds)  # type Int32
    Swagger.set_param(_ctx.query, "watch", watch)  # type Bool
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["*/*"] : [_mediaType])
    Swagger.exec(_ctx)
end

"""

watch individual changes to a list of PriorityClass. deprecated: use the 'watch' parameter with a list operation instead.
Param: __continue__::String
Param: fieldSelector::String
Param: includeUninitialized::Bool
Param: labelSelector::String
Param: limit::Int32
Param: pretty::String
Param: resourceVersion::String
Param: timeoutSeconds::Int32
Param: watch::Bool
Return: IoK8sApimachineryPkgApisMetaV1WatchEvent
"""
function watchSchedulingV1beta1PriorityClassList(_api::SchedulingV1beta1Api; __continue__=nothing, fieldSelector=nothing, includeUninitialized=nothing, labelSelector=nothing, limit=nothing, pretty=nothing, resourceVersion=nothing, timeoutSeconds=nothing, watch=nothing, _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "GET", IoK8sApimachineryPkgApisMetaV1WatchEvent, "/apis/scheduling.k8s.io/v1beta1/watch/priorityclasses", ["BearerToken"])
    Swagger.set_param(_ctx.query, "continue", __continue__)  # type String
    Swagger.set_param(_ctx.query, "fieldSelector", fieldSelector)  # type String
    Swagger.set_param(_ctx.query, "includeUninitialized", includeUninitialized)  # type Bool
    Swagger.set_param(_ctx.query, "labelSelector", labelSelector)  # type String
    Swagger.set_param(_ctx.query, "limit", limit)  # type Int32
    Swagger.set_param(_ctx.query, "pretty", pretty)  # type String
    Swagger.set_param(_ctx.query, "resourceVersion", resourceVersion)  # type String
    Swagger.set_param(_ctx.query, "timeoutSeconds", timeoutSeconds)  # type Int32
    Swagger.set_param(_ctx.query, "watch", watch)  # type Bool
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["*/*"] : [_mediaType])
    Swagger.exec(_ctx)
end

export createSchedulingV1beta1PriorityClass, deleteSchedulingV1beta1CollectionPriorityClass, deleteSchedulingV1beta1PriorityClass, getSchedulingV1beta1APIResources, listSchedulingV1beta1PriorityClass, patchSchedulingV1beta1PriorityClass, readSchedulingV1beta1PriorityClass, replaceSchedulingV1beta1PriorityClass, watchSchedulingV1beta1PriorityClass, watchSchedulingV1beta1PriorityClassList
