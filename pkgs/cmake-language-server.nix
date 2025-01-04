{
  cmake,
  cmake-format,
  python3Packages,
  source,
  stdenv,
}:
stdenv.mkDerivation (finalAttrs: {
  inherit (source) pname src version;
  buildInputs =
    [
      cmake
      cmake-format
    ]
    ++ (with python3Packages; [
      pdm-backend
      pygls
      pyparsing
    ]);
  buildPhase = ''
    runHook preBuild
    PDM_BUILD_SCM_VERSION="${finalAttrs.version}" python -m build --wheel --no-isolation
    runHook postBuild
  '';
  installPhase = ''
    runHook preInstall
    install -dm755 "$out"
    python -m installer --destdir="$out" dist/*.whl
    mv "$out/usr/"* "$out"
    rmdir "$out/usr"
    install -Dm444 LICENSE "$out/share/licenses/${finalAttrs.pname}/LICENSE"
    runHook postInstall
  '';
  nativeBuildInputs = with python3Packages; [
    bootstrap.build
    bootstrap.installer
    pdm-pep517
  ];
})
