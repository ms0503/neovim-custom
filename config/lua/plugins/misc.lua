return {
    {
        dir = '@aerial_nvim@',
        keys = {
            {
                '<Leader>a',
                '<Cmd>AerialToggle!<Cr>',
                mode = 'n',
            },
        },
        name = 'aerial.nvim',
        opts = {
            on_attach = function(bufnr)
                local map = vim.keymap.set
                map('n', '{', '<Cmd>AerialPrev<Cr>', { buffer = bufnr })
                map('n', '}', '<Cmd>AerialNext<Cr>', { buffer = bufnr })
            end,
        },
    },
    {
        config = function()
            local map = vim.keymap.set
            map('n', '<C-a>', function()
                require('dial.map').manipulate('increment', 'normal')
            end)
            map('n', '<C-x>', function()
                require('dial.map').manipulate('decrement', 'normal')
            end)
            map('n', 'g<C-a>', function()
                require('dial.map').manipulate('increment', 'gnormal')
            end)
            map('n', 'g<C-x>', function()
                require('dial.map').manipulate('decrement', 'gnormal')
            end)
            map('v', '<C-a>', function()
                require('dial.map').manipulate('increment', 'visual')
            end)
            map('v', '<C-x>', function()
                require('dial.map').manipulate('decrement', 'visual')
            end)
            map('v', 'g<C-a>', function()
                require('dial.map').manipulate('increment', 'gvisual')
            end)
            map('v', 'g<C-x>', function()
                require('dial.map').manipulate('decrement', 'gvisual')
            end)
            local augend = require('dial.augend')
            require('dial.config').augends:register_group({
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias['%Y/%m/%d'],
                },
            })
        end,
        dir = '@dial_nvim@',
        name = 'dial.nvim',
    },
    {
        dir = '@diffview_nvim@',
        name = 'diffview.nvim',
    },
    {
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
            {
                build = function()
                    vim.fn.system('cd lua/fzy && make')
                end,
                dir = '@guihua_lua@',
                name = 'guihua.lua',
            },
            {
                dir = '@nvim_lspconfig@',
                name = 'nvim-lspconfig',
            },
            {
                dir = '@nvim_treesitter@',
                name = 'nvim-treesitter',
            },
        },
        dir = '@go_nvim@',
        event = 'CmdlineEnter',
        ft = {
            'go',
            'gomod',
        },
        name = 'go.nvim',
    },
    {
        dependencies = {
            {
                dependencies = {
                    {
                        dir = '@mini_icons@',
                        name = 'mini.icons',
                    },
                    {
                        dir = '@nvim_web_devicons@',
                        name = 'nvim-web-devicons',
                    },
                },
                dir = '@fzf_lua@',
                name = 'fzf-lua',
            },
            {
                dir = '@nvim_treesitter@',
                name = 'nvim-treesitter',
            },
        },
        dir = '@nvim_bqf@',
        name = 'nvim-bqf',
    },
    {
        dir = '@nvim_highlight_colors@',
        event = 'BufRead',
        name = 'nvim-highlight-colors',
        opts = {
            enable_tailwind = true,
        },
    },
    {
        dependencies = {
            dir = '@nvim_treesitter@',
            name = 'nvim-treesitter',
        },
        dir = '@nvim_ts_context_commentstring@',
        name = 'nvim-ts-context-commentstring',
        opts = {
            enable_autocmd = false,
        },
    },
    {
        config = true,
        dependencies = {
            {
                dir = '@dressing_nvim@',
                name = 'dressing.nvim',
            },
            {
                dir = '@nvim_notify@',
                name = 'nvim-notify',
            },
            {
                dir = '@telescope_nvim@',
                name = 'telescope.nvim',
            },
        },
        dir = '@overseer_nvim@',
        name = 'overseer.nvim',
    },
    {
        config = true,
        dir = '@project_nvim@',
        name = 'project.nvim',
    },
    {
        config = true,
        dir = '@render_markdown_nvim@',
        name = 'render-markdown.nvim',
    },
    {
        dir = '@sqlite_lua@',
        init = function()
            vim.g.sqlite_clib_path = '@sqlite_library_path@'
        end,
        name = 'sqlite.lua',
    },
    {
        config = true,
        dependencies = {
            {
                dir = '@nvim_lspconfig@',
                name = 'nvim-lspconfig',
            },
            {
                dir = '@plenary_nvim@',
                name = 'plenary.nvim',
            },
        },
        dir = '@typescript_tools_nvim@',
        name = 'typescript-tools.nvim',
    },
}
