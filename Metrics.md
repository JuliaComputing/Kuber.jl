Kubernetes Metrics and Custom Metrics APIs generalize consumption of metrics published by the cluster and applications running within it.

## Node and Pod Metrics

Kubernetes Pod and Node metrics are exposed like any other Kubernetes resources. Below is a sample interaction that illustrates how to fetch them using Kuber.jl:

```julia
julia> using Kuber

julia> ctx = KuberContext()
Kubernetes namespace default at http://localhost:8001

julia> Kuber.set_api_versions!(ctx; verbose=true)
┌ Info: Core versions
│   supported = "v1"
└   preferred = "v1"
...
┌ Info: metrics.k8s.io (Metrics) versions
│   supported = "v1beta1"
└   preferred = "v1beta1"
┌ Info: custom.metrics.k8s.io (CustomMetrics) versions
│   supported = "v1beta1"
└   preferred = "v1beta1"
...

julia> # same as: list(ctx, :NodeMetrics; namespace=nothing)
julia> result = get(ctx, :NodeMetrics)
{
  "metadata": {
    "selfLink": "/apis/metrics.k8s.io/v1beta1/nodes"
  },
  "items": [
    {
      "timestamp": "2020-03-10T04:35:34Z",
      "metadata": {
        "creationTimestamp": "2020-03-10T04:35:47Z",
        "selfLink": "/apis/metrics.k8s.io/v1beta1/nodes/tanlto",
        "name": "tanlto"
      },
      "usage": {
        "cpu": "608075001n",
        "memory": "11870920Ki"
      },
      "window": "30s"
    }
  ]
}

julia> result = get(ctx, :NodeMetrics, "tanlto")
{
  "timestamp": "2020-03-10T04:35:34Z",
  "metadata": {
    "creationTimestamp": "2020-03-10T04:35:50Z",
    "selfLink": "/apis/metrics.k8s.io/v1beta1/nodes/tanlto",
    "name": "tanlto"
  },
  "usage": {
    "cpu": "608075001n",
    "memory": "11870920Ki"
  },
  "window": "30s"
}


julia> # same as: list(ctx, :PodMetrics; namespace=nothing)
julia> result = get(ctx, :PodMetrics)
{
  "metadata": {
    "selfLink": "/apis/metrics.k8s.io/v1beta1/pods"
  },
  "items": [
    {
      "timestamp": "2020-03-10T04:35:29Z",
      "metadata": {
        "creationTimestamp": "2020-03-10T04:36:00Z",
        "selfLink": "/apis/metrics.k8s.io/v1beta1/namespaces/kube-system/pods/elasticsearch-logging-0",
        "name": "elasticsearch-logging-0",
        "namespace": "kube-system"
      },
      "window": "30s",
      "containers": [
        {
          "usage": {
            "cpu": "6898860n",
            "memory": "1337780Ki"
          },
          "name": "elasticsearch-logging"
        }
      ]
    },
    ...
    {
      "timestamp": "2020-03-10T04:35:30Z",
      "metadata": {
        "creationTimestamp": "2020-03-10T04:36:00Z",
        "selfLink": "/apis/metrics.k8s.io/v1beta1/namespaces/kube-system/pods/kube-controller-manager-tanlto",
        "name": "kube-controller-manager-tanlto",
        "namespace": "kube-system"
      },
      "window": "30s",
      "containers": [
        {
          "usage": {
            "cpu": "23127068n",
            "memory": "61468Ki"
          },
          "name": "kube-controller-manager"
        }
      ]
    }
  ]
}

julia> result = get(ctx, :PodMetrics, "kube-proxy-7nczq")
{
  "timestamp": "2020-03-10T04:35:57Z",
  "metadata": {
    "creationTimestamp": "2020-03-10T04:36:16Z",
    "selfLink": "/apis/metrics.k8s.io/v1beta1/namespaces/kube-system/pods/kube-proxy-7nczq",
    "name": "kube-proxy-7nczq",
    "namespace": "kube-system"
  },
  "window": "30s",
  "containers": [
    {
      "usage": {
        "cpu": "533122n",
        "memory": "32028Ki"
      },
      "name": "kube-proxy"
    }
  ]
}
```

## Custom Metrics

Since the custom metrics APIs take more than one parameters, unlike the rest of the Kubernetes APIs, it is not possible to generalize both `list` and `get` actions into the same `get` API in Kuber.jl (as is done for the other Kubernetes entities). Kuber.jl therefore exposes a `list` API that explicitly does listing. The `list` API works for both custom metrics and any other Kubernetes resource that supports listing. The older `get` API continues to work for listing resources other than custom metrics.

Kuber.jl attempts to genralize the custom metrics API to match the rest of Kubernetes format. That requires taking a composite metric name as a single string, with components separated by the `/` character. It matches the way Kubernetes API discovery exposes the endpoints. E.g.:

```
{
  "kind": "APIResourceList",
  "apiVersion": "v1",
  "groupVersion": "custom.metrics.k8s.io/v1beta1",
  "resources": [
    {
      "name": "pods/prometheus_target_scrape_pool_reloads",
      "singularName": "",
      "namespaced": true,
      "kind": "MetricValueList",
      "verbs": [
        "get"
      ]
    },
    {
      "name": "jobs.batch/kube_namespace_status_phase",
      "singularName": "",
      "namespaced": true,
      "kind": "MetricValueList",
      "verbs": [
        "get"
      ]
    },
    {
      "name": "pods/node_memory_Inactive_anon_bytes",
      "singularName": "",
      "namespaced": true,
      "kind": "MetricValueList",
      "verbs": [
        "get"
      ]
    },
    ...
  ]
}
```

