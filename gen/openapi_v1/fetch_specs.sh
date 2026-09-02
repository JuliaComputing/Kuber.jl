#!/usr/bin/env bash
# Fetch k8s OpenAPI v3 group documents into specs/, from either of two sources.
#
#   fetch_specs.sh <k8s release tag>                     # e.g. v1.35.4
#   fetch_specs.sh --from-cluster <group>/<version>...   # e.g. metrics.k8s.io/v1beta1
#
# **Release tag** is the source of truth for everything the apiserver itself
# serves: authoritative, reproducible, and decoupled from cluster quirks. One
# file per group lives under api/openapi-spec/v3/ at each tag, named
# apis__<group>__<version>_openapi.json (core is api__v1_openapi.json); we
# rename to the pipeline's apis_<group>_<version>.json convention.
#
# **A cluster** is the only source for the rest. Aggregated APIs (metrics.k8s.io
# is served by metrics-server, custom.metrics.k8s.io by an adapter) and
# CRD-backed groups are absent from release-tag specs by construction — they are
# not part of Kubernetes. A live apiserver serves a real OpenAPI 3.0.0 document
# for every group version it hosts, aggregated and CRD alike, at
# /openapi/v3/apis/<group>/<version>.
#
# The two modes write separate provenance files, so neither clobbers the other's
# record: SPECS_ORIGIN for the tag, SPECS_CAPTURED for the cluster. A captured
# document is only as reproducible as the cluster it came from, which is exactly
# why its provenance is recorded separately and in more detail.
#
# Adding a group is mechanical either way: append it to K8S_GROUPS below (or
# capture it), then rerun patch (patch_k8s_spec.jq) -> generate.jl ->
# emit_registry.jl.
set -euo pipefail
DEST="$(dirname "$0")/specs"
mkdir -p "$DEST"

usage() {
    echo "usage: fetch_specs.sh <k8s release tag, e.g. v1.35.4>" >&2
    echo "       fetch_specs.sh --from-cluster <group>/<version>... [KUBECTL=kubectl]" >&2
    exit 1
}

# ── cluster capture ────────────────────────────────────────────────────────
if [ "${1:-}" = "--from-cluster" ]; then
    shift
    [ $# -gt 0 ] || usage
    KUBECTL="${KUBECTL:-kubectl}"
    captured=""
    for gv in "$@"; do
        case "$gv" in
            */*) ;;
            *) echo "expected <group>/<version>, got '$gv'" >&2; exit 1;;
        esac
        out="$DEST/apis_${gv%/*}_${gv#*/}.json"
        echo "capturing $gv -> $out"
        # jq . normalizes the apiserver's compact JSON to the same shape the
        # fetched documents have, so the two sources diff alike.
        "$KUBECTL" get --raw "/openapi/v3/apis/$gv" | jq . > "$out"
        captured="$captured $(basename "$out")"
    done

    {
        echo "source: live cluster (aggregated APIs and CRD groups are not in release-tag specs)"
        echo "path:   /openapi/v3/apis/<group>/<version>"
        echo "server: $("$KUBECTL" version -o json 2>/dev/null | jq -r '.serverVersion.gitVersion // "unknown"')"
        echo "context: $("$KUBECTL" config current-context 2>/dev/null || echo unknown)"
        echo "captured: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
        echo "files:"
        (cd "$DEST" && sha256sum $captured)
    } > "$DEST/SPECS_CAPTURED"
    exit 0
fi

# ── upstream release tag ───────────────────────────────────────────────────
K8S_TAG="${1:-}"
[ -n "$K8S_TAG" ] || usage
BASE="https://raw.githubusercontent.com/kubernetes/kubernetes/${K8S_TAG}/api/openapi-spec/v3"

# core, then the trial's group set — the minimum set for the existing test
# suite. Generating a subset keeps the checked-in module size down (core v1
# alone is ~6.7 MiB of generated Julia).
K8S_GROUPS="
api__v1
apis__apps__v1
apis__batch__v1
apis__autoscaling__v1
apis__autoscaling__v2
apis__rbac.authorization.k8s.io__v1
apis__networking.k8s.io__v1
apis__storage.k8s.io__v1
apis__policy__v1
apis__events.k8s.io__v1
apis__scheduling.k8s.io__v1
apis__coordination.k8s.io__v1
apis__certificates.k8s.io__v1
apis__discovery.k8s.io__v1
apis__node.k8s.io__v1
apis__apiextensions.k8s.io__v1
apis__apiregistration.k8s.io__v1
"

fetched=""
for g in $K8S_GROUPS; do
    out="$DEST/$(echo "$g" | sed 's/__/_/g').json"
    echo "fetching $g -> $out"
    curl -fsSL -o "$out" "$BASE/${g}_openapi.json"
    fetched="$fetched $(basename "$out")"
done

# record provenance next to the specs, for the files this mode owns only
{
    echo "source: https://github.com/kubernetes/kubernetes tag ${K8S_TAG}"
    echo "path:   api/openapi-spec/v3/"
    echo "fetched: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "files:"
    (cd "$DEST" && sha256sum $fetched)
} > "$DEST/SPECS_ORIGIN"
