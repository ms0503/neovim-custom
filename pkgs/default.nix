{ pkgs }:
let
  sources = import ../_sources/generated.nix {
    inherit (pkgs)
      dockerTools
      fetchFromGitHub
      fetchgit
      fetchurl
      ;
  };
in
{
  vimPlugins =
    (import ./vimPlugins {
      inherit (pkgs) vimUtils;
      sources = builtins.removeAttrs sources [
        "guihua-lua"
      ];
    })
    // {
      guihua-lua = (
        import ./vimPlugins/guihua-lua {
          inherit (pkgs) vimUtils;
          source = sources.guihua-lua;
        }
      );
    };
}
# vim: et sts=2 sw=2 ts=2
