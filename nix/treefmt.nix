{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];
  perSystem = _: {
    treefmt = {
      programs = {
        nixfmt.enable = true;
        shellcheck.enable = true;
        shfmt = {
          enable = true;
          indent_size = 4;
        };
        stylua.enable = true;
        taplo.enable = true;
      };
      settings.formatter = {
        nixfmt.excludes = [
          "_sources/generated.nix"
          "nix/pkgs/nodePackages/cmp.nix"
          "nix/pkgs/nodePackages/node-env.nix"
          "nix/pkgs/nodePackages/pkgs.nix"
        ];
        shellcheck.excludes = [
          ".envrc"
        ];
      };
    };
  };
}
