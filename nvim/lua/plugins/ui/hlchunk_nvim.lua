-- Highlight code block
-- repo: https://github.com/shellRaining/hlchunk.nvim

return {
    dependencies = {
        'nvim-treesitter',
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
}
