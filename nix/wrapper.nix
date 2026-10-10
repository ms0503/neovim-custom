{
  extraPackages,
  neovim,
  pkgs,
  plugins,
}:
let
  inherit (pkgs) callPackage lib stdenvNoCC;
  nvimConfig = callPackage ./config.nix {
    inherit plugins;
  };
  wrapper = pkgs.writeScriptBin "nvim" ''
    #!/usr/bin/env sh
    PATH=$PATH:${lib.makeBinPath extraPackages}
    MY_CONFIG_PATH=${nvimConfig} ${neovim}/bin/nvim -u ${nvimConfig}/init.lua "$@"
  '';
in
{
  viAlias ? false,
  vimAlias ? false,
}:
stdenvNoCC.mkDerivation {
  inherit (neovim) version;
  installPhase = ''
    runHook preInstall
    install -dm755 "$out/bin"
    ln -s "$src/bin/nvim" "$out/bin/nvim"
    ${if viAlias then ''ln -s "$src/bin/nvim" "$out/bin/vi"'' else ""}
    ${if vimAlias then ''ln -s "$src/bin/nvim" "$out/bin/vim"'' else ""}
    runHook postInstall
  '';
  meta = neovim.meta // {
    mainProgram = "nvim";
  };
  pname = "${neovim.pname}-wrapped";
  src = wrapper;
}
