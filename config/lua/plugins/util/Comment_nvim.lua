-- Smart commenting
-- repo: https://github.com/numToStr/Comment.nvim

return {
    dir = '@comment_nvim@',
    name = 'Comment.nvim',
    opts = {
        extra = {
            above = 'gcO',
            below = 'gco',
            eol = 'gcA',
        },
        ignore = nil,
        mappings = {
            basic = true,
            extra = true,
        },
        opleader = {
            block = 'gb',
            line = 'gc',
        },
        padding = true,
        post_hook = nil,
        pre_hook = nil,
        sticky = true,
        toggler = {
            block = 'gbc',
            line = 'gcc',
        },
    },
}
