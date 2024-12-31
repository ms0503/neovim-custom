{
  source,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (source) pname src version;
  buildPhase = ''
    runHook preBuild
    cd lua/fzy
    make
    cd ../..
    runHook postBuild
  '';
  patches = [
    ./fix-fzy-lua-native.patch
  ];
}
# vim: et sts=2 sw=2 ts=2
