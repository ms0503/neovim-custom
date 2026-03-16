{
  buildNpmPackage,
  glib,
  lib,
  libsecret,
  nodejs_latest,
  npmDepsHash,
  pkg-config,
  source,
}:
buildNpmPackage {
  inherit npmDepsHash;
  inherit (source) pname src version;
  PKG_CONFIG_PATH = lib.makeSearchPathOutput "dev" "lib/pkgconfig" [
    glib
    libsecret
  ];
  nativeBuildInputs = [
    pkg-config
  ];
  nodejs = nodejs_latest;
  npmPackFlags = [
    "--ignore-scripts"
  ];
  postPatch = ''
    cp ${./package-lock.json} package-lock.json
  '';
  postUnpack = ''
    rm -r vscode-css-variables-css-variables-language-server-${source.version}/{package{,-lock}.json,packages/vscode-css-variables}
  '';
  sourceRoot = "vscode-css-variables-css-variables-language-server-${source.version}/packages/css-variables-language-server";
}
