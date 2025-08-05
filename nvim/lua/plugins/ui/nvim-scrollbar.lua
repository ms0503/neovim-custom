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
        {
            config = function()
                require('hlslens').setup()
                local map = vim.api.nvim_set_keymap
                local opts = {
                    noremap = true,
                    silent = true,
                }
                map(
                    'n',
                    '#',
                    [[#<Cmd>lua require('hlslens').start()<Cr>]],
                    opts
                )
                map(
                    'n',
                    '*',
                    [[*<Cmd>lua require('hlslens').start()<Cr>]],
                    opts
                )
                map('n', '<Leader>l', '<Cmd>noh<Cr>', opts)
                map(
                    'n',
                    'N',
                    [[<Cmd>execute('normal! ' . v:count1 . 'N')<Cr><Cmd>lua require('hlslens').start()<Cr>]],
                    opts
                )
                map(
                    'n',
                    'g#',
                    [[g#<Cmd>lua require('hlslens').start()<Cr>]],
                    opts
                )
                map(
                    'n',
                    'g*',
                    [[g*<Cmd>lua require('hlslens').start()<Cr>]],
                    opts
                )
                map(
                    'n',
                    'n',
                    [[<Cmd>execute('normal! ' . v:count1 . 'n')<Cr><Cmd>lua require('hlslens').start()<Cr>]],
                    opts
                )
            end,
            dir = '@nvim_hlslens@',
            name = 'nvim-hlslens',
        },
        {
            dir = '@vim_jb_lua@',
            name = 'vim-jb.lua',
        },
    },
    dir = '@nvim_scrollbar@',
    event = 'BufReadPost',
    name = 'nvim-scrollbar',
}