The downside however is that it needs the API user to be cognizant of the formatting rule. Therefore Kuber.jl also exports helper methods specifically for custom metrics - `list_custom_metrics` `list_namespaced_custom_metrics`.

### Non-namespaced Custom Metrics

Retrieve the given metric for the given non-namespaced object (e.g. Node, PersistentVolume). Composite metric name is of the form `<objecttype>/<objectname>/<metricname>` Passing `*` for objectname would retrieve the given metric for all non-namespaced objects of the given type.

```julia
julia> # same as: list(ctx, :MetricValue, "nodes/*/go_memstats_last_gc_time_seconds"; namespace=nothing)
julia> list_custom_metrics(ctx, "nodes", "go_memstats_last_gc_time_seconds")
{
  "kind": "MetricValueList",
  "metadata": {
    "selfLink": "/apis/custom.metrics.k8s.io/v1beta1/nodes/%2A/go_memstats_last_gc_time_seconds"
  },
  "apiVersion": "custom.metrics.k8s.io/v1beta1",
  "items": [
    {
      "timestamp": "2020-03-13T06:49:27Z",
      "value": "1584082154494m",
      "metricName": "go_memstats_last_gc_time_seconds",
      "describedObject": {
        "kind": "Node",
        "apiVersion": "/v1",
        "name": "tanlto"
      }
    }
  ]
}

julia> # same as: list(ctx, :MetricValue, "nodes/tanlto/go_memstats_last_gc_time_seconds"; namespace=nothing)
julia> list_custom_metrics(ctx, "nodes", "tanlto", "go_memstats_last_gc_time_seconds")
{
  "kind": "MetricValueList",
  "metadata": {
    "selfLink": "/apis/custom.metrics.k8s.io/v1beta1/nodes/tanlto/go_memstats_last_gc_time_seconds"
  },
  "apiVersion": "custom.metrics.k8s.io/v1beta1",
  "items": [
    {
      "timestamp": "2020-03-13T06:50:13Z",
      "value": "1584082185722m",
      "metricName": "go_memstats_last_gc_time_seconds",
      "describedObject": {
        "kind": "Node",
        "apiVersion": "/v1",
        "name": "tanlto"
      }
    }
  ]
}
```

### Namespaced Custom Metrics

Retrieve the given metric (in composite form) which describes the given namespace. Composite form of metrics can be either "metric/<metricname>" to fetch metrics of all objects in the namespace, or `<objecttype>/<objectname>/<metricname>` to fetch metrics of the specified object type and name. Passing `*` for objectname would fetch metrics of all objects of the specified type in the namespace.

```julia
julia> # same as: list(ctx, :MetricValue, "metrics/coredns_forward_request_duration_seconds_sum")
julia> list_namespaced_custom_metrics(ctx, "coredns_forward_request_duration_seconds_sum")
{
  "kind": "MetricValueList",
  "metadata": {
    "selfLink": "/apis/custom.metrics.k8s.io/v1beta1/namespaces/kube-system/metrics/coredns_forward_request_duration_seconds_sum"
  },
  "apiVersion": "custom.metrics.k8s.io/v1beta1",
  "items": [
    {
      "timestamp": "2020-03-13T06:40:17Z",
      "value": "23336m",
      "metricName": "coredns_forward_request_duration_seconds_sum",
      "describedObject": {
        "kind": "Namespace",
        "apiVersion": "/v1",
        "name": "kube-system"
      }
    }
  ]
}


julia> # same as: list(ctx, :MetricValue, "pods/*/coredns_forward_request_duration_seconds_sum")
julia> list_namespaced_custom_metrics(ctx, "pods", "coredns_forward_request_duration_seconds_sum")
{
  "kind": "MetricValueList",
  "metadata": {
    "selfLink": "/apis/custom.metrics.k8s.io/v1beta1/namespaces/kube-system/pods/%2A/coredns_forward_request_duration_seconds_sum"
  },
  "apiVersion": "custom.metrics.k8s.io/v1beta1",
  "items": [
    {
      "timestamp": "2020-03-13T06:45:39Z",
      "value": "11452m",
      "metricName": "coredns_forward_request_duration_seconds_sum",
      "describedObject": {
        "kind": "Pod",
        "apiVersion": "/v1",
        "name": "coredns-6955765f44-66hlh",
        "namespace": "kube-system"
      }
    },
    {
      "timestamp": "2020-03-13T06:45:39Z",
      "value": "12338m",
      "metricName": "coredns_forward_request_duration_seconds_sum",
      "describedObject": {
        "kind": "Pod",
        "apiVersion": "/v1",
        "name": "coredns-6955765f44-n4nhj",
        "namespace": "kube-system"
      }
    }
  ]
}

julia> # same as: list(ctx, :MetricValue, "pods/coredns-6955765f44-n4nhj/coredns_forward_request_duration_seconds_sum")
julia> list_namespaced_custom_metrics(ctx, "pods", "coredns-6955765f44-n4nhj", "coredns_forward_request_duration_seconds_sum")
{
  "kind": "MetricValueList",
  "metadata": {
    "selfLink": "/apis/custom.metrics.k8s.io/v1beta1/namespaces/kube-system/pods/coredns-6955765f44-n4nhj/coredns_forward_request_duration_seconds_sum"
  },
  "apiVersion": "custom.metrics.k8s.io/v1beta1",
  "items": [
    {
      "timestamp": "2020-03-13T06:47:01Z",
      "value": "12338m",
      "metricName": "coredns_forward_request_duration_seconds_sum",
      "describedObject": {
        "kind": "Pod",
        "apiVersion": "/v1",
        "name": "coredns-6955765f44-n4nhj",
        "namespace": "kube-system"
      }
    }
  ]
}
```
