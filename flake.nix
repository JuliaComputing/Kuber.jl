{
  description = "Dev shell for testing Kuber.jl against a local kind cluster";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Cluster/proxy settings shared by the helper scripts below.
        clusterName = "kuber-test";
        proxyPort = "8001"; # test/runtests.jl hardcodes http://localhost:8001
        # Pinned kind node image. Kuber.jl's bundled OpenAPI client is generated
        # against k8s ~1.24 (see gen/spec/k8s_1_24_openapi_v3.json), but the test
        # suite also passes against modern servers: API-group discovery logs and
        # skips groups the client doesn't know rather than erroring. v1.35.0 is
        # the image shipped with the pinned kind (0.31.0), so it pulls by digest
        # with no version-skew warning. Change this to e.g. kindest/node:v1.24.17
        # to test against the exact version the client was generated from.
        nodeImage = "kindest/node:v1.35.0";

        # Isolated kubeconfig so kind/kubectl never touch (or depend on) an
        # existing cluster's config. Without this, on a host whose KUBECONFIG
        # points at a read-only file (e.g. a system k3s at
        # /etc/rancher/k3s/k3s.yaml), `kind create cluster` fails to write its
        # kubeconfig AND `kubectl proxy` silently falls back to the current
        # context - so the suite would run against the wrong cluster.
        kubeconfig = "$HOME/.kube/kind-${clusterName}.config";

        cluster-up = pkgs.writeShellScriptBin "kuber-cluster-up" ''
          set -euo pipefail
          export KUBECONFIG="${kubeconfig}"
          if kind get clusters 2>/dev/null | grep -qx "${clusterName}"; then
            echo "kind cluster '${clusterName}' already exists."
          else
            echo "Creating kind cluster '${clusterName}' (${nodeImage})..."
            kind create cluster --name "${clusterName}" --image "${nodeImage}"
          fi
          kubectl cluster-info --context "kind-${clusterName}"
          echo
          echo "Next: run 'kuber-proxy' in this shell, then 'kuber-test' in another."
        '';

        cluster-down = pkgs.writeShellScriptBin "kuber-cluster-down" ''
          set -euo pipefail
          export KUBECONFIG="${kubeconfig}"
          kind delete cluster --name "${clusterName}"
        '';

        proxy = pkgs.writeShellScriptBin "kuber-proxy" ''
          set -euo pipefail
          export KUBECONFIG="${kubeconfig}"
          kubectl config use-context "kind-${clusterName}"
          echo "Serving Kubernetes API at http://localhost:${proxyPort} (Ctrl-C to stop)..."
          exec kubectl proxy --port=${proxyPort}
        '';

        run-tests = pkgs.writeShellScriptBin "kuber-test" ''
          set -euo pipefail
          cd "''${KUBER_ROOT:-$PWD}"
          exec julia --project -e 'using Pkg; Pkg.instantiate(); Pkg.test()'
        '';
      in {
        devShells.default = pkgs.mkShell {
          # Julia is intentionally NOT provided here - use your own juliaup-managed
          # `julia` from the host PATH (nix develop / nix-shell are impure by
          # default, so it stays available). This keeps the toolchain under
          # juliaup's control rather than pinning a nixpkgs Julia.
          packages = [
            pkgs.kubectl
            pkgs.kind
            cluster-up
            cluster-down
            proxy
            run-tests
          ];

          shellHook = ''
            export KUBER_ROOT="$PWD"
            # Point all kubectl/kind at an isolated kubeconfig for this project so
            # we never read or clobber a system cluster (e.g. k3s) config.
            export KUBECONFIG="${kubeconfig}"
            echo "Kuber.jl test shell"
            echo "  KUBECONFIG=${kubeconfig} (isolated - kind cluster only)"
            echo "  Requires a running Docker daemon on the host (kind shells out to 'docker')."
            if ! docker info >/dev/null 2>&1; then
              echo "  WARNING: 'docker info' failed - start Docker before 'kuber-cluster-up'."
            fi
            if command -v julia >/dev/null 2>&1; then
              echo "  julia: $(command -v julia) (provided externally, e.g. juliaup)"
            else
              echo "  WARNING: no 'julia' on PATH - install it via juliaup before 'kuber-test'."
            fi
            echo
            echo "  kuber-cluster-up    create the kind cluster (k8s pinned to ${nodeImage})"
            echo "  kuber-proxy         serve the API at http://localhost:${proxyPort} (run in its own terminal)"
            echo "  kuber-test          run the Kuber.jl test suite"
            echo "  kuber-cluster-down  tear the cluster down"
          '';
        };
      });
}
