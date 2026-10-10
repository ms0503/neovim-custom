{
  imports = [
    ./treefmt.nix
    ./git-hooks.nix
  ];
  perSystem =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      devShells.shell = pkgs.mkShell {
        packages =
          config.pre-commit.settings.enabledPackages
          ++ lib.attrValues config.treefmt.build.programs
          ++ (with pkgs; [
            lua-language-server
            nvfetcher
            stylua
          ]);
        shellHook = ''
          ${config.pre-commit.shellHook}
        '';
      };
    };
}
