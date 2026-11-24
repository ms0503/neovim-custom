-- Scrollbar
-- repo: https://github.com/petertriho/nvim-scrollbar

return {
    dependencies = {
        'nvim-hlslens',
        'vim-jb.lua',
    },
    dir = '@nvim_scrollbar@',
    event = 'BufReadPost',
    name = 'nvim-scrollbar',
    opts = function()
        local color_table = require('vim-jb.util').GetColors('dark')
        local colors = {}
        local ccolors = {}
        for k, v in pairs(color_table) do
            colors[k] = v.gui
            ccolors[k] = v.cterm
        end
        return {
            exclude = {
                buftypes = {
                    ['neo-tree'] = true,
                    TelescopePrompt = true,
                    noice = true,
                    notify = true,
                    prompt = true,
                    terminal = true,
                },
            },
            hide_if_all_visible = true,
            marks = {
                Error = {
                    highlight = {
                        ctermfg = ccolors.err, -- 167
                        fg = colors.err, -- #f75464
                    },
                },
                Hint = {
                    highlight = {
                        ctermfg = ccolors.number, -- 75
                        fg = colors.number, -- #2aacb8
                    },
                },
                Info = {
                    highlight = {
                        ctermfg = ccolors.link, -- 75
                        fg = colors.link, -- #548af7
                    },
                },
                Misc = {
                    highlight = {
                        ctermfg = ccolors.const, -- 175
                        fg = colors.const, -- #c77dbb
                    },
                },
                Search = {
                    highlight = {
                        ctermfg = ccolors.type, -- 173
                        fg = colors.type, -- #cc7832
                    },
                },
                Warn = {
                    highlight = {
                        ctermfg = ccolors.warning, -- 221
                        fg = colors.warning, -- #f2c55c
                    },
                },
            },
            providers = {
                ale = true,
                gitsigns = true,
                marks = true,
                search = true,
            },
            scrollbar = {
                hide_on_cursor = true,
                mouse = true,
                thumb = {
                    highlight = {
                        bg = colors.folded, -- #393b40
                        ctermbg = ccolors.folded, -- 18
                    },
                },
                visibility = 'active',
            },
        }
    end,
}
