return {
    {
        config = function()
            local select = require('CopilotChat.select')
            require('CopilotChat').setup({
                prompts = {
                    Docs = {
                        prompt = "/COPILOT_REFACTOR 選択したコードのドキュメントを書いてください。ドキュメントをコメントとして追加した元のコードを含むコードブロックで回答してください。使用するプログラミング言語に最も適したドキュメントスタイルを使用してください（例：JavaScriptのJSDoc、Pythonのdocstringsなど）",
                    },
                    Explain = {
                        prompt = "/COPILOT_EXPLAIN カーソル上のコードの説明を段落をつけて書いてください。",
                    },
                    Fix = {
                        prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードに書き換えてください。",
                    },
                    FixDiagnostic = {
                        prompt = "ファイル内の次のような診断上の問題を解決してください：",
                        selection = select.diagnostics,
                    },
                    Optimize = {
                        prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。",
                    },
                    Tests = {
                        prompt = "/COPILOT_TESTS カーソル上のコードの詳細な単体テスト関数を書いてください。",
                    }
                }
            })
        end,
        dependencies = {
            {
                dir = '@copilot_lua@',
                name = 'copilot.lua'
            },
            {
                dir = '@plenary_nvim@',
                name = 'plenary.nvim'
            }
        },
        dir = '@copilotchat_nvim@',
        event = 'VeryLazy',
        keys = {
            {
                ';c',
                function()
                    local actions = require('CopilotChat.actions')
                    require('CopilotChat.integrations.telescope').pick(actions.prompt_actions())
                end,
                desc = 'Open Copilot Chat actions prompt',
                mode = { 'n', 'v' }
            }
        },
        name = 'CopilotChat.nvim'
    },
    {
        dir = '@copilot_lua@',
        event = 'InsertEnter',
        name = 'copilot.lua',
        opts = {
            filetypes = {
                gitcommit = true,
                markdown = true,
                yaml = true
            },
            suggestion = {
                auto_trigger = true,
                enabled = true
            }
        }
    }
}
