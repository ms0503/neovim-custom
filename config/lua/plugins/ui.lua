local get_icon = require('utils').get_icon
return {
    {
        dir = '@dressing_nvim@',
        name = 'dressing.nvim',
    },
    {
        dir = '@fidget_nvim@',
        name = 'fidget.nvim',
    },
    {
        dependencies = {
            dir = '@nvim_treesitter@',
            name = 'nvim-treesitter',
        },
        dir = '@hlchunk_nvim@',
        event = 'BufRead',
        name = 'hlchunk.nvim',
        opts = {
            blank = {
                enable = false,
            },
            chunk = {
                enable = true,
                use_treesitter = false,
            },
            line_num = {
                enable = false,
            },
        },
    },
    {
        dir = '@mini_icons@',
        name = 'mini.icons',
    },
    {
        dir = '@nvim_web_devicons@',
        name = 'nvim-web-devicons',
    },
    {
        cmd = 'Neotree',
        dependencies = {
            {
                dir = '@nui_nvim@',
                name = 'nui.nvim',
            },
            {
                dir = '@nvim_web_devicons@',
                name = 'nvim-web-devicons',
            },
            {
                dir = '@plenary_nvim@',
                name = 'plenary.nvim',
            },
        },
        dir = '@neo_tree_nvim@',
        name = 'neo-tree.nvim',
        opts = {
            close_if_last_window = true,
            default_component_configs = {
                container = {
                    enable_character_fade = true,
                },
                indent = {
                    padding = 0,
                },
                icon = {
                    default = get_icon('DefaultFile'),
                    folder_closed = get_icon('FolderClosed'),
                    folder_empty = get_icon('FolderEmpty'),
                    folder_empty_open = get_icon('FolderEmpty'),
                    folder_open = get_icon('FolderOpen'),
                },
                modified = {
                    symbol = get_icon('FileModified'),
                },
                name = {
                    highlight = 'NeoTreeFileName',
                    trailing_slash = false,
                    use_git_status_colors = true,
                },
                git_status = {
                    symbols = {
                        added = get_icon('GitAdd'),
                        conflict = get_icon('GitConflict'),
                        deleted = get_icon('GitDelete'),
                        ignored = get_icon('GitIgnored'),
                        modified = get_icon('GitChange'),
                        renamed = get_icon('GitRenamed'),
                        staged = get_icon('GitStaged'),
                        unstaged = get_icon('GitUnstaged'),
                        untracked = get_icon('GitUntracked'),
                    },
                },
                file_size = {
                    enabled = true,
                    required_width = 64,
                },
                type = {
                    enabled = true,
                    required_width = 122,
                },
                last_modified = {
                    enabled = true,
                    required_width = 88,
                },
                created = {
                    enabled = true,
                    required_width = 110,
                },
                symlink_target = {
                    enabled = false,
                },
            },
            filesystem = {
                filtered_items = {
                    hide_by_pattern = {
                        '*.meta',
                    },
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                    never_show = {
                        '.DS_Store',
                        'thumbs.db',
                    },
                },
            },
            window = {
                mappings = {
                    ['<Space>'] = false,
                },
                width = 30,
            },
        },
    },
    {
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
    },
    {
        dir = '@statuscol_nvim@',
        event = 'BufReadPre',
        name = 'statuscol.nvim',
        opts = function()
            local builtin = require('statuscol.builtin')
            return {
                bt_ignore = {
                    'nofile',
                    'terminal',
                },
                relculright = true,
                segments = {
                    {
                        click = 'v:lua.ScFa',
                        text = {
                            builtin.foldfunc,
                        },
                    },
                    {
                        click = 'v:lua.ScFa',
                        text = {
                            ' ',
                        },
                    },
                    {
                        sign = {
                            auto = true,
                            maxwidth = 2,
                            namespace = {
                                'diagnostic/signs',
                            },
                        },
                    },
                    {
                        text = {
                            builtin.lnumfunc,
                        },
                    },
                    {
                        sign = {
                            colwidth = 1,
                            maxwidth = 1,
                            namespace = {
                                'gitsigns',
                            },
                            wrap = true,
                        },
                    },
                },
            }
        end,
    },
    {
        cmd = 'ToggleTerm',
        dir = '@toggleterm_nvim@',
        name = 'toggleterm.nvim',
        opts = {
            direction = 'float',
            float_opts = {
                border = 'curved',
            },
            open_mapping = {
                [[<C-\>]],
                '<C-¥>',
            },
            shading_factor = 2,
            size = 10,
        },
    },
    {
        dir = '@transparent_nvim@',
        init = function()
            local self = require('transparent')
            local autocmd = vim.api.nvim_create_autocmd
            self.clear_prefix('NeoTree')
            autocmd('VimEnter', {
                callback = function()
                    vim.cmd('TransparentEnable')
                end,
            })
        end,
        lazy = false,
        name = 'transparent.nvim',
        opts = {
            extra_groups = {
                'FloatBorder',
                'TabLineFill',
                'WinBar',
            },
        },
    },
}
