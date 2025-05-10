-- repo: https://github.com/kkharji/sqlite.lua

return {
    dir = '@sqlite_lua@',
    init = function()
        vim.g.sqlite_clib_path = '@sqlite_library_path@'
    end,
    name = 'sqlite.lua',
}
