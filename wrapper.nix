neovim: pkgs@{ callPackage, lib, ... }: extraPackages:
let
  nvimConfig = callPackage ./config.nix {
    inherit plugins;
  };
  plugins = import ./plugins.nix pkgs;
in
pkgs.writeScriptBin "nvim" ''
  PATH=$PATH:${lib.makeBinPath extraPackages}
  MY_CONFIG_PATH=${nvimConfig} ${neovim}/bin/nvim -u ${nvimConfig}/init.lua "$@"
''
# vim: et sts=2 sw=2 ts=2
