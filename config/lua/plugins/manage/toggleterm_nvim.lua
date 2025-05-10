-- Terminal manager
-- repo: https://github.com/akinsho/toggleterm.nvim

return {
    cmd = 'ToggleTerm',
    dir = '@toggleterm_nvim@',
    name = 'toggleterm.nvim',
    opts = {
        direction = 'float',
        float_opts = {
            border = 'curved',
        },
        open_mapping = {
            [[<C-\>]],
            '<C-¥>',
        },
        shading_factor = 2,
        size = 10,
    },
}
