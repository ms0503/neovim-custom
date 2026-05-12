{
  perSystem =
    {
      inputs',
      pkgs,
      self',
      ...
    }:
    {
      packages =
        let
          makeNeovimWrapper = import ./wrapper.nix neovim-nightly pkgs plugins;
          neovim-nightly = inputs'.neovim-nightly-overlay.packages.default;
          neovimConfig = pkgs.callPackage ./config.nix {
            inherit plugins;
          };
          plugins = import ./plugins.nix pkgs self'.packages;
          tools = import ./tools.nix pkgs self'.packages inputs';
        in
        {
          config = neovimConfig;
          default = pkgs.callPackage (makeNeovimWrapper tools) {
            viAlias = false;
            vimAlias = false;
          };
        };
    };
}
