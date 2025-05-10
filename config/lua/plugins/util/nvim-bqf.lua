-- Better quickfix
-- repo: https://github.com/kevinhwang91/nvim-bqf

return {
    dependencies = {
        {
            dependencies = {
                {
                    dir = '@mini_icons@',
                    name = 'mini.icons',
                },
                {
                    dir = '@nvim_web_devicons@',
                    name = 'nvim-web-devicons',
                },
            },
            dir = '@fzf_lua@',
            name = 'fzf-lua',
        },
        {
            dir = '@nvim_treesitter@',
            name = 'nvim-treesitter',
        },
    },
    dir = '@nvim_bqf@',
    name = 'nvim-bqf',
}
