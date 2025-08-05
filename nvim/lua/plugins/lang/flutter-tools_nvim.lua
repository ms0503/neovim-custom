-- Flutter integration
-- repo: https://github.com/nvim-flutter/flutter-tools.nvim

return {
    config = true,
    dependencies = {
        {
            dir = '@dressing_nvim@',
            name = 'dressing.nvim',
        },
        {
            dir = '@plenary_nvim@',
            name = 'plenary.nvim',
        },
    },
    dir = '@flutter_tools_nvim@',
    lazy = false,
    name = 'flutter-tools.nvim',
}
