{
  sources,
  vimUtils,
}:
builtins.mapAttrs (
  k: v:
  vimUtils.buildVimPlugin {
    inherit (v) pname src version;
    dontBuild = true;
  }
) sources
# vim: et sts=2 sw=2 ts=2
