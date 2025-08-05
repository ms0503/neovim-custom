-- https://zenn.dev/vim_jp/articles/show-hlgroup-under-cursor
function ShowHighlightGroup()
    local hlgroup = vim.fn.synIDattr(
        vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1),
        'name'
    )
    local groupChain = {}
    while hlgroup ~= '' do
        vim.fn.add(groupChain, hlgroup)
        hlgroup = vim.fn.matchstr(
            vim.fn.trim(vim.fn.execute('highlight ' .. hlgroup)),
            '\\<links\\s\\+to\\>\\s\\+\\zs\\w\\+$'
        )
    end
    if vim.fn.empty(groupChain) then
        vim.print('No highlight groups')
        return
    end
    for _, group in ipairs(groupChain) do
        vim.fn.execute('highlight', group)
    end
end

vim.api.nvim_create_user_command('Hlgroup', ShowHighlightGroup, {})
