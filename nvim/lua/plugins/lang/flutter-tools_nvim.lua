-- Flutter integration
-- repo: https://github.com/nvim-flutter/flutter-tools.nvim

return {
    config = true,
    dependencies = {
        'dressing.nvim',
        'plenary.nvim',
    },
    dir = '@flutter_tools_nvim@',
    lazy = false,
    name = 'flutter-tools.nvim',
}
