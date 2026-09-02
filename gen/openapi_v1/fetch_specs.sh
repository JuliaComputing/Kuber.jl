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
# why its provenance is recorded separately and in more detail. SPECS_CAPTURED
# holds one record per file and is merged, not rewritten, so capturing one group
# leaves every other group's record alone.
#
# Adding a group is mechanical either way: append it to K8S_GROUPS below (or
# capture it), then rerun patch (patch_k8s_spec.jq) -> generate.jl ->
# emit_registry.jl.
set -euo pipefail
# SPECS_DIR exists so the capture path can be exercised against a throwaway
# directory; everything real uses the default.
DEST="${SPECS_DIR:-$(dirname "$0")/specs}"
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
    PROV="$DEST/SPECS_CAPTURED"
    server="$("$KUBECTL" version -o json 2>/dev/null | jq -r '.serverVersion.gitVersion // "unknown"')"
    context="$("$KUBECTL" config current-context 2>/dev/null || echo unknown)"
    now="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

    newrec="$(mktemp)"
    # $tmp has already been moved into place on the success path, so removing it
    # here is a no-op; it only matters when a capture died mid-flight.
    trap 'rm -f "$newrec" "${tmp:-}"' EXIT
    names=""
    for gv in "$@"; do
        case "$gv" in
            */*) ;;
            *) echo "expected <group>/<version>, got '$gv'" >&2; exit 1;;
        esac
        name="apis_${gv%/*}_${gv#*/}.json"
        out="$DEST/$name"
        echo "capturing $gv -> $out"
        # jq . normalizes the apiserver's compact JSON to the same shape the
        # fetched documents have, so the two sources diff alike. Through a temp
        # file, so a failed capture cannot leave a truncated document behind:
        # the redirect would have emptied the old one before kubectl was known
        # to have failed.
        tmp="$(mktemp "$DEST/.$name.XXXXXX")"
        if ! "$KUBECTL" get --raw "/openapi/v3/apis/$gv" | jq . > "$tmp"; then
            rm -f "$tmp"
            echo "capture failed for $gv — $out left as it was" >&2
            exit 1
        fi
        mv "$tmp" "$out"
        {
            echo "file:     $name"
            echo "path:     /openapi/v3/apis/$gv"
            echo "server:   $server"
            echo "context:  $context"
            echo "captured: $now"
            echo "sha256:   $(sha256sum < "$out" | cut -d' ' -f1)"
            echo ""
        } >> "$newrec"
        names="$names $name"
    done

    # Merge, do not overwrite. Each capture owns the records for the files it
    # just wrote and leaves every other record alone, so groups captured at
    # different times from different clusters keep their own provenance. This
    # replaced a plain `>`, under which a second single-group capture silently
    # erased the first group's record — in the one file whose entire job is to
    # remember where a document came from.
    kept=""
    if [ -f "$PROV" ]; then
        kept="$(awk -v drop="$names" '
            BEGIN { RS = ""; n = split(drop, a, " "); for (i = 1; i <= n; i++) d[a[i]] = 1 }
            /^#/ { next }
            {
                f = ""
                split($0, lines, "\n")
                for (i in lines) if (lines[i] ~ /^file:[ \t]+/) { f = lines[i]; sub(/^file:[ \t]+/, "", f) }
                if (f in d) next               # this run rewrites it
                # A block with no file: line is not a record this script wrote.
                # Keep it verbatim and say so: dropping it would be the same
                # silent provenance loss this merge exists to prevent.
                if (f == "") print "SPECS_CAPTURED: keeping an unrecognized block verbatim" > "/dev/stderr"
                printf "%s\n\n", $0
            }' "$PROV")"
    fi

    {
        cat <<'HDR'
# Provenance for documents captured from a live cluster: aggregated APIs
# (metrics.k8s.io and the like) and CRD-backed groups, which release-tag specs
# do not carry. Kept apart from SPECS_ORIGIN because a captured document is only
# as reproducible as the cluster it came from.
#
# One record per file. Re-capturing a file replaces its record and leaves the
# others alone.
HDR
        echo ""
        if [ -n "$kept" ]; then printf '%s\n\n' "$kept"; fi
        cat "$newrec"
    } > "$PROV.new"
    # Command substitution eats trailing newlines, which is the point.
    printf '%s\n' "$(cat "$PROV.new")" > "$PROV"
    rm -f "$PROV.new"
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
