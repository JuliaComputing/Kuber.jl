# Compatibility shim for `nix-shell` users who don't have flakes enabled.
# Delegates to the devShell defined in flake.nix (pinned via flake.lock) so both
# entry points give the identical environment. Prefer `nix develop` if you can.
(import (
  fetchTarball {
    url = "https://github.com/edolstra/flake-compat/archive/refs/tags/v1.1.0.tar.gz";
    sha256 = "19d2z6xsvpxm184m41qrpi1bplilwipgnzv9jy17fgw421785q1m";
  }
) {
  src = ./.;
}).shellNix.default
