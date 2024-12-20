local function merge_table_immutable(orig, over)
    return setmetatable(over, { __index = orig })
end

return {
    {
        cmd = 'ConformInfo',
        config = function()
            local autocmd = vim.api.nvim_create_autocmd
            local conform = require('conform')
            local neoconf = require('neoconf')

            local biome_for_project = merge_table_immutable(require('conform.formatters.biome'), { require_cwd = true })
            local prettier_for_project = merge_table_immutable(require('conform.formatters.prettier'), { require_cwd = true })
            local prettier_like_formatters = {
                'biome_for_project',
                'prettier_for_project',
                'prettier',
                stop_after_first = true
            }
            local function js_like_formatters()
                if neoconf.get('formatter.eslint.enable') then
                    return {
                        lsp_format = 'fallback'
                    }
                end
                local clients = vim.lsp.get_clients()
                for _, client in pairs(clients) do
                    if client.name == 'denols' then
                        return {
                            'biome_for_project',
                            'prettier_for_project',
                            'deno_fmt',
                            stop_after_first = true
                        }
                    end
                end
                return {
                    'biome_for_project',
                    'prettier_for_project',
                    'prettier',
                    stop_after_first = true
                }
            end
            conform.setup({
                default_format_opts = {
                    lsp_format = 'fallback'
                },
                format_on_save = function(bufnr)
                    if not vim.g.disable_autoformat and not vim.b[bufnr].disable_autoformat then
                        return {
                            timeout_ms = 2500
                        }
                    end
                end,
                formatters = {
                    biome_for_project = biome_for_project,
                    prettier_for_project = prettier_for_project,
                    stylua = {
                        require_cwd = true
                    }
                },
                formatters_by_ft = {
                    angular = { 'prettier' },
                    astro = { 'prettier' },
                    c = { 'clang_format' },
                    css = { 'prettier' },
                    graphql = { 'prettier' },
                    haskell = { 'fourmolu' },
                    html = { 'prettier' },
                    javascript = js_like_formatters,
                    javascriptreact = js_like_formatters,
                    json = prettier_like_formatters,
                    jsonc = prettier_like_formatters,
                    lua = { 'stylua' },
                    markdown = { 'prettier' },
                    nix = { 'nixfmt' },
                    ocaml = { 'ocamlformat' },
                    proto = { 'buf' },
                    python = { 'ruff_format' },
                    rust = { lsp_format = 'fallback' },
                    scss = { 'prettier' },
                    sh = { 'shfmt' },
                    svelte = { 'prettier' },
                    toml = { 'taplo' },
                    typescript = js_like_formatters,
                    typescriptreact = js_like_formatters,
                    typst = { 'typstyle' },
                    vue = { 'prettier' },
                    yaml = { 'prettier' }
                }
            })
            vim.api.nvim_create_user_command('FormatDisable', function(args)
                if args.bang then
                    vim.b.disable_autoformat = true
                else
                    vim.g.disable_autoformat = true
                end
            end, {
                bang = true,
                desc = 'Disable autoformat-on-save'
            })
            vim.api.nvim_create_user_command('FormatEnable', function(args)
                vim.b.disable_autoformat = false
                vim.g.disable_autoformat = false
            end, {
                desc = 'Re-enable autoformat-on-save'
            })
            autocmd('BufWritePre', {
                callback = function(args)
                    conform.format({ bufnr = args.buf })
                end,
                pattern = '*'
            })
        end,
        dependencies = {
            dir = '@neoconf_nvim@',
            name = 'neoconf.nvim'
        },
        dir = '@conform_nvim@',
        event = 'BufWritePre',
        name = 'conform.nvim'
    }
}
