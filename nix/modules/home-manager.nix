{ config, lib, ... }:
let
  inherit (lib)
    mkIf
    optionalAttrs
    ;
  cfg = config.ms0503.neovim;
  common = import ./common.nix;
in
{
  config = mkIf cfg.enable {
    home = {
      packages = [
        (cfg.package.override {
          inherit (cfg) viAlias vimAlias;
        })
      ];
      sessionVariables = optionalAttrs cfg.defaultEditor {
        EDITOR = "nvim";
      };
    };
  };
  options.ms0503.neovim = common.mkOption {
    inherit lib;
  };
}
