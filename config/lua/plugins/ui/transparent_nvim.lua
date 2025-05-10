-- Transparent
-- repo: https://github.com/xiyaowong/transparent.nvim

return {
    dir = '@transparent_nvim@',
    init = function()
        local self = require('transparent')
        local autocmd = vim.api.nvim_create_autocmd
        self.clear_prefix('NeoTree')
        autocmd('VimEnter', {
            callback = function()
                vim.cmd('TransparentEnable')
            end,
        })
    end,
    lazy = false,
    name = 'transparent.nvim',
    opts = {
        extra_groups = {
            'FloatBorder',
            'Folded',
            'Stl6B6B6B_393B40__',
            'TabLineFill',
            'WinBar',
        },
    },
}
