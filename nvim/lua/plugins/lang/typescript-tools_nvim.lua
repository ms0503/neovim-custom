-- TypeScript integration
-- repo: https://github.com/pmizio/typescript-tools.nvim

return {
    config = true,
    dependencies = {
        'nvim-lspconfig',
        'plenary.nvim',
    },
    dir = '@typescript_tools_nvim@',
    name = 'typescript-tools.nvim',
}
