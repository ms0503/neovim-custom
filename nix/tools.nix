pkgs: myPkgs: inputs':
let
  fenixPkgs = inputs'.fenix.packages;
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
    cmake-language-server
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
    nginx-language-server
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
  ++ (with nodePackages; [
    "@astrojs/language-server"
    "@tailwindcss/language-server"
    bash-language-server
    dockerfile-language-server-nodejs
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
