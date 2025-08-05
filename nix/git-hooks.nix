{ inputs, ... }:
{
  imports = [
    inputs.git-hooks.flakeModule
  ];
  perSystem =
    { config, ... }:
    {
      pre-commit = {
        check.enable = true;
        settings = {
          hooks = {
            actionlint.enable = true;
            check-json.enable = true;
            check-toml.enable = true;
            editorconfig-checker = {
              enable = true;
              excludes = [
                "Cargo.lock"
                "_sources"
                "flake.lock"
              ];
            };
            markdownlint.enable = true;
            treefmt = {
              enable = true;
              package = config.treefmt.build.wrapper;
            };
            yamlfmt.enable = true;
            yamllint.enable = true;
          };
          src = ../.;
        };
      };
    };
}
