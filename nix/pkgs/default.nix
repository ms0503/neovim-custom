{
  perSystem =
    {
      inputs',
      lib,
      pkgs,
      ...
    }:
    {
      packages =
        let
          inherit (pkgs) callPackage;
          rubyPackages = callPackage ./rubyPackages.nix { };
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
          vimPlugins =
            (import ./vimPlugins {
              inherit (pkgs) vimUtils;
              sources = builtins.removeAttrs sources [
                "guihua-lua"
              ];
            })
            // {
              guihua-lua = callPackage ./vimPlugins/guihua-lua {
                inherit (pkgs) vimUtils;
                source = sources.guihua-lua;
              };
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
        in
        rubyPackages
        // vimPlugins
        // {
          awk-language-server = inputs'.awk-language-server.packages.default;
          css-variables-language-server = inputs'.vscode-css-variables.packages.default;
        };
    };
}
