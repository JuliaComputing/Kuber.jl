#!/usr/bin/env bash
# Fetch pristine k8s OpenAPI v3 group documents from the upstream release tag.
#
# Source of truth is the kubernetes/kubernetes release tag rather than a live
# cluster: authoritative, reproducible, and decoupled from cluster quirks. One
# file per group lives under api/openapi-spec/v3/ at each tag, named
# apis__<group>__<version>_openapi.json (core is api__v1_openapi.json); we
# rename to the pipeline's apis_<group>_<version>.json convention.
#
# Adding a group is mechanical: append it to K8S_GROUPS below, then rerun
# fetch -> patch (patch_k8s_spec.jq) -> generate.jl -> emit_registry.jl.
set -euo pipefail
K8S_TAG="${1:?usage: fetch_specs.sh <k8s release tag, e.g. v1.35.4>}"
BASE="https://raw.githubusercontent.com/kubernetes/kubernetes/${K8S_TAG}/api/openapi-spec/v3"
DEST="$(dirname "$0")/specs"
mkdir -p "$DEST"

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

for g in $K8S_GROUPS; do
    out="$DEST/$(echo "$g" | sed 's/__/_/g').json"
    echo "fetching $g -> $out"
    curl -fsSL -o "$out" "$BASE/${g}_openapi.json"
done

# record provenance next to the specs
{
    echo "source: https://github.com/kubernetes/kubernetes tag ${K8S_TAG}"
    echo "path:   api/openapi-spec/v3/"
    echo "fetched: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "files:"
    (cd "$DEST" && sha256sum *.json | grep -v _patched)
} > "$DEST/SPECS_ORIGIN"
