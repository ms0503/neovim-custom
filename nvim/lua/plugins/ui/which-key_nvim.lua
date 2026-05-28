-- Keybinding popup
-- repo: https://github.com/folke/which-key.nvim

return {
    config = true,
    dependencies = {
        'mini.icons',
        'nvim-web-devicons',
    },
    dir = '@which_key_nvim@',
    event = 'VeryLazy',
    keys = {
        {
            '<Leader>?',
            function()
                require('which-key').show({
                    global = false,
                })
            end,
            desc = 'Buffer Local Keymaps (which-key)',
        },
    },
    name = 'which-key.nvim',
}
