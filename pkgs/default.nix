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
  bazelrc-lsp = pkgs.rustPlatform.buildRustPackage {
    inherit (sources.bazelrc-lsp) pname src version;
    cargoHash = "sha256-mBXXftmwEKq1ClgLwrWzKE5PdV6WnMCso4fso4ANS+k=";
  };
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
        "gradle-language-server"
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
