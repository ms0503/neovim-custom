-- Improve key escape
-- repo: https://github.com/max397574/better-escape.nvim

return {
    dir = '@better_escape_nvim@',
    event = 'InsertEnter',
    name = 'better-escape.nvim',
    opts = {
        default_mappings = false,
        mappings = {
            c = {
                j = {
                    j = '<Esc>',
                },
            },
            i = {
                j = {
                    j = '<Esc>',
                },
            },
            s = {
                j = {
                    k = '<Esc>',
                },
            },
            v = {
                j = {
                    k = '<Esc>',
                },
            },
        },
        timeout = 1000,
    },
}
