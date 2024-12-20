return {
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        local luasnip = require('luasnip')
        cmp.setup({
            formatting = {
                format = function(entry, item)
                    local color_item = require('nvim-highlight-colors').format(entry, {
                        kind = item.kind
                    })
                    item = lspkind.cmp_format({
                        before = require('tailwind-tools.cmp').lspkind_format,
                        ellipsis_char = '...',
                        mode = 'symbol_text',
                        show_labelDetails = true
                    })(entry, item)
                    if color_item.abbr_hl_group then
                        item.kind = color_item.abbr
                        item.kind_hl_group = color_item.abbr_hl_group
                    end
                    return item
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<Cr>'] = cmp.mapping.confirm({ select = true }),
                ['<Esc>'] = cmp.mapping.abort()
            }),
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            sources = {
                { group_index = 0, name = 'lazydev' },
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'vsnip' },
                { name = 'path' },
                { name = 'cmdline' },
                { name = 'cmdline_history' }
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            }
        })
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'cmdline' }
            })
        })
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'buffer' },
                { name = 'git' }
            })
        })
    end,
    dependencies = {
        {
            dir = '@cmp_buffer@',
            name = 'cmp-buffer'
        },
        {
            dir = '@cmp_cmdline@',
            name = 'cmp-cmdline'
        },
        {
            dir = '@cmp_cmdline_history@',
            name = 'cmp-cmdline-history'
        },
        {
            dir = '@cmp_git@',
            init = function()
                table.insert(require('cmp').get_config().sources, { name = 'git' })
            end,
            name = 'cmp-git'
        },
        {
            dir = '@cmp_nvim_lsp@',
            name = 'cmp-nvim-lsp'
        },
        {
            dir = '@cmp_path@',
            name = 'cmp-path'
        },
        {
            dir = '@cmp_vsnip@',
            name = 'cmp-vsnip'
        },
        {
            dependencies = {
                dependencies = {
                    {
                        dir = '@nvim_dap@',
                        name = 'nvim-dap'
                    },
                    {
                        dir = '@nvim_nio@',
                        name = 'nvim-nio'
                    }
                },
                dir = '@nvim_dap_ui@',
                name = 'nvim-dap-ui'
            },
            dir = '@lazydev_nvim@',
            ft = 'lua',
            name = 'lazydev.nvim',
            opts = {
                library = {
                    'nvim-dap-ui'
                }
            }
        },
        {
            dependencies = {
                dir = '@luasnip@',
                name = 'luasnip'
            },
            dir = '@cmp_luasnip@',
            name = 'cmp_luasnip'
        },
        {
            dir = '@lspkind_nvim@',
            name = 'lspkind.nvim'
        },
        {
            dir = '@nvim_highlight_colors@',
            name = 'nvim-highlight-colors'
        }
    },
    dir = '@nvim_cmp@',
    event = 'InsertEnter',
    name = 'nvim-cmp'
}
