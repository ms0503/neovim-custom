-- Task runner
-- repo: https://github.com/stevearc/overseer.nvim

return {
    config = true,
    dependencies = {
        {
            dir = '@dressing_nvim@',
            name = 'dressing.nvim',
        },
        {
            dir = '@nvim_notify@',
            name = 'nvim-notify',
        },
        {
            dir = '@telescope_nvim@',
            name = 'telescope.nvim',
        },
    },
    dir = '@overseer_nvim@',
    name = 'overseer.nvim',
}
