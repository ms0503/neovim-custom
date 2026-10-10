{
  sources,
  vimUtils,
}:
sources
|> builtins.mapAttrs (
  _: v:
  vimUtils.buildVimPlugin {
    inherit (v) pname src version;
  }
)
