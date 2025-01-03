pkgs:
(with pkgs; [
  biome
  buf
  clang-tools
  delve
  deno
  eslint
  gopls
  haskell-language-server
  lazygit
  lua-language-server
  nil
  nixfmt-rfc-style
  ocamlformat
  pyright
  ripgrep
  ruff
  shellcheck
  shfmt
  sqlite
  stylua
  taplo
  tinymist
  typstyle
  zls
])
++ (with pkgs.haskellPackages; [
  fourmolu
])
++ (with pkgs.nodePackages; [
  "@astrojs/language-server"
  "@tailwindcss/language-server"
  bash-language-server
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
# vim: et sts=2 sw=2 ts=2
