{
  default =
    final: prev:
    let
      myPkgs = import ./pkgs {
        pkgs = prev;
      };
    in
    myPkgs
    // {
      nodePackages = prev.nodePackages // myPkgs.nodePackages;
      rubyPackages = prev.rubyPackages // myPkgs.rubyPackages;
      vimPlugins = prev.vimPlugins // myPkgs.vimPlugins;
    };
}
