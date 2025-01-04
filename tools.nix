pkgs:
(with pkgs; [
  arduino-language-server
  astro-language-server
  autotools-language-server
  bazelrc-lsp
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
  rust-analyzer-nightly
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
])
++ (with pkgs.haskellPackages; [
  fourmolu
])
++ (with pkgs.nodePackages; [
  "@astrojs/language-server"
  "@tailwindcss/language-server"
  awk-language-server
  bash-language-server
  css-variables-language-server
  dockerfile-language-server-nodejs
  graphql-language-service-cli
  neovim
  prettier
  typescript-language-server
  vscode-langservers-extracted
])
++ (with pkgs.ocamlPackages; [
  ocaml-lsp
])
++ (with pkgs.perlPackages; [
  NeovimExt
])
++ (with pkgs.python3Packages; [
  debugpy
  pynvim
])
++ (with pkgs.rubyPackages; [
  neovim
])
++ pkgs.optional (pkgs.system == "x86_64-darwin" || pkgs.system == "x86_64-linux") pkgs.bzl
# vim: et sts=2 sw=2 ts=2
