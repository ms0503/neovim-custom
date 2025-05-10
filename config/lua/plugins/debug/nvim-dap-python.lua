-- Python extension for nvim-dap
-- repo: https://github.com/mfussenegger/nvim-dap-python

return {
    config = function()
        require('dap-python').setup('python3')
    end,
    dependencies = {
        dir = '@nvim_dap@',
        name = 'nvim-dap',
    },
    dir = '@nvim_dap_python@',
    name = 'nvim-dap-python',
}
