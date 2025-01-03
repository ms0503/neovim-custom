return {
    {
        dir = '@comment_nvim@',
        name = 'Comment.nvim',
        opts = {
            extra = {
                above = 'gcO',
                below = 'gco',
                eol = 'gcA',
            },
            ignore = nil,
            mappings = {
                basic = true,
                extra = true,
            },
            opleader = {
                block = 'gb',
                line = 'gc',
            },
            padding = true,
            post_hook = nil,
            pre_hook = nil,
            sticky = true,
            toggler = {
                block = 'gbc',
                line = 'gcc',
            },
        },
    },
    {
        dir = '@better_escape_nvim@',
        event = 'InsertEnter',
        name = 'better-escape.nvim',
        opts = {
            default_mappings = false,
            mappings = {
                c = {
                    j = {
                        j = '<Esc>',
                    },
                },
                i = {
                    j = {
                        j = '<Esc>',
                    },
                },
                s = {
                    j = {
                        k = '<Esc>',
                    },
                },
                v = {
                    j = {
                        k = '<Esc>',
                    },
                },
            },
            timeout = 1000,
        },
    },
    {
        dir = '@mini_bufremove@',
        name = 'mini.bufremove',
    },
    {
        dir = '@nvim_autopairs@',
        event = 'InsertEnter',
        name = 'nvim-autopairs',
        opts = {
            map_c_h = true,
        },
    },
    {
        config = true,
        dependencies = {
            dir = '@nvim_treesitter@',
            name = 'nvim-treesitter',
        },
        dir = '@nvim_ts_autotag@',
        event = {
            'BufNewFile',
            'BufReadPre',
        },
        name = 'nvim-ts-autotag',
    },
    {
        dir = '@smart_splits_nvim@',
        name = 'smart-splits.nvim',
        opts = {
            ignored_buftypes = {
                'nofile',
            },
            ignored_filetypes = {
                'nofile',
                'prompt',
                'qf',
                'quickfix',
            },
        },
    },
    {
        cmd = 'Sort',
        config = true,
        dir = '@sort_nvim@',
        name = 'sort.nvim',
    },
    {
        config = function()
            vim.g.jb_enable_italic = true
            vim.g.jb_enable_unicode = true
            vim.g.jb_style = 'dark'
            vim.cmd('colorscheme jb-dark')
        end,
        dir = '@vim_jb_lua@',
        lazy = false,
        name = 'vim-jb.lua',
        priority = 1000,
    },
    {
        dir = '@vimdoc_ja@',
        event = 'VeryLazy',
        name = 'vimdoc-ja',
    },
}
