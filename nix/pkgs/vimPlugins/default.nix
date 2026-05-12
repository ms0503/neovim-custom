{
  sources,
  vimUtils,
}:
builtins.mapAttrs (
  _: v:
  vimUtils.buildVimPlugin {
    inherit (v) pname src version;
  }
) sources
