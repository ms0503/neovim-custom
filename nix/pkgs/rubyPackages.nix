{
  buildRubyGem,
  defaultGemConfig,
  lib,
  ruby,
}:
let
  buildGems =
    gemset:
    let
      builtGems =
        realGemset
        |> lib.mapAttrs (
          gemName: initialAttrs:
          let
            attrs = functions.applyGemConfigs (
              {
                inherit gemName ruby;
              }
              // initialAttrs
            );
          in
          functions.composeGemAttrs ruby builtGems gemName attrs |> buildRubyGem
        );
      realGemset = if builtins.isAttrs gemset then gemset else import gemset;
    in
    builtGems;
  functions = {
    applyGemConfigs =
      attrs:
      if defaultGemConfig ? ${attrs.gemName} then
        attrs // defaultGemConfig.${attrs.gemName} attrs
      else
        attrs;
    composeGemAttrs =
      ruby: gems: gemName: attrs:
      (builtins.removeAttrs attrs [
        "platforms"
      ])
      // {
        inherit gemName ruby;
        inherit (attrs.source) type;
        gemPath = (attrs.dependencies or [ ]) |> builtins.map (name: gems.${name});
        source = builtins.removeAttrs attrs.source [
          "type"
        ];
      };
  };
  gems = buildGems {
    msgpack = {
      dependencies = [ ];
      groups = [
        "default"
      ];
      platforms = [ ];
      source = {
        remotes = [
          "https://rubygems.org"
        ];
        sha256 = "5kzgISAA0BaAn1BItI6zpl/7Fp2yIjj7S3JHL+yy1zI=";
        type = "gem";
      };
      version = "1.8.0";
    };
    multi_json = {
      dependencies = [ ];
      groups = [
        "default"
      ];
      platforms = [ ];
      source = {
        remotes = [
          "https://rubygems.org"
        ];
        sha256 = "5hJqMYCOO00Z9IPHdc6sNN8ZDf+mKt+2OhZe4UumgIA=";
        type = "gem";
      };
      version = "1.21.1";
    };
    neovim = {
      dependencies = [
        "msgpack"
        "multi_json"
      ];
      groups = [
        "default"
      ];
      platforms = [ ];
      source = {
        remotes = [
          "https://rubygems.org"
        ];
        sha256 = "jWFwJ5hyIBEG3hqEwnzEClcewlhAV6PDNbJyHnMmgz4=";
        type = "gem";
      };
      version = "0.10.0";
    };
  };
in
{
  neovim-ruby = gems.neovim;
}
