{
  sources,
  vimUtils,
}:
builtins.mapAttrs (
  k: v:
  vimUtils.buildVimPlugin {
    inherit (v) pname src version;
  }
) sources
