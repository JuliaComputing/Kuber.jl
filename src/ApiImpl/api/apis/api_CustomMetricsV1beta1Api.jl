# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

struct CustomMetricsV1beta1Api <: OpenAPI.APIClientImpl
    client::OpenAPI.Clients.Client
end

"""
The default API base path for APIs in `CustomMetricsV1beta1Api`.
This can be used to construct the `OpenAPI.Clients.Client` instance.
"""
basepath(::Type{ CustomMetricsV1beta1Api }) = "http://localhost"

const _returntypes_list_custom_metrics_v1beta1_metric_value_CustomMetricsV1beta1Api = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApiCustomMetricsV1beta1MetricValueList,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_list_custom_metrics_v1beta1_metric_value(_api::CustomMetricsV1beta1Api, compositemetricname::String; pretty=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_list_custom_metrics_v1beta1_metric_value_CustomMetricsV1beta1Api, "/apis/custom.metrics.k8s.io/v1beta1/{compositemetricname}", ["BearerToken", ])
    OpenAPI.Clients.set_param(_ctx.path, "compositemetricname", compositemetricname)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "fieldSelector", field_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "labelSelector", label_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "limit", limit)  # type Int64
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""Retrieve the given metric for the given non-namespaced object (e.g. Node, PersistentVolume). Composite metric name is of the form \"<objecttype>/<objectname>/<metricname>\" Passing '*' for objectname would retrieve the given metric for all non-namespaced objects of the given type.

Params:
- compositemetricname::String (required)
- pretty::String
- field_selector::String
- label_selector::String
- limit::Int64

Return: IoK8sApiCustomMetricsV1beta1MetricValueList, OpenAPI.Clients.ApiResponse
"""
function list_custom_metrics_v1beta1_metric_value(_api::CustomMetricsV1beta1Api, compositemetricname::String; pretty=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = _oacinternal_list_custom_metrics_v1beta1_metric_value(_api, compositemetricname; pretty=pretty, field_selector=field_selector, label_selector=label_selector, limit=limit, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function list_custom_metrics_v1beta1_metric_value(_api::CustomMetricsV1beta1Api, response_stream::Channel, compositemetricname::String; pretty=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = _oacinternal_list_custom_metrics_v1beta1_metric_value(_api, compositemetricname; pretty=pretty, field_selector=field_selector, label_selector=label_selector, limit=limit, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

const _returntypes_list_custom_metrics_v1beta1_namespaced_metric_value_CustomMetricsV1beta1Api = Dict{Regex,Type}(
    Regex("^" * replace("200", "x"=>".") * "\$") => IoK8sApiCustomMetricsV1beta1MetricValueList,
    Regex("^" * replace("401", "x"=>".") * "\$") => Nothing,
)

function _oacinternal_list_custom_metrics_v1beta1_namespaced_metric_value(_api::CustomMetricsV1beta1Api, compositemetricname::String, namespace::String; pretty=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = OpenAPI.Clients.Ctx(_api.client, "GET", _returntypes_list_custom_metrics_v1beta1_namespaced_metric_value_CustomMetricsV1beta1Api, "/apis/custom.metrics.k8s.io/v1beta1/namespaces/{namespace}/{compositemetricname}", ["BearerToken", ])
    OpenAPI.Clients.set_param(_ctx.path, "compositemetricname", compositemetricname)  # type String
    OpenAPI.Clients.set_param(_ctx.path, "namespace", namespace)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "pretty", pretty)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "fieldSelector", field_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "labelSelector", label_selector)  # type String
    OpenAPI.Clients.set_param(_ctx.query, "limit", limit)  # type Int64
    OpenAPI.Clients.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch", ])
    OpenAPI.Clients.set_header_content_type(_ctx, (_mediaType === nothing) ? [] : [_mediaType])
    return _ctx
end

@doc raw"""retrieve the given metric (in composite form) which describes the given namespace. Composite form of metrics can be either \"metric/<metricname>\" to fetch metrics of all objects in the namespace, or \"<objecttype>/<objectname>/<metricname>\" to fetch metrics of the specified object type and name. Passing \"*\" for objectname would fetch metrics of all objects of the specified type in the namespace.

Params:
- compositemetricname::String (required)
- namespace::String (required)
- pretty::String
- field_selector::String
- label_selector::String
- limit::Int64

Return: IoK8sApiCustomMetricsV1beta1MetricValueList, OpenAPI.Clients.ApiResponse
"""
function list_custom_metrics_v1beta1_namespaced_metric_value(_api::CustomMetricsV1beta1Api, compositemetricname::String, namespace::String; pretty=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = _oacinternal_list_custom_metrics_v1beta1_namespaced_metric_value(_api, compositemetricname, namespace; pretty=pretty, field_selector=field_selector, label_selector=label_selector, limit=limit, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx)
end

function list_custom_metrics_v1beta1_namespaced_metric_value(_api::CustomMetricsV1beta1Api, response_stream::Channel, compositemetricname::String, namespace::String; pretty=nothing, field_selector=nothing, label_selector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = _oacinternal_list_custom_metrics_v1beta1_namespaced_metric_value(_api, compositemetricname, namespace; pretty=pretty, field_selector=field_selector, label_selector=label_selector, limit=limit, _mediaType=_mediaType)
    return OpenAPI.Clients.exec(_ctx, response_stream)
end

export list_custom_metrics_v1beta1_metric_value
export list_custom_metrics_v1beta1_namespaced_metric_value
