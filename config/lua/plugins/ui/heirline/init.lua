return {
    dependencies = {
        {
            dir = '@nvim_web_devicons@',
            name = 'nvim-web-devicons',
        },
        {
            dir = '@vim_jb_lua@',
            name = 'vim-jb.lua',
        },
    },
    dir = '@heirline_nvim@',
    event = 'BufEnter',
    name = 'heirline.nvim',
    opts = function()
        return {
            opts = {
                colors = function()
                    local color_table = require('vim-jb.util').GetColors('dark')
                    local colors = {}
                    for k, v in pairs(color_table) do
                        colors[k] = v.gui
                    end
                    return colors
                end,
            },
            statusline = require('plugins.ui.heirline.statusline'),
            tabline = require('plugins.ui.heirline.tabline'),
        }
    end,
}
