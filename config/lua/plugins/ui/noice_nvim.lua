-- Modern UI for messages, cmdline and popup
-- repo: https://github.com/folke/noice.nvim

return {
    dependencies = {
        {
            dir = '@nui_nvim@',
            name = 'nui.nvim',
        },
        {
            dir = '@nvim_notify@',
            name = 'nvim-notify',
        },
        {
            dir = '@nvim_treesitter@',
            name = 'nvim-treesitter',
        },
    },
    dir = '@noice_nvim@',
    event = 'VeryLazy',
    name = 'noice.nvim',
    opts = {
        cmdline = {
            view = 'cmdline',
        },
        lsp = {
            override = {
                ['cmp.entry.get_documentation'] = true,
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            inc_rename = false,
            long_message_to_split = true,
            lsp_doc_border = true,
        },
        routes = {
            {
                filter = {
                    event = 'msg_show',
                    kind = 'search_count',
                },
                opts = {
                    skip = true,
                },
            },
            {
                filter = {
                    any = {
                        {
                            find = 'Agent service not initialized',
                        },
                        {
                            find = 'Not authenticated: NotSignedIn',
                        },
                    },
                    event = 'msg_show',
                },
                opts = {
                    skip = true,
                },
            },
        },
    },
}
