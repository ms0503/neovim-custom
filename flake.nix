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
      git-hooks,
      nixpkgs,
      self,
      systems,
      treefmt-nix,
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
                ./modules/home-manager.nix
              ];
              ms0503.neovim.package = config.packages.default;
            }
          );
          nixosModules.default = moduleWithSystem (
            { config, ... }:
            _: {
              imports = [
                ./modules/nixos.nix
              ];
              ms0503.neovim.package = config.packages.default;
            }
          );
          overlays = import ./overlays.nix;
        };
        imports = [
          git-hooks.flakeModule
          treefmt-nix.flakeModule
        ];
        perSystem =
          {
            config,
            inputs',
            system,
            ...
          }:
          let
            pkgs = import nixpkgs {
              inherit system;
              overlays = [
                fenix.overlays.default
                self.overlays.default
              ];
            };
          in
          {
            _module.args.pkgs = pkgs;
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
            packages =
              let
                makeNeovimWrapper = import ./wrapper.nix neovim-nightly pkgs;
                neovim-nightly = inputs'.neovim-nightly-overlay.packages.default;
                neovimConfig = pkgs.callPackage ./config.nix {
                  inherit plugins;
                };
                plugins = import ./plugins.nix pkgs;
                tools = import ./tools.nix pkgs;
              in
              {
                config = neovimConfig;
                default = pkgs.callPackage (makeNeovimWrapper tools) {
                  viAlias = false;
                  vimAlias = false;
                };
              };
            pre-commit = {
              check.enable = true;
              settings = {
                hooks = {
                  actionlint.enable = true;
                  check-json.enable = true;
                  check-toml.enable = true;
                  editorconfig-checker = {
                    enable = true;
                    excludes = [
                      "Cargo.lock"
                      "_sources"
                      "flake.lock"
                    ];
                  };
                  markdownlint.enable = true;
                  yamlfmt.enable = true;
                  yamllint.enable = true;
                };
                src = ./.;
              };
            };
            treefmt = import ./treefmt.nix;
          };
        systems = import systems;
      }
    );
}
