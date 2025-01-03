pkgs@{ nodejs, stdenv, ... }:
import ./cmp.nix {
  inherit pkgs;
  inherit nodejs;
  inherit (stdenv.hostPlatform) system;
}
