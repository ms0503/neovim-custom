-- Go integration
-- repo: https://github.com/ray-x/go.nvim

return {
    build = function()
        require('go.install').update_all_sync()
    end,
    config = function()
        require('go').setup()
        local augroup = vim.api.nvim_create_augroup
        local autocmd = vim.api.nvim_create_autocmd
        augroup('GoFormat', {})
        autocmd('BufWritePre', {
            callback = function()
                require('go.format').goimports()
            end,
            group = 'GoFormat',
            pattern = '*.go',
        })
    end,
    dependencies = {
        'guihua.lua',
        'nvim-lspconfig',
        'nvim-treesitter',
    },
    dir = '@go_nvim@',
    event = 'CmdlineEnter',
    ft = {
        'go',
        'gomod',
    },
    name = 'go.nvim',
}
