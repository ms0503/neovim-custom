-- Auto pairer
-- repo: https://github.com/windwp/nvim-autopairs

return {
    config = true,
    dir = '@nvim_autopairs@',
    event = 'InsertEnter',
    name = 'nvim-autopairs',
    opts = {
        map_c_h = true,
    },
}
