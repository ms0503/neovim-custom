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
            "nix/pkgs/nodePackages/cmp.nix"
            "nix/pkgs/nodePackages/node-env.nix"
            "nix/pkgs/nodePackages/pkgs.nix"
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
