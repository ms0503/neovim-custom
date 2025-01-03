return {
    cmd = 'Telescope',
    config = function()
        local autocmd = vim.api.nvim_create_autocmd
        local map = vim.keymap.map
        local telescope_actions = require('telescope.actions')
        local telescope_builtin = require('telescope.builtin')
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    '.git',
                    'node_modules',
                },
                mappings = {
                    i = {
                        ['<C-h>'] = 'which_key',
                    },
                    n = {
                        ['q'] = telescope_actions.close,
                    },
                },
            },
        })
        map('n', '<Leader>fb', telescope_builtin.buffers, { noremap = true })
        map('n', '<Leader>ff', telescope_builtin.find_files, { noremap = true })
        map('n', '<Leader>fg', telescope_builtin.live_grep, { noremap = true })
        map('n', '<Leader>fh', telescope_builtin.help_tags, { noremap = true })
        autocmd('User', {
            callback = function(args)
                if args.data.bufname:match('*.csv') then
                    vim.wo.wrap = false
                end
            end,
            pattern = 'TelescopePreviewerLoaded',
        })
    end,
    dependencies = {
        {
            dir = '@plenary_nvim@',
            name = 'plenary.nvim',
        },
        {
            dir = '@telescope_file_browser_nvim@',
            name = 'telescope-file-browser.nvim',
        },
        {
            dir = '@nvim_treesitter@',
            name = 'nvim-treesitter',
        },
        {
            dir = '@nvim_web_devicons@',
            name = 'nvim-web-devicons',
        },
        {
            config = true,
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
            dir = '@which_key_nvim@',
            event = 'VeryLazy',
            keys = {
                {
                    '<Leader>?',
                    function()
                        require('which-key').show({ global = false })
                    end,
                    desc = 'Buffer Local Keymaps (which-key)',
                },
            },
            name = 'which-key.nvim',
        },
    },
    dir = '@telescope_nvim@',
    name = 'telescope.nvim',
}
