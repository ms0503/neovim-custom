-- Outline window
-- repo: https://github.com/stevearc/aerial.nvim

return {
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
}
