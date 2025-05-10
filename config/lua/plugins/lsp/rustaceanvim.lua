return {
    dir = '@rustaceanvim@',
    init = function()
        vim.g.rustaceanvim = {
            server = {
                cmd = function()
                    return {
                        'rust-analyzer',
                    }
                end,
            },
        }
    end,
    lazy = false,
    name = 'rustaceanvim',
}
