-- Powerful formatter
-- repo: https://github.com/stevearc/conform.nvim

---@param name string
---@param bufnr? integer
---@return boolean
local function is_formatter_available(name, bufnr)
    local conform = require('conform')
    return conform.get_formatter_info(name, bufnr).available
end

return {
    cmd = 'ConformInfo',
    config = function()
        local autocmd = vim.api.nvim_create_autocmd
        local conform = require('conform')
        local neoconf = require('neoconf')
        local utils = require('utils')

        local function prettier_like_formatters(bufnr)
            if
                is_formatter_available('oxfmt', bufnr)
                and is_formatter_available('oxlint', bufnr)
            then
                return {
                    'oxlint',
                    'oxfmt',
                }
            end
            local formatters = {
                'biome',
                'prettierd',
                'prettier',
                stop_after_first = true,
            }
            local clients = vim.lsp.get_clients()
            for _, client in pairs(clients) do
                if client.name == 'denols' then
                    return utils.append_immutable(formatters, 'deno_fmt')
                end
            end
            return formatters
        end
        local function js_like_formatters(bufnr)
            if neoconf.get('formatter.eslint.enable') then
                return {
                    lsp_format = 'fallback',
                }
            end
            return prettier_like_formatters(bufnr)
        end
        conform.setup({
            default_format_opts = {
                lsp_format = 'fallback',
            },
            format_on_save = function(bufnr)
                if
                    not vim.g.disable_autoformat
                    and not vim.b[bufnr].disable_autoformat
                then
                    return {
                        timeout_ms = 2500,
                    }
                end
            end,
            formatters = {
                biome = {
                    require_cwd = true,
                },
                oxfmt = {
                    require_cwd = true,
                },
                prettier = {
                    require_cwd = true,
                },
                prettierd = {
                    require_cwd = true,
                },
                stylua = {
                    require_cwd = true,
                },
            },
            formatters_by_ft = {
                angular = prettier_like_formatters,
                astro = prettier_like_formatters,
                c = { 'clang_format' },
                css = prettier_like_formatters,
                graphql = prettier_like_formatters,
                haskell = { 'fourmolu' },
                html = prettier_like_formatters,
                javascript = js_like_formatters,
                javascriptreact = js_like_formatters,
                json = prettier_like_formatters,
                jsonc = prettier_like_formatters,
                lua = { 'stylua' },
                markdown = prettier_like_formatters,
                nix = { 'nixfmt' },
                ocaml = { 'ocamlformat' },
                proto = { 'buf' },
                python = { 'ruff_format' },
                rust = { 'rustfmt' },
                scss = prettier_like_formatters,
                sh = { 'shfmt' },
                svelte = prettier_like_formatters,
                toml = { 'taplo' },
                typescript = js_like_formatters,
                typescriptreact = js_like_formatters,
                typst = { 'typstyle' },
                vue = prettier_like_formatters,
                yaml = prettier_like_formatters,
            },
        })
        vim.api.nvim_create_user_command('FormatDisable', function(args)
            if args.bang then
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {
            bang = true,
            desc = 'Disable autoformat-on-save',
        })
        vim.api.nvim_create_user_command('FormatEnable', function(_)
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, {
            desc = 'Re-enable autoformat-on-save',
        })
        autocmd('BufWritePre', {
            callback = function(args)
                conform.format({ bufnr = args.buf })
            end,
            pattern = '*',
        })
    end,
    dependencies = {
        'neoconf.nvim',
    },
    dir = '@conform_nvim@',
    event = 'BufWritePre',
    name = 'conform.nvim',
}
