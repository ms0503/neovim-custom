_: {
  perSystem =
    { lib, pkgs, ... }:
    {
      legacyPackages =
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
          nodePackages = import ./nodePackages pkgs;
          rubyPackages = import ./rubyPackages.nix pkgs;
          vimPlugins =
            (import ./vimPlugins {
              inherit (pkgs) vimUtils;
              sources = builtins.removeAttrs sources [
                "bzl_darwin"
                "bzl_linux"
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
        };
    };
}
