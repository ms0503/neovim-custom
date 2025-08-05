-- Terminal panes integration
-- repo: https://github.com/mrjones2014/smart-splits.nvim

return {
    dir = '@smart_splits_nvim@',
    lazy = false,
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
}
