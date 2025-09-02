{ config, lib, ... }:
let
  inherit (lib)
    mkEnableOption
    mkIf
    mkOption
    optionalAttrs
    types
    ;
  cfg = config.ms0503.neovim;
in
{
  config = mkIf cfg.enable {
    environment = {
      systemPackages = [
        (cfg.package.override {
          inherit (cfg) viAlias vimAlias;
        })
      ];
      variables = optionalAttrs cfg.defaultEditor {
        EDITOR = "nvim";
      };
    };
  };
  options.ms0503.neovim = {
    defaultEditor = mkOption {
      default = false;
      description = "When enabled, installs neovim and configures neovim to be the default editor using the EDITOR environment variable.";
      type = types.bool;
    };
    enable = mkEnableOption "customized neovim";
    package = mkOption {
      description = "The customized neovim package to use.";
      type = types.package;
    };
    viAlias = mkOption {
      default = false;
      description = "Symlink {command}`vi` to {command}`nvim` binary.";
      type = types.bool;
    };
    vimAlias = mkOption {
      default = false;
      description = "Symlink {command}`vim` to {command}`nvim` binary.";
      type = types.bool;
    };
  };
}
