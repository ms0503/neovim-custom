{
  inputs = {
    awk-language-server = {
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:ms0503/awk-language-server";
    };
    fenix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/fenix";
    };
    flake-compat = {
      flake = false;
      url = "github:NixOS/flake-compat";
    };
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = "github:hercules-ci/flake-parts";
    };
    git-hooks = {
      inputs = {
        flake-compat.follows = "";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:cachix/git-hooks.nix";
    };
    neovim-nightly-overlay = {
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:nix-community/neovim-nightly-overlay";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems = {
      flake = false;
      url = "github:nix-systems/default";
    };
    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };
    vscode-css-variables = {
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:ms0503/vscode-css-variables";
    };
  };
  nixConfig = {
    experimental-features = [
      "flakes"
      "nix-command"
      "pipe-operators"
    ];
    substituters = [
      "https://cache.nixos.org"
      "https://ms0503.cachix.org"
      "https://nix-community.cachix.org"
      "https://nixpkgs-unfree.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "ms0503.cachix.org-1:Cc2mXpepZr7O9aFcRj5jq3mIcvdUPp85sLFuQj+IKbM="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
    ];
  };
  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      systems,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { moduleWithSystem, ... }:
      {
        flake = {
          homeManagerModules.default = moduleWithSystem (
            { config, ... }:
            _: {
              imports = [
                ./nix/modules/home-manager.nix
              ];
              ms0503.neovim.package = config.packages.default;
            }
          );
          nixosModules.default = moduleWithSystem (
            { config, ... }:
            _: {
              imports = [
                ./nix/modules/nixos.nix
              ];
              ms0503.neovim.package = config.packages.default;
            }
          );
        };
        imports = [
          ./nix/treefmt.nix
          ./nix/git-hooks.nix
          ./nix/pkgs
          ./nix/neovim.nix
        ];
        perSystem =
          {
            config,
            lib,
            pkgs,
            system,
            ...
          }:
          {
            _module.args.pkgs = import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
            devShells.shell = pkgs.mkShell {
              packages =
                config.pre-commit.settings.enabledPackages
                ++ lib.attrValues config.treefmt.build.programs
                ++ (with pkgs; [
                  lua-language-server
                  nvfetcher
                  stylua
                ]);
              shellHook = ''
                ${config.pre-commit.shellHook}
              '';
            };
          };
        systems = import systems;
      }
    );
}
