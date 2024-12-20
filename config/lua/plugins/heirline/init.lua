return {
    dependencies = {
        {
            dir = '@nvim_web_devicons@',
            name = 'nvim-web-devicons'
        },
        {
            dir = '@tokyonight_nvim@',
            name = 'tokyonight.nvim'
        }
    },
    dir = '@heirline_nvim@',
    event = 'BufEnter',
    name = 'heirline.nvim',
    opts = {
        opts = {
            colors = require('tokyonight.colors').setup({
                style = 'night'
            })
        },
        statusline = require('plugins.heirline.statusline'),
        tabline = require('plugins.heirline.tabline')
    }
}
