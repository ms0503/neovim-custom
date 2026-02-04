-- TailwindCSS integration
-- repo: https://github.com/lockasRanarison/tailwind-tools.nvim

return {
    config = function(options)
        local augroup = vim.api.nvim_create_augroup
        local autocmd = vim.api.nvim_create_autocmd
        local conceal = require('tailwind-tools.conceal')
        local config = require('tailwind-tools.config')
        local filetypes = require('tailwind-tools.filetypes')
        local keymaps = require('tailwind-tools.keymaps')
        local log = require('tailwind-tools.log')
        local lsp = require('tailwind-tools.lsp')
        local motions = require('tailwind-tools.motions')
        local state = require('tailwind-tools.state')
        local usercmd = vim.api.nvim_create_user_command

        config.options =
            vim.tbl_deep_extend('keep', options or {}, config.options)
        state.color.enabled = config.options.document_color.enabled
        state.conceal.enabled = config.options.conceal.enabled
        local server_config = config.options.server
        local has_telescope, telescope = pcall(require, 'telescope')
        local has_lspconfig, lspconfig = pcall(require, 'lspconfig')

        if
            vim.version().minor < 10
            and config.options.document_color.kind == 'inline'
        then
            log.warn(
                'Neovim v0.10 is required for inline color hints, using fallback option. Should use value "foreground" or "background" for document_color.kind'
            )
            config.options.document_color.kind = 'background'
        end
        vim.g.tailwind_tools = {
            color_au = augroup('tailwind_colors', {}),
            color_ns = vim.api.nvim_create_namespace('tailwind_colors'),
            conceal_au = augroup('tailwind_conceal', {}),
            conceal_ns = vim.api.nvim_create_namespace('tailwind_conceal'),
        }
        vim.api.nvim_set_hl(
            0,
            'TailwindConceal',
            config.options.conceal.highlight
        )
        if has_telescope then
            telescope.load_extension('tailwind')
        end
        if has_lspconfig and server_config.override then
            local conf = { settings = {} }
            conf.on_attach = lsp.make_on_attach(server_config.on_attach)
            conf.root_dir = server_config.root_dir
                or lsp.make_root_dir(lspconfig)
            conf.settings.tailwindCSS = vim.tbl_get(
                server_config,
                'settings',
                'tailwindCSS'
            ) or {}
            conf.settings.tailwindCSS = vim.tbl_deep_extend(
                'keep',
                conf.settings.tailwindCSS,
                server_config.settings
            )
            conf.settings.tailwindCSS.includeLanguages = vim.tbl_extend(
                'keep',
                server_config.settings.includeLanguages or {},
                filetypes.get_server_map()
            )
            conf.capabilities = vim.lsp.protocol.make_client_capabilities()
            conf.capabilities.textDocument.colorProvider = {
                dynamicRegistration = true,
            }
            vim.lsp.config('tailwindcss', conf)
        end
        if config.options.keymaps.smart_increment.enabled then
            keymaps.set_smart_increment()
        end
        usercmd('TailwindConcealEnable', conceal.enable, { nargs = 0 })
        usercmd('TailwindConcealDisable', conceal.disable, { nargs = 0 })
        usercmd('TailwindConcealToggle', conceal.toggle, { nargs = 0 })
        usercmd('TailwindSort', lsp.sort_classes, { nargs = 0 })
        usercmd('TailwindSortSelection', lsp.sort_selection, { range = '%' })
        usercmd('TailwindColorEnable', lsp.enable_color, { nargs = 0 })
        usercmd('TailwindColorDisable', lsp.disable_color, { nargs = 0 })
        usercmd('TailwindColorToggle', lsp.toggle_colors, { nargs = 0 })
        usercmd(
            'TailwindNextClass',
            motions.move_to_next_class,
            { nargs = 0, range = '%' }
        )
        usercmd(
            'TailwindPrevClass',
            motions.move_to_prev_class,
            { nargs = 0, range = '%' }
        )
        usercmd('TailwindSortSync', function()
            lsp.sort_classes(true)
        end, { nargs = 0 })
        usercmd('TailwindSortSelectionSync', function()
            lsp.sort_selection(true)
        end, { range = '%' })
        autocmd('LspAttach', {
            callback = lsp.on_attach_cb,
            group = vim.g.tailwind_tools.color_au,
        })
        autocmd('BufEnter', {
            callback = function()
                if state.conceal.enabled then
                    conceal.enable()
                end
            end,
            group = vim.g.tailwind_tools.conceal_au,
        })
        autocmd('ColorScheme', {
            callback = function()
                lsp.color_request(nil, 0)
                vim.api.nvim_set_hl(
                    0,
                    'TailwindConceal',
                    config.options.conceal.highlight
                )
            end,
            group = vim.g.tailwind_tools.color_au,
        })
    end,
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
