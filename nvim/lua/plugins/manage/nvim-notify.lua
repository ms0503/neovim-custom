-- Fancy notifications
-- repo: https://github.com/rcarriga/nvim-notify

return {
    dependencies = {
        'vim-jb.lua',
    },
    dir = '@nvim_notify@',
    name = 'nvim-notify',
    opts = function()
        return {
            background_colour = require('vim-jb.util').GetColors('dark').editor.gui,
        }
    end,
}
