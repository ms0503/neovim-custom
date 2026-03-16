pkgs: myPkgs: inputs':
let
  fenixPkgs = inputs'.fenix.packages;
in
(
  with pkgs;
  [
    arduino-language-server
    astro-language-server
    autotools-language-server
    bash-language-server
    biome
    buf
    clang-tools
    cmake-language-server
    delve
    deno
    docker-compose-language-service
    dockerfile-language-server
    eslint
    gopls
    haskell-language-server
    java-language-server
    kotlin-language-server
    lazygit
    lua-language-server
    marksman
    mesonlsp
    neovim-node-client
    nginx-language-server
    nil
    nixfmt
    nushell
    ocamlformat
    omnisharp-roslyn
    oxlint
    phpactor
    prettier
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
    typescript-language-server
    typstyle
    vscode-langservers-extracted
    vue-language-server
    yaml-language-server
    zls
  ]
  ++ (with haskellPackages; [
    fourmolu
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
  [
    awk-language-server
    css-variables-language-server
  ]
  ++ (with rubyPackages; [
    neovim
  ])
)
++ (with fenixPkgs; [
  rust-analyzer
])
