local get_icon = require('utils').get_icon

return {
    {
        dir = '@lspkind_nvim@',
        name = 'lspkind.nvim'
    },
    {
        dependencies = {
            {
                dir = '@nvim_treesitter@',
                name = 'nvim-treesitter'
            },
            {
                dir = '@nvim_web_devicons@',
                name = 'nvim-web-devicons'
            }
        },
        dir = '@lspsaga_nvim@',
        event = 'LspAttach',
        name = 'lspsaga.nvim',
        opts = {
            lightbulb = {
                sign = false
            },
            ui = {
                border = 'rounded',
                code_action = get_icon('DiagnosticHint')
            }
        }
    },
    {
        config = function()
            vim.diagnostic.config({ virtual_text = false })
            require('tiny-inline-diagnostic').setup({
                hi = {
                    background = 'Normal'
                }
            })
        end,
        dir = '@tiny_inline_diagnostic_nvim@',
        event = 'LspAttach',
        keys = {
            {
                '<Leader>l',
                function()
                    require('tiny-inline-diagnostic').toggle()
                    local config = vim.diagnostic.config()
                    if config == nil or config.virtual_text then
                        vim.diagnostic.config({ virtual_text = false })
                    else
                        vim.diagnostic.config({
                            virtual_text = {
                                format = function(diag)
                                    return string.format("%s (%s)", diag.message, diag.source)
                                end
                            }
                        })
                    end
                end,
                desc = 'Toggle inline diagnostic mode',
                mode = {
                    'n',
                    'v'
                }
            }
        },
        name = 'tiny-inline-diagnostic.nvim'
    },
    {
        cmd = 'Trouble',
        config = true,
        dir = '@trouble_nvim@',
        keys = {
            {
                '<Leader>cl',
                '<Cmd>Trouble lsp toggle focus=false win.position=right<Cr>',
                desc = 'LSP Definitions / references / ... (Trouble)'
            },
            {
                '<Leader>cs',
                '<Cmd>Trouble symbols toggle focus=false<Cr>',
                desc = 'Symbols (Trouble)'
            },
            {
                '<Leader>xL',
                '<Cmd>Trouble loclist toggle<Cr>',
                desc = 'Location List (Trouble)'
            },
            {
                '<Leader>xQ',
                '<Cmd>Trouble qflist toggle<Cr>',
                desc = 'Quickfix List (Trouble)'
            },
            {
                '<Leader>xX',
                '<Cmd>Trouble diagnostics toggle filter.buf=0<Cr>',
                desc = 'Buffer Diagnostics (Trouble)'
            },
            {
                '<Leader>xx',
                '<Cmd>Trouble diagnostics toggle<Cr>',
                desc = 'Diagnostics (Trouble)'
            }
        },
        name = 'trouble.nvim'
    }
}
