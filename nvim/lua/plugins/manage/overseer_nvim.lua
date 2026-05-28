-- Task runner
-- repo: https://github.com/stevearc/overseer.nvim

return {
    config = true,
    dependencies = {
        'dressing.nvim',
        'nvim-notify',
        'telescope.nvim',
    },
    dir = '@overseer_nvim@',
    name = 'overseer.nvim',
}
