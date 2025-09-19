{
  source,
  vimPlugins,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (source) pname src version;
  buildInputs = with vimPlugins; [
    nvim-treesitter
  ];
  buildPhase = ''
    runHook preBuild
    pushd lua/fzy
    make
    popd
    runHook postBuild
  '';
  patches = [
    ./fix-fzy-lua-native.patch
  ];
}
