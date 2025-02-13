local map = vim.api.nvim_set_keymap

map('n', '<C-j>', 'G', { silent = false })
map('n', '<C-k>', 'gg', { silent = false })
map(
    'n',
    '<Esc><Esc>',
    ':nohlsearch<Cr><Esc>',
    { noremap = false, silent = true }
)
map('n', '<S-Tab>', '<Cmd>bprev<Cr>', { silent = true })
map('n', '<Tab>', '<Cmd>bnext<Cr>', { silent = true })
map('n', 'j', 'gj', { noremap = false, silent = false })
map('n', 'k', 'gk', { noremap = false, silent = false })
