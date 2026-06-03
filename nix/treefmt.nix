{ inputs, ... }:
{
  imports = [
    (inputs.treefmt-nix.flakeModule or { })
  ];
  perSystem =
    { lib, ... }:
    lib.optionalAttrs (inputs.treefmt-nix ? flakeModule) {
      treefmt.programs = {
        nixfmt = {
          enable = true;
          excludes = [
            "_sources/generated.nix"
          ];
        };
        shellcheck = {
          enable = true;
          excludes = [
            ".envrc"
          ];
        };
        shfmt = {
          enable = true;
          indent_size = 4;
        };
        stylua.enable = true;
        taplo.enable = true;
      };
    };
}
