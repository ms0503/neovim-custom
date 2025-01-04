{
  sources,
  stdenvNoCC,
  system,
}:
stdenvNoCC.mkDerivation {
  inherit (sources.${system}) src version;
  installPhase = ''
    runHook preInstall
    install -Dm555 "$src" "$out/bin/bzl"
    runHook postInstall
  '';
  meta.platforms = [
    "x86_64-darwin"
    "x86_64-linux"
  ];
  pname = "bzl";
}
