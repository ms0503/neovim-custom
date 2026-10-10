{
  lib,
  plugins,
  sqlite,
  stdenvNoCC,
  vimPlugins,
}:
let
  envVars = plugins // {
    treesitter_parsers =
      vimPlugins.nvim-treesitter-parsers
      |> lib.filterAttrs (key: _: !(lib.hasPrefix "override" key))
      |> builtins.attrValues
      |> builtins.map builtins.toString
      |> builtins.concatStringsSep ",";
  };
  name = "neovim-custom-config";
  preprocessed = stdenvNoCC.mkDerivation (
    envVars
    // {
      inherit name;
      installPhase = ''
        install -dm755 "$out"
        for f in $(find . -type f); do
          substituteAllInPlace "$f"
        done
        cp -r ./ "$out"
      '';
      sqlite_library_path = "${sqlite.out}/lib/libsqlite3.so";
      src = ../nvim;
    }
  );
in
stdenvNoCC.mkDerivation {
  inherit name;
  installPhase = ''
    install -dm755 "$out"
    substituteAll ./init.lua "$out/init.lua"
    ln -s "$src/lua" "$out/lua"
  '';
  neovim_custom_config_path = preprocessed;
  src = preprocessed;
}
