-- Configurable statuscolumn
-- repo: https://github.com/luukvbaal/statuscol.nvim

return {
    dir = '@statuscol_nvim@',
    event = 'BufReadPre',
    name = 'statuscol.nvim',
    opts = function()
        local builtin = require('statuscol.builtin')
        return {
            bt_ignore = {
                'nofile',
                'terminal',
            },
            relculright = true,
            segments = {
                {
                    click = 'v:lua.ScFa',
                    text = {
                        builtin.foldfunc,
                    },
                },
                {
                    click = 'v:lua.ScFa',
                    text = {
                        ' ',
                    },
                },
                {
                    sign = {
                        auto = true,
                        maxwidth = 2,
                        namespace = {
                            'diagnostic/signs',
                        },
                    },
                },
                {
                    text = {
                        builtin.lnumfunc,
                    },
                },
                {
                    sign = {
                        colwidth = 1,
                        maxwidth = 1,
                        namespace = {
                            'gitsigns',
                        },
                        wrap = true,
                    },
                },
            },
        }
    end,
}
