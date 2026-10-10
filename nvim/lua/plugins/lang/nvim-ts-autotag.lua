-- Auto close and auto rename html tag
-- repo: https://github.com/windwp/nvim-ts-autotag

return {
    config = true,
    dependencies = {
        'nvim-treesitter',
    },
    dir = '@nvim_ts_autotag@',
    event = {
        'BufNewFile',
        'BufReadPre',
    },
    name = 'nvim-ts-autotag',
}
