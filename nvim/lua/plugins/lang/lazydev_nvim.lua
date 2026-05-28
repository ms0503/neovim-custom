-- Lua language server integration
-- repo: https://github.com/folke/lazydev.nvim

return {
    dependencies = {
        'nvim-dap-ui',
    },
    dir = '@lazydev_nvim@',
    ft = 'lua',
    name = 'lazydev.nvim',
    opts = {
        library = {
            'nvim-dap-ui',
        },
    },
}
