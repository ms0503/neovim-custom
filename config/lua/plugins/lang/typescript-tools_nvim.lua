-- TypeScript integration
-- repo: https://github.com/pmizio/typescript-tools.nvim

return {
    config = true,
    dependencies = {
        {
            dir = '@nvim_lspconfig@',
            name = 'nvim-lspconfig',
        },
        {
            dir = '@plenary_nvim@',
            name = 'plenary.nvim',
        },
    },
    dir = '@typescript_tools_nvim@',
    name = 'typescript-tools.nvim',
}
