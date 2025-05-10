-- UI for nvim-dap
-- repo: https://github.com/rcarriga/nvim-dap-ui

return {
    dependencies = {
        {
            dir = '@nvim_dap@',
            name = 'nvim-dap',
        },
        {
            dir = '@nvim_nio@',
            name = 'nvim-nio',
        },
    },
    dir = '@nvim_dap_ui@',
    name = 'nvim-dap-ui',
}
