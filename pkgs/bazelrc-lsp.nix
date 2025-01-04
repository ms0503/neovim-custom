{
  protobuf,
  rustPlatform,
  source,
}:
rustPlatform.buildRustPackage {
  inherit (source) pname src version;
  cargoHash = "sha256-TDBirsrLo+OL7yUy+zeWaMYHrzkUvOXG6QRUzn1vh28=";
  nativeBuildInputs = [
    protobuf
  ];
}
