-- Change commentstring based on cursor location
-- repo: https://github.com/JoosepAlviste/nvim-ts-context-commentstring

return {
    dependencies = {
        dir = '@nvim_treesitter@',
        name = 'nvim-treesitter',
    },
    dir = '@nvim_ts_context_commentstring@',
    name = 'nvim-ts-context-commentstring',
    opts = {
        enable_autocmd = false,
    },
}
