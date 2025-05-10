-- Go extension for nvim-dap
-- repo: https://github.com/leoluz/nvim-dap-go

return {
    config = true,
    dependencies = {
        dir = '@nvim_dap@',
        name = 'nvim-dap',
    },
    dir = '@nvim_dap_go@',
    name = 'nvim-dap-go',
}
