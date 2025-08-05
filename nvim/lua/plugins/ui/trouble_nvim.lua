-- Pretty lists
-- repo: https://github.com/folke/trouble.nvim

return {
    cmd = 'Trouble',
    config = true,
    dir = '@trouble_nvim@',
    keys = {
        {
            '<Leader>cl',
            '<Cmd>Trouble lsp toggle focus=false win.position=right<Cr>',
            desc = 'LSP Definitions / references / ... (Trouble)',
        },
        {
            '<Leader>cs',
            '<Cmd>Trouble symbols toggle focus=false<Cr>',
            desc = 'Symbols (Trouble)',
        },
        {
            '<Leader>xL',
            '<Cmd>Trouble loclist toggle<Cr>',
            desc = 'Location List (Trouble)',
        },
        {
            '<Leader>xQ',
            '<Cmd>Trouble qflist toggle<Cr>',
            desc = 'Quickfix List (Trouble)',
        },
        {
            '<Leader>xX',
            '<Cmd>Trouble diagnostics toggle filter.buf=0<Cr>',
            desc = 'Buffer Diagnostics (Trouble)',
        },
        {
            '<Leader>xx',
            '<Cmd>Trouble diagnostics toggle<Cr>',
            desc = 'Diagnostics (Trouble)',
        },
    },
    name = 'trouble.nvim',
}
