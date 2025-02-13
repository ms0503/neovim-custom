local get_icon = require('utils').get_icon
return {
    dir = '@alpha_nvim@',
    event = 'VimEnter',
    name = 'alpha.nvim',
    opts = function()
        local button = require('alpha.themes.dashboard').button
        local theme = require('alpha.themes.theta')
        local config = theme.config
        local logo = {
            '                                                     ',
            '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
            '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
            '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
            '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
            '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
            '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
            '                                                     ',
        }
        local buttons = {
            position = 'center',
            val = {
                {
                    opts = {
                        hl = 'SpecialComment',
                        position = 'center',
                    },
                    type = 'text',
                    val = 'Quick links',
                },
                {
                    type = 'padding',
                    val = 1,
                },
                button(
                    'f',
                    get_icon('Search') .. '  Telescope',
                    '<Cmd>Telescope find_files<Cr>'
                ),
                button(
                    'r',
                    get_icon('SearchText') .. '  Ripgrep',
                    '<Cmd>Telescope live_grep<Cr>'
                ),
                button('l', get_icon('Lazy') .. ' Lazy', '<Cmd>Lazy<Cr>'),
                button('q', get_icon('BufferClose') .. '  Quit', '<Cmd>qa<Cr>'),
            },
            type = 'group',
        }
        config.layout[2].val = logo
        config.layout[6] = buttons
        return config
    end,
}
