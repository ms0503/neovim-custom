-- Fancy notifications
-- repo: https://github.com/rcarriga/nvim-notify

return {
    dependencies = {
        dir = '@vim_jb_lua@',
        name = 'vim-jb.lua',
    },
    dir = '@nvim_notify@',
    name = 'nvim-notify',
    opts = function()
        return {
            background_colour = require('vim-jb.util').GetColors('dark').editor.gui,
        }
    end,
}
