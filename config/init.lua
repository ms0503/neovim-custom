local lazypath = '@lazy_nvim@'
local configpath = '@neovim_custom_config_path@'

vim.loader.enable()
vim.g.mapleader = ' '
vim.opt.runtimepath:prepend(lazypath)
vim.opt.runtimepath:prepend(configpath)

require('lazy').setup({
    defaults = {
        lazy = true,
    },
    install = {
        missing = false,
    },
    performance = {
        reset_packpath = false,
        rtp = {
            reset = false,
        },
    },
    rocks = {
        enabled = false,
        hererocks = false,
    },
    spec = 'plugins',
})
require('base')
require('keymaps')
require('autocmds')
