-- LSP frontend
-- repo: https://github.com/nvimdev/lspsaga.nvim

local get_icon = require('utils').get_icon

return {
    dependencies = {
        {
            dir = '@nvim_treesitter@',
            name = 'nvim-treesitter',
        },
        {
            dir = '@nvim_web_devicons@',
            name = 'nvim-web-devicons',
        },
    },
    dir = '@lspsaga_nvim@',
    event = 'LspAttach',
    name = 'lspsaga.nvim',
    opts = {
        lightbulb = {
            sign = false,
        },
        ui = {
            border = 'rounded',
            code_action = get_icon('DiagnosticHint'),
        },
    },
}
