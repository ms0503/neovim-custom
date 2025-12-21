{
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
                import ../../_sources/generated.nix {
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
          nodePackages = import ./nodePackages pkgs;
          rubyPackages = import ./rubyPackages.nix pkgs;
          vimPlugins =
            (import ./vimPlugins {
              inherit (pkgs) vimUtils;
              sources = builtins.removeAttrs sources [
                "guihua-lua"
              ];
            })
            // {
              guihua-lua = (
                pkgs.callPackage ./vimPlugins/guihua-lua {
                  inherit (pkgs) vimUtils;
                  source = sources.guihua-lua;
                }
              );
            };
        };
    };
}
