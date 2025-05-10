-- LSP configurations
-- repo: https://github.com/neovim/nvim-lspconfig

local server_list = {
    'arduino_language_server',
    'astro',
    'autotools_ls',
    'awk_ls',
    'bashls',
    'biome',
    'buf_ls',
    'bzl',
    -- 'clangd', -- configured in plugins.lsp.nvim-lspconfig
    'cmake',
    'css_variables',
    -- 'cssls', -- configured in plugins.lsp.nvim-lspconfig
    'cssmodules_ls',
    -- 'denols', -- configured in plugins.lsp.nvim-lspconfig
    'docker_compose_language_service',
    'dockerls',
    -- 'eslint', -- configured in plugins.lsp.nvim-lspconfig
    'gopls',
    -- 'groovyls',
    'hls',
    'html',
    'java_language_server',
    -- 'jsonls', -- configured in plugins.lsp.nvim-lspconfig
    'kotlin_language_server',
    -- 'lua_ls', -- configured in plugins.lsp.nvim-lspconfig
    'marksman',
    'mesonlsp',
    'nginx_language_server',
    'nil_ls',
    'nushell',
    'ocamllsp',
    'omnisharp',
    'phpactor',
    -- 'pkgbuild_language_server',
    -- 'powershell_es',
    -- 'prismals',
    'pyright',
    'ruff',
    'rust_analyzer',
    'stylelint_lsp',
    'taplo',
    'tailwindcss',
    'terraformls',
    -- 'tinymist', -- configured in plugins.lsp.nvim-lspconfig
    -- 'ts_ls', -- configured in plugins.lsp.nvim-lspconfig
    'vuels',
    -- 'yamlls', -- configured in plugins.lsp.nvim-lspconfig
    'zls',
}

return {
    config = function()
        local lspconfig = require('lspconfig')
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport =
            true
        vim.lsp.handlers['textDocument/publishDiagnostics'] = function(
            err,
            result,
            ctx,
            config
        )
            require('ts-error-translator').translate_diagnostics(
                err,
                result,
                ctx
            )
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
        end
        for _, server in ipairs(server_list) do
            lspconfig[server].setup({})
        end
        local node_root_dir = lspconfig.util.root_pattern('package.json')
        local is_node_repo = node_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil
        if is_node_repo then
            lspconfig.ts_ls.setup({})
        else
            lspconfig.denols.setup({
                init_options = {
                    lint = true,
                    suggest = {
                        imports = {
                            hosts = {
                                ['https://cdn.nest.land'] = true,
                                ['https://crux.land'] = true,
                                ['https://deno.land'] = true,
                            },
                        },
                    },
                    unstable = true,
                },
            })
        end
        lspconfig.eslint.setup({
            settings = {
                codeActionOnSave = {
                    enable = true,
                },
                experimental = {
                    useFlatConfig = true,
                },
                format = true,
            },
        })
        lspconfig.cssls.setup({
            capabilities = capabilities,
        })
        lspconfig.jsonls.setup({
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas(),
                    validate = {
                        enable = true,
                    },
                },
            },
        })
        lspconfig.yamlls.setup({
            settings = {
                yaml = {
                    schemaStore = {
                        enable = false,
                        url = '',
                    },
                    schemas = require('schemastore').yaml.schemas(),
                },
            },
        })
        lspconfig.clangd.setup({
            capabilities = capabilities,
            filetypes = {
                'c',
                'cpp',
                'cuda',
                'objc',
                'objcpp',
            },
        })
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            'vim',
                        },
                    },
                },
            },
        })
        lspconfig.tinymist.setup({
            offset_encoding = 'utf-8',
            settings = {
                formatterMode = 'typstyle',
            },
        })
    end,
    dependencies = {
        {
            dir = '@neoconf_nvim@',
            name = 'neoconf.nvim',
        },
        {
            dir = '@schemastore_nvim@',
            name = 'schemastore.nvim',
        },
        {
            dir = '@ts_error_translator_nvim@',
            name = 'ts-error-translator.nvim',
        },
    },
    dir = '@nvim_lspconfig@',
    event = {
        'BufNewFile',
        'BufReadPre',
    },
    name = 'nvim-lspconfig',
}
