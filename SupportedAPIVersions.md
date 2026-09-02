## Supported API Versions

The generated client included in this version of Kuber.jl covers the following
Kubernetes API group versions, one module each:

| Group version | Module |
| --- | --- |
| `v1` (core) | `K8sV1` |
| `apiextensions.k8s.io/v1` | `K8sApiextensionsK8sIoV1` |
| `apiregistration.k8s.io/v1` | `K8sApiregistrationK8sIoV1` |
| `apps/v1` | `K8sAppsV1` |
| `autoscaling/v1` | `K8sAutoscalingV1` |
| `autoscaling/v2` | `K8sAutoscalingV2` |
| `batch/v1` | `K8sBatchV1` |
| `certificates.k8s.io/v1` | `K8sCertificatesK8sIoV1` |
| `coordination.k8s.io/v1` | `K8sCoordinationK8sIoV1` |
| `discovery.k8s.io/v1` | `K8sDiscoveryK8sIoV1` |
| `events.k8s.io/v1` | `K8sEventsK8sIoV1` |
| `metrics.k8s.io/v1beta1` | `K8sMetricsK8sIoV1beta1` |
| `networking.k8s.io/v1` | `K8sNetworkingK8sIoV1` |
| `node.k8s.io/v1` | `K8sNodeK8sIoV1` |
| `policy/v1` | `K8sPolicyV1` |
| `rbac.authorization.k8s.io/v1` | `K8sRbacAuthorizationK8sIoV1` |
| `scheduling.k8s.io/v1` | `K8sSchedulingK8sIoV1` |
| `storage.k8s.io/v1` | `K8sStorageK8sIoV1` |

Generated from the OpenAPI v3 documents of **Kubernetes v1.35.4** — see
`gen/openapi_v1/specs/SPECS_ORIGIN` for the exact source and checksums.

`metrics.k8s.io/v1beta1` is the exception: it is served by metrics-server rather
than by the apiserver, so it is absent from the release-tag documents and was
captured from a live cluster instead (`gen/openapi_v1/specs/SPECS_CAPTURED`).
Its kinds are only addressable against a cluster that runs metrics-server.

API groups that are not here — other aggregated APIs such as
`custom.metrics.k8s.io`, and CRD-backed groups — can be captured the same way
and plugged in with `Kuber.register!` without modifying Kuber; see the README.

Kubernetes schemas do not close their objects, so a client generated for one
minor tolerates fields *added* by a later server; only contract violations
(nulls where the document promises a value, changed shapes) bite, and GA APIs
rarely do that. Discovery skips any group version the server reports that is not
in the table above, with an informational log line under `verbose=true`.

`Kuber.ApiImpl.GROUP_MODULES` is this table at runtime.

### Not included

- **CRD-backed groups** and **aggregated APIs** (`metrics.k8s.io`,
  `custom.metrics.k8s.io`). Neither appears in upstream release-tag specs; both
  would have to be captured from a reference cluster's
  `/openapi/v3/apis/<group>/<version>`. The custom-metrics helpers
  (`list_custom_metrics`, `list_namespaced_custom_metrics`) throw a clear error
  in this build.
- Group versions no longer served by a modern API server (the `*beta*` and
  `*alpha*` variants of apps, batch, extensions, settings, auditregistration and
  so on, which the 0.2.x client shipped).

### Adding a group

Append it to `K8S_GROUPS` in `gen/openapi_v1/fetch_specs.sh` and rerun the
generation chain (`gen/openapi_v1/README.md`). Keep this file in sync.
