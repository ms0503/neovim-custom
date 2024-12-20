return {
    {
        dir = '@crates_nvim@',
        event = 'Buf Read Cargo.toml',
        name = 'crates.nvim',
        opts = {
            lsp = {
                actions = true,
                completion = true,
                enabled = true,
                hover = true
            }
        }
    },
    {
        dir = '@rustaceanvim@',
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    cmd = function()
                        return {
                            'rust-analyzer'
                        }
                    end
                }
            }
        end,
        lazy = false,
        name = 'rustaceanvim'
    },
    {
        config = true,
        dependencies = {
            dir = '@nvim_treesitter@',
            name = 'nvim-treesitter'
        },
        dir = '@tailwind_tools_nvim@',
        ft = {
            'html',
            'javascript',
            'javascriptreact',
            'svelte',
            'typescript',
            'typescriptreact',
            'vue'
        },
        name = 'tailwind-tools.nvim'
    }
}
