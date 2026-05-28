-- Fuzzy picker
-- repo: https://github.com/nvim-telescope/telescope.nvim

return {
    cmd = 'Telescope',
    config = function()
        local autocmd = vim.api.nvim_create_autocmd
        local map = vim.keymap.set
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
        'nvim-treesitter',
        'nvim-web-devicons',
        'plenary.nvim',
        'telescope-file-browser.nvim',
        'which-key.nvim',
    },
    dir = '@telescope_nvim@',
    name = 'telescope.nvim',
}
