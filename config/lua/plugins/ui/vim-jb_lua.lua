-- JetBrains color theme
-- repo: https://github.com/ms0503/vim-jb.lua

return {
    config = function()
        vim.g.jb_enable_italic = true
        vim.g.jb_enable_unicode = true
        vim.g.jb_style = 'dark'
        vim.cmd('colorscheme jb-dark')
    end,
    dir = '@vim_jb_lua@',
    lazy = false,
    name = 'vim-jb.lua',
    priority = 1000,
}
