{
  buildRubyGem,
  defaultGemConfig,
  lib,
  ruby,
  ...
}:
let
  buildGems =
    gemset:
    let
      builtGems = lib.mapAttrs (
        gemName: initialAttrs:
        let
          attrs = functions.applyGemConfigs (
            {
              inherit gemName ruby;
            }
            // initialAttrs
          );
        in
        buildRubyGem (functions.composeGemAttrs ruby builtGems gemName attrs)
      ) realGemset;
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
      (builtins.removeAttrs attrs [ "platforms" ])
      // {
        inherit gemName ruby;
        inherit (attrs.source) type;
        gemPath = builtins.map (name: gems.${name}) (attrs.dependencies or [ ]);
        source = builtins.removeAttrs attrs.source [ "type" ];
      };
  };
  gems = buildGems {
    msgpack = {
      dependencies = [ ];
      groups = [ "default" ];
      platforms = [ ];
      source = {
        remotes = [ "https://rubygems.org" ];
        sha256 = "/7BJefUeZAaCPAOr5Q4dosglxVo33uE4UYzdCdnTrqg=";
        type = "gem";
      };
      version = "1.7.5";
    };
    multi_json = {
      dependencies = [ ];
      groups = [ "default" ];
      platforms = [ ];
      source = {
        remotes = [ "https://rubygems.org" ];
        sha256 = "H9BBOLbkqQAX6NG4BMA5AxOZhm/z+6u3girqNnx4YV0=";
        type = "gem";
      };
      version = "1.15.0";
    };
    neovim = {
      dependencies = [
        "msgpack"
        "multi_json"
      ];
      groups = [ "default" ];
      platforms = [ ];
      source = {
        remotes = [ "https://rubygems.org" ];
        sha256 = "jWFwJ5hyIBEG3hqEwnzEClcewlhAV6PDNbJyHnMmgz4=";
        type = "gem";
      };
      version = "0.10.0";
    };
  };
in
{
  inherit (gems) neovim;
}
