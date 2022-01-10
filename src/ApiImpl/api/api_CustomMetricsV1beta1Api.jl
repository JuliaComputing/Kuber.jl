# This file was generated by the Julia Swagger Code Generator
# Do not modify this file directly. Modify the swagger specification instead.

struct CustomMetricsV1beta1Api <: SwaggerApi
    client::Swagger.Client
end

function _swaggerinternal_listCustomMetricsV1beta1MetricValue(_api::CustomMetricsV1beta1Api, compositemetricname::String; pretty=nothing, fieldSelector=nothing, labelSelector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "GET", IoK8sApiCustomMetricsV1beta1MetricValueList, "/apis/custom.metrics.k8s.io/v1beta1/{compositemetricname}", ["BearerToken"])
    Swagger.set_param(_ctx.path, "compositemetricname", compositemetricname)  # type String
    Swagger.set_param(_ctx.query, "pretty", pretty)  # type String
    Swagger.set_param(_ctx.query, "fieldSelector", fieldSelector)  # type String
    Swagger.set_param(_ctx.query, "labelSelector", labelSelector)  # type String
    Swagger.set_param(_ctx.query, "limit", limit)  # type Int32
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["*/*"] : [_mediaType])
    return _ctx
end

"""

Retrieve the given metric for the given non-namespaced object (e.g. Node, PersistentVolume). Composite metric name is of the form \"<objecttype>/<objectname>/<metricname>\" Passing '*' for objectname would retrieve the given metric for all non-namespaced objects of the given type.
Param: compositemetricname::String (required)
Param: pretty::String
Param: fieldSelector::String
Param: labelSelector::String
Param: limit::Int32
Return: IoK8sApiCustomMetricsV1beta1MetricValueList
"""
function listCustomMetricsV1beta1MetricValue(_api::CustomMetricsV1beta1Api, compositemetricname::String; pretty=nothing, fieldSelector=nothing, labelSelector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = _swaggerinternal_listCustomMetricsV1beta1MetricValue(_api, compositemetricname; pretty=pretty, fieldSelector=fieldSelector, labelSelector=labelSelector, limit=limit, _mediaType=_mediaType)
    Swagger.exec(_ctx)
end

function listCustomMetricsV1beta1MetricValue(_api::CustomMetricsV1beta1Api, response_stream::Channel, compositemetricname::String; pretty=nothing, fieldSelector=nothing, labelSelector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = _swaggerinternal_listCustomMetricsV1beta1MetricValue(_api, compositemetricname; pretty=pretty, fieldSelector=fieldSelector, labelSelector=labelSelector, limit=limit, _mediaType=_mediaType)
    Swagger.exec(_ctx, response_stream)
end

function _swaggerinternal_listCustomMetricsV1beta1NamespacedMetricValue(_api::CustomMetricsV1beta1Api, compositemetricname::String, namespace::String; pretty=nothing, fieldSelector=nothing, labelSelector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = Swagger.Ctx(_api.client, "GET", IoK8sApiCustomMetricsV1beta1MetricValueList, "/apis/custom.metrics.k8s.io/v1beta1/namespaces/{namespace}/{compositemetricname}", ["BearerToken"])
    Swagger.set_param(_ctx.path, "compositemetricname", compositemetricname)  # type String
    Swagger.set_param(_ctx.path, "namespace", namespace)  # type String
    Swagger.set_param(_ctx.query, "pretty", pretty)  # type String
    Swagger.set_param(_ctx.query, "fieldSelector", fieldSelector)  # type String
    Swagger.set_param(_ctx.query, "labelSelector", labelSelector)  # type String
    Swagger.set_param(_ctx.query, "limit", limit)  # type Int32
    Swagger.set_header_accept(_ctx, ["application/json", "application/yaml", "application/vnd.kubernetes.protobuf", "application/json;stream=watch", "application/vnd.kubernetes.protobuf;stream=watch"])
    Swagger.set_header_content_type(_ctx, (_mediaType === nothing) ? ["*/*"] : [_mediaType])
    return _ctx
end

"""

retrieve the given metric (in composite form) which describes the given namespace. Composite form of metrics can be either \"metric/<metricname>\" to fetch metrics of all objects in the namespace, or \"<objecttype>/<objectname>/<metricname>\" to fetch metrics of the specified object type and name. Passing \"*\" for objectname would fetch metrics of all objects of the specified type in the namespace.
Param: compositemetricname::String (required)
Param: namespace::String (required)
Param: pretty::String
Param: fieldSelector::String
Param: labelSelector::String
Param: limit::Int32
Return: IoK8sApiCustomMetricsV1beta1MetricValueList
"""
function listCustomMetricsV1beta1NamespacedMetricValue(_api::CustomMetricsV1beta1Api, compositemetricname::String, namespace::String; pretty=nothing, fieldSelector=nothing, labelSelector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = _swaggerinternal_listCustomMetricsV1beta1NamespacedMetricValue(_api, compositemetricname, namespace; pretty=pretty, fieldSelector=fieldSelector, labelSelector=labelSelector, limit=limit, _mediaType=_mediaType)
    Swagger.exec(_ctx)
end

function listCustomMetricsV1beta1NamespacedMetricValue(_api::CustomMetricsV1beta1Api, response_stream::Channel, compositemetricname::String, namespace::String; pretty=nothing, fieldSelector=nothing, labelSelector=nothing, limit=nothing, _mediaType=nothing)
    _ctx = _swaggerinternal_listCustomMetricsV1beta1NamespacedMetricValue(_api, compositemetricname, namespace; pretty=pretty, fieldSelector=fieldSelector, labelSelector=labelSelector, limit=limit, _mediaType=_mediaType)
    Swagger.exec(_ctx, response_stream)
end

export listCustomMetricsV1beta1MetricValue, listCustomMetricsV1beta1NamespacedMetricValue