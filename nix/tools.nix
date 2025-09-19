pkgs: myPkgs: inputs':
let
  fenixPkgs = inputs'.fenix.packages;
in
let
  # https://github.com/nixos/nixpkgs/issues/437024
  cmake-language-server' = pkgs.cmake-language-server.override (prev: {
    python3Packages = prev.python3Packages // {
      pygls = pygls';
    };
  });
  lsprotocol' = pkgs.python3Packages.lsprotocol.overridePythonAttrs {
    src = pkgs.fetchFromGitHub {
      hash = "sha256-PHjLKazMaT6W4Lve1xNxm6hEwqE3Lr2m5L7Q03fqb68=";
      owner = "microsoft";
      repo = "lsprotocol";
      tag = "2023.0.1";
    };
    version = "2023.0.1";
  };
  nginx-language-server' = pkgs.nginx-language-server.override {
    python3Packages = pkgs.python3Packages // {
      lsprotocol = lsprotocol';
      pygls = pygls';
    };
  };
  pygls' = pkgs.python3Packages.pygls.override {
    lsprotocol = lsprotocol';
  };
in
(
  with pkgs;
  [
    arduino-language-server
    astro-language-server
    # autotools-language-server # https://github.com/NixOS/nixpkgs/issues/425798
    biome
    buf
    clang-tools
    cmake-language-server'
    delve
    deno
    docker-compose-language-service
    eslint
    gopls
    haskell-language-server
    java-language-server
    kotlin-language-server
    lazygit
    lua-language-server
    marksman
    mesonlsp
    nginx-language-server'
    nil
    nixfmt-rfc-style
    nushell
    ocamlformat
    omnisharp-roslyn
    phpactor
    pyright
    ripgrep
    ruff
    shellcheck
    shfmt
    sqlite
    stylelint-lsp
    stylua
    tailwindcss-language-server
    taplo
    terraform-ls
    tinymist
    typstyle
    vue-language-server
    yaml-language-server
    zls
  ]
  ++ (with haskellPackages; [
    fourmolu
  ])
  ++ (with nodePackages_latest; [
    "@astrojs/language-server"
    "@tailwindcss/language-server"
    bash-language-server
    dockerfile-language-server
    neovim
    prettier
    typescript-language-server
    vscode-langservers-extracted
  ])
  ++ (with ocamlPackages; [
    ocaml-lsp
  ])
  ++ (with perlPackages; [
    NeovimExt
  ])
  ++ (with python3Packages; [
    debugpy
    pynvim
  ])
)
++ (
  with myPkgs;
  (with nodePackages; [
    awk-language-server
    css-variables-language-server
  ])
  ++ (with rubyPackages; [
    neovim
  ])
  ++ pkgs.lib.optional (pkgs.system == "x86_64-darwin" || pkgs.system == "x86_64-linux") bzl
)
++ (with fenixPkgs; [
  rust-analyzer
])
