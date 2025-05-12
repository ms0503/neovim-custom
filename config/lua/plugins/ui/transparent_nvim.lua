-- Transparent
-- repo: https://github.com/xiyaowong/transparent.nvim

return {
    dir = '@transparent_nvim@',
    init = function()
        local self = require('transparent')
        local autocmd = vim.api.nvim_create_autocmd
        self.clear_prefix('NeoTree')
        self.clear_prefix('Stl*_393B40_*_')
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
            'TabLineFill',
            'WinBar',
        },
    },
}
