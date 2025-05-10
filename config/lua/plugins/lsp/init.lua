table.unpack = table.unpack or unpack

return {
    require('plugins.lsp.conform_nvim'),
    require('plugins.lsp.crates_nvim'),
    require('plugins.lsp.lspkind_nvim'),
    require('plugins.lsp.lspsaga_nvim'),
    require('plugins.lsp.nvim-lspconfig'),
    require('plugins.lsp.rustaceanvim'),
    require('plugins.lsp.tailwind-tools_nvim'),
    require('plugins.lsp.tiny-inline-diagnostic_nvim'),
    require('plugins.lsp.trouble_nvim'),
}
