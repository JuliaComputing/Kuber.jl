# Reference captures — evidence, not pipeline input

These documents are **not** sources for the generation chain. Nothing here is
patched, generated or registered, and `specs/` is deliberately the only directory
`fetch_specs.sh`, `patch_k8s_spec.jq` and `generate.jl` read. A document lands
here when it was captured to answer a question rather than to ship a group, and
it stays so the answer can be re-checked without standing the cluster back up.

## `custom.metrics.k8s.io_v1beta1.json`

Captured 2026-08-15 from `prometheus-adapter` v0.12.0 (chart
`prometheus-community/prometheus-adapter` 5.3.0) on a local k3s v1.35.4, via
`kubectl get --raw /openapi/v3/apis/custom.metrics.k8s.io/v1beta1 | jq .` — the
same call `fetch_specs.sh --from-cluster` makes. No Prometheus was behind the
adapter, which affects which *metrics* it discovers but not the document: the
schema is static, the resource list is what varies.

It is here because it decided `OpenAPIv1ConsumerGaps.md` C5, and the answer was
not to ship the group. See C5 for the reasoning; in short, the schemas are the
adapter-independent boilerplate that was predicted, but the *operations* carry no
`x-kubernetes-group-version-kind` and address metrics through a three-variable
path, neither of which the registry emitter or the verb layer can carry today.

To reproduce or re-check:

```sh
helm install pa oci://ghcr.io/prometheus-community/charts/prometheus-adapter \
  --namespace custom-metrics --create-namespace --wait
kubectl get --raw /openapi/v3/apis/custom.metrics.k8s.io/v1beta1 | jq .
helm uninstall pa -n custom-metrics && kubectl delete ns custom-metrics
```
