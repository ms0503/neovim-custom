{
  inputs = {
    flake-compat.url = "github:edolstra/flake-compat";
    git-hooks = {
      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
        nixpkgs-stable.follows = "nixpkgs-stable";
      };
      url = "github:cachix/git-hooks.nix";
    };
    neovim-nightly-overlay = {
      inputs = {
        flake-compat.follows = "flake-compat";
        git-hooks.follows = "git-hooks";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:nix-community/neovim-nightly-overlay";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/release-24.11";
  };
  outputs =
    inputs@{
      git-hooks,
      neovim-nightly-overlay,
      nixpkgs,
      self,
      ...
    }:
    let
      allSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs allSystems;
    in
    {
      checks = forAllSystems (system: {
        pre-commit-check = git-hooks.lib.${system}.run {
          hooks = {
            actionlint.enable = true;
            nixfmt-rfc-style.enable = true;
            stylua.enable = true;
          };
          src = ./.;
        };
      });
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          default = pkgs.mkShell {
            inherit (self.checks.${system}.pre-commit-check) shellHook;
            packages = with pkgs; [
              lua-language-server
              nvfetcher
              stylua
            ];
          };
        }
      );
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
      overlays = import ./overlays.nix;
      packages = forAllSystems (
        system:
        let
          makeNeovimWrapper = import ./wrapper.nix neovim-nightly pkgs;
          neovim-nightly = neovim-nightly-overlay.packages.${system}.default;
          neovimConfig = pkgs.callPackage ./config.nix {
            inherit plugins;
          };
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              self.overlays.default
            ];
          };
          plugins = import ./plugins.nix pkgs;
          tools = import ./tools.nix pkgs;
        in
        {
          config = neovimConfig;
          default = makeNeovimWrapper tools;
        }
      );
    };
}
# vim: et sts=2 sw=2 ts=2
