-- Tree-sitter integration
-- repo: https://github.com/nvim-treesitter/nvim-treesitter

return {
    config = function()
        vim.opt.runtimepath:append('@treesitter_parsers@')
        require('nvim-treesitter.configs').setup({
            auto_install = false,
            ensure_installed = {},
            highlight = {
                additional_vim_regex_highlighting = true,
                disable = function(_, buf)
                    local max_filesize = 100 * 1024
                    local ok, stats =
                        pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and max_filesize < stats.size then
                        return true
                    end
                    return false
                end,
                enable = true,
            },
            ignore_install = {},
            indent = {
                enable = true,
            },
            modules = {},
            sync_install = false,
        })
    end,
    dir = '@nvim_treesitter@',
    event = 'BufReadPre',
    name = 'nvim-treesitter',
}
