-- Inline diagnostic messages
-- repo: https://github.com/rachartier/tiny-inline-diagnostic.nvim

return {
    config = function()
        vim.diagnostic.config({ virtual_text = false })
        require('tiny-inline-diagnostic').setup({
            hi = {
                background = 'Normal',
            },
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
                                return string.format(
                                    '%s (%s)',
                                    diag.message,
                                    diag.source
                                )
                            end,
                        },
                    })
                end
            end,
            desc = 'Toggle inline diagnostic mode',
            mode = {
                'n',
                'v',
            },
        },
    },
    name = 'tiny-inline-diagnostic.nvim',
}
