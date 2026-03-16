{
  perSystem =
    { pkgs, ... }:
    {
      legacyPackages =
        let
          inherit (pkgs) callPackage;
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
          awk-language-server = callPackage ./awk-language-server {
            source = sources.awk-language-server;
            yarnDepsHash = "sha256-pp54hyYkcyhv+mwzyHwscjB4Ktz2IM+8ZPn2EgOPKQM=";
          };
          css-variables-language-server = callPackage ./css-variables-language-server {
            npmDepsHash = "sha256-VMUGlQMnHhAtuWd/hdGn2jJN1z7bkNCRVRFF5EjNaFY=";
            source = sources.css-variables-language-server;
          };
          rubyPackages = import ./rubyPackages.nix pkgs;
          vimPlugins =
            (import ./vimPlugins {
              inherit (pkgs) vimUtils;
              sources = builtins.removeAttrs sources [
                "awk-language-server"
                "css-variables-language-server"
                "guihua-lua"
              ];
            })
            // {
              guihua-lua = (
                callPackage ./vimPlugins/guihua-lua {
                  inherit (pkgs) vimUtils;
                  source = sources.guihua-lua;
                }
              );
              jsregexp = pkgs.stdenvNoCC.mkDerivation {
                inherit (pkgs.luajitPackages.jsregexp) pname version;
                installPhase = ''
                  runHook preInstall
                  install -dm755 "$out/lua/jsregexp"
                  ln -s "$src/share/lua/5.1/jsregexp.lua" "$out/lua/jsregexp.lua"
                  ln -s "$src/lib/lua/5.1/jsregexp/core.so" "$out/lua/jsregexp/core.so"
                  runHook postInstall
                '';
                src = pkgs.luajitPackages.jsregexp;
              };
            };
        };
    };
}
