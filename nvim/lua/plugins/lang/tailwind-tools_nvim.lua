-- TailwindCSS integration
-- repo: https://github.com/lockasRanarison/tailwind-tools.nvim

return {
    dependencies = {
        dir = '@nvim_treesitter@',
        name = 'nvim-treesitter',
    },
    dir = '@tailwind_tools_nvim@',
    ft = {
        'html',
        'javascript',
        'javascriptreact',
        'svelte',
        'typescript',
        'typescriptreact',
        'vue',
    },
    name = 'tailwind-tools.nvim',
    opts = {},
}
