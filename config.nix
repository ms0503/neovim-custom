{
  lib,
  plugins,
  sqlite,
  stdenvNoCC,
  vimPlugins,
}:
let
  envVars = plugins // {
    treesitter_parsers = lib.pipe (builtins.attrValues vimPlugins.nvim-treesitter-parsers) [
      (builtins.map builtins.toString)
      (builtins.concatStringsSep ",")
    ];
  };
  pname = "neovim-custom-config";
  preprocessed = stdenvNoCC.mkDerivation (
    envVars
    // {
      inherit pname version;
      installPhase = ''
        install -dm755 "$out"
        for f in $(find . -type f); do
          substituteAllInPlace "$f"
        done
        cp -r ./ "$out"
      '';
      sqlite_library_path = "${sqlite.out}/lib/libsqlite3.so";
      src = ./config;
    }
  );
  version = "2025-05-12";
in
stdenvNoCC.mkDerivation {
  inherit pname version;
  installPhase = ''
    install -dm755 "$out"
    substituteAllInPlace ./init.lua
    cp -r ./ "$out"
  '';
  neovim_custom_config_path = preprocessed;
  src = preprocessed;
}
