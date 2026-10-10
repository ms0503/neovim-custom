-- Highlight color texts
-- repo: https://github.com/brenoprata10/nvim-highlight-colors

return {
    dir = '@nvim_highlight_colors@',
    event = 'BufRead',
    name = 'nvim-highlight-colors',
    opts = {
        enable_tailwind = true,
    },
}
