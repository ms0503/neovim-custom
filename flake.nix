{
  inputs = {
    fenix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/fenix";
    };
    flake-compat = {
      flake = false;
      url = "github:edolstra/flake-compat";
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
        flake-compat.follows = "";
        flake-parts.follows = "flake-parts";
        git-hooks.follows = "";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "";
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
  };
  outputs =
    inputs@{
      fenix,
      flake-parts,
      nixpkgs,
      self,
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
          { config, pkgs, ... }:
          {
            devShells.default =
              let
                scripts = with pkgs; [
                  (writeScriptBin "update-srcs" ''
                    if [[ ! -f $PWD/flake.nix ]]; then
                      printf "Please run in flake root\n"
                      exit 1
                    fi
                    ${pkgs.nvfetcher}/bin/nvfetcher
                    ${pkgs.node2nix}/bin/node2nix \
                      -i pkgs/nodePackages/pkg-list.json \
                      -o pkgs/nodePackages/pkgs.nix \
                      -c pkgs/nodePackages/cmp.nix \
                      -e pkgs/nodePackages/node-env.nix \
                      --pkg-name nodejs
                  '')
                ];
              in
              pkgs.mkShell {
                packages =
                  scripts
                  ++ (with pkgs; [
                    lua-language-server
                    node2nix
                    nvfetcher
                    stylua
                  ]);
                shellHook = ''
                  ${config.pre-commit.installationScript}
                '';
              };
          };
        systems = import systems;
      }
    );
}
