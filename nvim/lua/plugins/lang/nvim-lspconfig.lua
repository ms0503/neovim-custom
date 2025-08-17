-- LSP configurations
-- repo: https://github.com/neovim/nvim-lspconfig

local utils = require('utils')

local keys = utils.keys

local server_list = function(capabilities)
    local schemastore = require('schemastore')
    return {
        arduino_language_server = {},
        astro = {},
        autotools_ls = {},
        awk_ls = {},
        bashls = {},
        biome = {},
        buf_ls = {},
        bzl = {},
        clangd = {
            capabilities = capabilities,
            filetypes = {
                'c',
                'cpp',
                'cuda',
                'objc',
                'objcpp',
            },
        },
        cmake = {},
        css_variables = {},
        cssls = {
            capabilities = capabilities,
        },
        cssmodules_ls = {},
        denols = {
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
        },
        docker_compose_language_service = {},
        dockerls = {},
        eslint = {
            settings = {
                codeActionOnSave = {
                    enable = true,
                },
                experimental = {
                    useFlatConfig = true,
                },
                format = true,
            },
        },
        gopls = {},
        hls = {},
        html = {},
        java_language_server = {},
        jsonls = {
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = schemastore.json.schemas(),
                    validate = {
                        enable = true,
                    },
                },
            },
        },
        kotlin_language_server = {},
        lua_ls = {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            'vim',
                        },
                    },
                },
            },
        },
        marksman = {},
        mesonlsp = {},
        nginx_language_server = {},
        nil_ls = {},
        nushell = {},
        ocamllsp = {},
        omnisharp = {},
        phpactor = {},
        pkgbuild_language_server = {},
        powershell_es = {},
        prismals = {},
        pyright = {},
        ruff = {},
        -- rust_analyzer = {}, -- configured by rustaceanvim
        stylelint_lsp = {},
        taplo = {},
        tailwindcss = {},
        terraformls = {},
        tinymist = {
            offset_encoding = 'utf-8',
            settings = {
                formatterMode = 'typstyle',
            },
        },
        ts_ls = {},
        vuels = {},
        yamlls = {
            settings = {
                yaml = {
                    schemaStore = {
                        enable = false,
                        url = '',
                    },
                    schemas = schemastore.yaml.schemas(),
                },
            },
        },
        zls = {},
    }
end

return {
    config = function()
        local lspconfig = require('lspconfig')
        local ts_error_translator = require('ts-error-translator')
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local server_list = server_list(capabilities)
        capabilities.textDocument.completion.completionItem.snippetSupport =
            true
        vim.lsp.handlers['textDocument/publishDiagnostics'] = function(
            err,
            result,
            ctx,
            config
        )
            ts_error_translator.translate_diagnostics(err, result, ctx)
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
        end
        for name, opts in pairs(server_list) do
            vim.lsp.config(name, opts)
        end
        vim.lsp.enable(keys(server_list))
        local node_root_dir = lspconfig.util.root_pattern('package.json')
        local is_node_repo = node_root_dir(vim.api.nvim_buf_get_name(0)) ~= nil
        if is_node_repo then
            vim.lsp.enable('denols', false)
        else
            vim.lsp.enable('ts_ls', false)
        end
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
