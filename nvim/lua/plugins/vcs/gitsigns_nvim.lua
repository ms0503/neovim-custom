-- Git integration
-- repo: https://github.com/lewis6991/gitsigns.nvim

return {
    config = true,
    dir = '@gitsigns_nvim@',
    event = {
        'BufNewFile',
        'BufRead',
    },
    name = 'gitsigns.nvim',
}
