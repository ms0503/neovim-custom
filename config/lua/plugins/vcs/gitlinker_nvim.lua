-- Generate file link that links to hosted git repo
-- repo: https://github.com/ruifm/gitlinker.nvim

return {
    cmd = 'GitLink',
    config = true,
    dir = '@gitlinker_nvim@',
    keys = {
        {
            '<Leader>gY',
            '<Cmd>GitLink!<Cr>',
            desc = 'Open git link',
            mode = { 'n', 'v' },
        },
        {
            '<Leader>gy',
            '<Cmd>GitLink<Cr>',
            desc = 'Yank git link',
            mode = { 'n', 'v' },
        },
    },
    name = 'gitlinker.nvim',
}
