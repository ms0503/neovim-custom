{
  perSystem =
    {
      inputs',
      lib,
      pkgs,
      self',
      ...
    }:
    {
      packages =
        let
          makeNeovimWrapper =
            extraPackages:
            import ./wrapper.nix {
              inherit
                extraPackages
                neovim
                pkgs
                plugins
                ;
            };
          myPkgs = self'.packages;
          neovim = inputs'.neovim-nightly-overlay.packages.default;
          neovimConfig = pkgs.callPackage ./config.nix {
            inherit plugins;
          };
          plugins = import ./plugins.nix {
            inherit lib myPkgs pkgs;
          };
          tools = import ./tools.nix {
            inherit inputs' myPkgs pkgs;
          };
        in
        {
          config = neovimConfig;
          default = pkgs.callPackage (makeNeovimWrapper tools) { };
        };
    };
}
