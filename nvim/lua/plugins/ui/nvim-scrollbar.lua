-- Scrollbar
-- repo: https://github.com/petertriho/nvim-scrollbar

return {
    config = function()
        local color_table = require('vim-jb.util').GetColors('dark')
        local colors = {}
        for k, v in pairs(color_table) do
            colors[k] = v.gui
        end
        require('scrollbar').setup({
            excluded_buftypes = {
                'TelescopePrompt',
                'neo-tree',
                'noice',
                'notify',
                'prompt',
                'terminal',
            },
            handle = {
                color = colors.folded, -- #393b40
            },
            handlers = {
                ale = true,
                gitsigns = true,
                search = true,
            },
            hide_if_all_visible = true,
            marks = {
                Error = {
                    color = colors.err, -- #f75464
                },
                Hint = {
                    color = colors.number, -- #2aacb8
                },
                Info = {
                    color = colors.link, -- #548af7
                },
                Misc = {
                    color = colors.const, -- #c77dbb
                },
                Search = {
                    color = colors.type, -- #cc7832
                },
                Warn = {
                    color = colors.warning, -- #f2c55c
                },
            },
        })
        require('scrollbar.handlers.search').setup({
            calm_down = true,
        })
    end,
    dependencies = {
        'nvim-hlslens',
        'vim-jb.lua',
    },
    dir = '@nvim_scrollbar@',
    event = 'BufReadPost',
    name = 'nvim-scrollbar',
}
