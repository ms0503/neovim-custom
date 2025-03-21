{ pkgs }:
let
  sources =
    builtins.mapAttrs
      (
        _: pkg:
        let
          version = if (builtins.hasAttr "date" pkg) then pkg.date else pkg.version;
        in
        pkg // { inherit version; }
      )
      (
        import ../_sources/generated.nix {
          inherit (pkgs)
            dockerTools
            fetchFromGitHub
            fetchgit
            fetchurl
            ;
        }
      );
in
{
  bzl = pkgs.callPackage ./bzl.nix {
    sources = {
      x86_64-darwin = sources.bzl_darwin;
      x86_64-linux = sources.bzl_linux;
    };
  };
  cmake-language-server = pkgs.callPackage ./cmake-language-server.nix {
    source = sources.cmake-language-server;
  };
  nodePackages = import ./nodePackages pkgs;
  rubyPackages = import ./rubyPackages.nix pkgs;
  vimPlugins =
    (import ./vimPlugins {
      inherit (pkgs) vimUtils;
      sources = builtins.removeAttrs sources [
        "bazelrc-lsp"
        "bzl_darwin"
        "bzl_linux"
        "cmake-language-server"
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
