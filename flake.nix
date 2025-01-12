{
  inputs = {
    build-gradle-application = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:raphiz/buildGradleApplication";
    };
    fenix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/fenix";
    };
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
    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };
  };
  outputs =
    {
      build-gradle-application,
      fenix,
      git-hooks,
      neovim-nightly-overlay,
      nixpkgs,
      self,
      treefmt-nix,
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
      checks = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
        in
        {
          formatting = treefmtEval.config.build.check self;
          pre-commit-check = git-hooks.lib.${system}.run {
            hooks = {
              actionlint.enable = true;
              nixfmt-rfc-style.enable = true;
              stylua.enable = true;
            };
            src = ./.;
          };
        }
      );
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
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
        {
          default = pkgs.mkShell {
            inherit (self.checks.${system}.pre-commit-check) shellHook;
            packages =
              scripts
              ++ (with pkgs; [
                lua-language-server
                node2nix
                nvfetcher
                stylua
              ]);
          };
        }
      );
      formatter = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          treefmtEval = treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
        in
        treefmtEval.config.build.wrapper
      );
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
              build-gradle-application.overlays.default
              fenix.overlays.default
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
