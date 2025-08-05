-- crates.io integration
-- repo: https://github.com/saecki/crates.nvim

return {
    dir = '@crates_nvim@',
    event = 'BufRead Cargo.toml',
    name = 'crates.nvim',
    opts = {
        lsp = {
            actions = true,
            completion = true,
            enabled = true,
            hover = true,
        },
    },
}
