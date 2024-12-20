{ pkgs }:
let
  sources = import ../_sources/generated.nix {
    inherit (pkgs) dockerTools fetchFromGitHub fetchgit fetchurl;
  };
in
{
  vimPlugins = import ./vimPlugins {
    inherit sources;
    inherit (pkgs) vimUtils;
  };
}
# vim: et sts=2 sw=2 ts=2
