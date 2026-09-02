# OpenAPI.jl 1.0 bake-pipeline prototype

Companion to [`../../OpenAPIv1RewriteNotes.md`](../../OpenAPIv1RewriteNotes.md).
Prototyped 2026-08-10 against OpenAPI.jl PR 103 at head `bd96d53`,
re-verified at `c2a5244` and `1ff9ba8` (2026-08-12); all live tests passed
against a k3s v1.35 cluster (`k8sbaked.jl` 8/8, `k8spristine_v3.jl` 11/11 —
the latter exercises the unpatched-spec route: tolerant decoding and the
watch-codec behavior including the `1ff9ba8` accept-scoped codec on a shared
client, and needs no spec patching, just steps 1 and 4 below with the
pristine document generated as `K8sCoreV1`).

## Re-running it

Requirements: Julia ≥ 1.11, a checkout of the OpenAPI.jl PR branch, `jq`,
`kubectl` pointed at a test cluster you can create/delete configmaps in.

```sh
# 1. Get the pristine spec (match your cluster version, or pull from the cluster)
curl -sL -o api__v1_openapi.json \
  https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/v3/api__v1_openapi.json
# (alternative, exact match to the cluster:)
# kubectl get --raw /openapi/v3/api/v1 > api__v1_openapi.json

# 2. Patch (nullable Time/MicroTime + nullable arrays + /watch/ paths -> WatchEvent)
jq -f patch_k8s_spec.jq api__v1_openapi.json > api__v1_patched.json

# 3. Generate (strict mode is the default; ~5s cold / ~3s warm, ~6.7 MiB output)
julia --project=<env with the OpenAPI.jl PR branch + HTTP> -e '
  using OpenAPI, HTTP
  OpenAPI.client("api__v1_patched.json"; name = "K8sCoreV1P", path = "K8sCoreV1P.jl")'

# 4. Live test (expects the generated K8sCoreV1P.jl in this directory)
kubectl proxy --port=8801 &
julia --project=<same env> k8sbaked.jl
```

`k8sbaked.jl` verifies, with full validation on:

- pod list across all namespaces decodes, `lastProbeTime: null` arriving as
  `nothing` (fails hard with the pristine spec);
- a live configmap watch through the dedicated `/watch/` operation decodes typed
  `WatchEvent`s (an ADDED and a DELETED triggered via kubectl mid-watch);
- `close(channel)` cancels the watch.

Why `/watch/` paths instead of `list(...; watch=true)`: k8s always replies
`Content-Type: application/json` regardless of `Accept`, and one OpenAPI
operation cannot describe both the List shape and WatchEvent frames — see
section 4 of the notes. Since `1ff9ba8` there is a patch-free alternative for
watch: register `codec!(client, "application/json;stream=watch"; decode=...)`
and pass `accept="application/json;stream=watch"` on `list(...; watch=true)`
calls — see section 5 of the notes; `k8spristine_v3.jl` covers it live.

## The all-groups sweep

`smoke_groups.jl` extends the pipeline to **every** OpenAPI v3 group document
the cluster serves (27 on k3s v1.35, including CRD-backed groups and the
aggregated metrics API). Verified 2026-08-12 at `1ff9ba8`: 27/27 patch +
strict generate (~39s, ~30 MiB), all modules co-load, 74/74 strict live list
ops (854 items), typed apps/v1 watch 5/5.

```sh
mkdir -p groups
curl -s http://127.0.0.1:8801/openapi/v3 \
  | jq -r '.paths | keys[]' \
  | grep -E '^(api/v[0-9]+|apis/[^/]+/v[0-9a-z]+)$' \
  | while read p; do
      curl -s "http://127.0.0.1:8801/openapi/v3/$p" -o "groups/$(echo $p | tr '/' '_').json"
      jq -f patch_k8s_spec.jq "groups/$(echo $p | tr '/' '_').json" \
        > "groups/$(echo $p | tr '/' '_')_patched.json"
    done
# generate each patched doc as K8s<Group><Version> (see smoke_groups.jl for
# the module-name convention), then:
julia --project=<env with the OpenAPI.jl PR branch + HTTP> smoke_groups.jl
```
