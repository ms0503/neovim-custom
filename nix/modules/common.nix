{
  mkOption =
    { lib, ... }:
    let
      inherit (lib) mkEnableOption mkOption types;
    in
    {
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
