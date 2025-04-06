neovim:
pkgs@{
  callPackage,
  lib,
  stdenvNoCC,
  ...
}:
plugins: extraPackages:
let
  nvimConfig = callPackage ./config.nix {
    inherit plugins;
  };
  wrapper = pkgs.writeScriptBin "nvim" ''
    #!/usr/bin/env sh
    PATH=$PATH:${lib.makeBinPath extraPackages}
    MY_CONFIG_PATH=${nvimConfig} ${neovim}/bin/nvim -u ${nvimConfig}/init.lua "$@"
  '';
in
{ viAlias, vimAlias }:
stdenvNoCC.mkDerivation {
  inherit (neovim) version;
  meta = neovim.meta // {
    mainProgram = "nvim";
  };
  pname = "${neovim.pname}-wrapped";
  installPhase =
    ''
      runHook preInstall
      install -dm755 "$out/bin"
      ln -s "$src/bin/nvim" "$out/bin/nvim"
    ''
    + (
      if viAlias then
        ''
          ln -s "$src/bin/nvim" "$out/bin/vi"
        ''
      else
        ""
    )
    + (
      if vimAlias then
        ''
          ln -s "$src/bin/nvim" "$out/bin/vim"
        ''
      else
        ""
    )
    + ''
      runHook postInstall
    '';
  src = wrapper;
}
