-- Fancy notifications
-- repo: https://github.com/rcarriga/nvim-notify

return {
    dir = '@nvim_notify@',
    name = 'nvim-notify',
    opts = {
        background_colour = require('vim-jb.util').GetColors('dark').editor.gui,
    },
}
