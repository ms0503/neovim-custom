pkgs@{ lib, vimPlugins, ... }:
let
  normalizePname =
    pname:
    builtins.replaceStrings
      [
        "-"
        "."
      ]
      [
        "_"
        "_"
      ]
      (lib.toLower pname);
  pkgListToAttr =
    pkgList:
    lib.foldl' (
      acc: pkg:
      acc
      // {
        "${normalizePname pkg.pname}" = pkg;
      }
    ) { } pkgList;
  plugins = with vimPlugins; [
    aerial-nvim
    better-escape-nvim
    cmp-buffer
    cmp-cmdline
    cmp-git
    cmp-nvim-lsp
    cmp-path
    cmp-vsnip
    cmp_luasnip
    comment-nvim
    conform-nvim
    crates-nvim
    dial-nvim
    diffview-nvim
    dressing-nvim
    fidget-nvim
    fzf-lua
    gitlinker-nvim
    gitsigns-nvim
    go-nvim
    guihua-lua
    heirline-nvim
    hlchunk-nvim
    hmts-nvim
    lazy-nvim
    lazydev-nvim
    lspkind-nvim
    lspsaga-nvim
    luasnip
    mini-bufremove
    mini-icons
    neo-tree-nvim
    neoconf-nvim
    noice-nvim
    nui-nvim
    nvim-autopairs
    nvim-bqf
    nvim-cmp
    nvim-dap
    nvim-dap-go
    nvim-dap-python
    nvim-dap-ui
    nvim-dap-virtual-text
    nvim-highlight-colors
    nvim-hlslens
    nvim-lspconfig
    nvim-nio
    nvim-notify
    nvim-scrollbar
    nvim-treesitter
    nvim-ts-autotag
    nvim-ts-context-commentstring
    nvim-web-devicons
    overseer-nvim
    plenary-nvim
    project-nvim
    render-markdown-nvim
    rustaceanvim
    schemastore-nvim
    smart-splits-nvim
    sort-nvim
    sqlite-lua
    tailwind-tools-nvim
    telescope-file-browser-nvim
    telescope-nvim
    tiny-inline-diagnostic-nvim
    toggleterm-nvim
    trouble-nvim
    ts-error-translator-nvim
    typescript-tools-nvim
    vim-jb-lua
    vimdoc-ja
    which-key-nvim
  ];
in
pkgListToAttr plugins
# vim: et sts=2 sw=2 ts=2
