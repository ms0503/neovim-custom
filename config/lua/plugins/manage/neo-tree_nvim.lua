-- File manager
-- repo: https://github.com/nvim-neo-tree/neo-tree.nvim

local get_icon = require('utils').get_icon

return {
    cmd = 'Neotree',
    dependencies = {
        {
            dir = '@nui_nvim@',
            name = 'nui.nvim',
        },
        {
            dir = '@nvim_web_devicons@',
            name = 'nvim-web-devicons',
        },
        {
            dir = '@plenary_nvim@',
            name = 'plenary.nvim',
        },
    },
    dir = '@neo_tree_nvim@',
    name = 'neo-tree.nvim',
    opts = {
        close_if_last_window = true,
        default_component_configs = {
            container = {
                enable_character_fade = true,
            },
            indent = {
                padding = 0,
            },
            icon = {
                default = get_icon('DefaultFile'),
                folder_closed = get_icon('FolderClosed'),
                folder_empty = get_icon('FolderEmpty'),
                folder_empty_open = get_icon('FolderEmpty'),
                folder_open = get_icon('FolderOpen'),
            },
            modified = {
                symbol = get_icon('FileModified'),
            },
            name = {
                highlight = 'NeoTreeFileName',
                trailing_slash = false,
                use_git_status_colors = true,
            },
            git_status = {
                symbols = {
                    added = get_icon('GitAdd'),
                    conflict = get_icon('GitConflict'),
                    deleted = get_icon('GitDelete'),
                    ignored = get_icon('GitIgnored'),
                    modified = get_icon('GitChange'),
                    renamed = get_icon('GitRenamed'),
                    staged = get_icon('GitStaged'),
                    unstaged = get_icon('GitUnstaged'),
                    untracked = get_icon('GitUntracked'),
                },
            },
            file_size = {
                enabled = true,
                required_width = 64,
            },
            type = {
                enabled = true,
                required_width = 122,
            },
            last_modified = {
                enabled = true,
                required_width = 88,
            },
            created = {
                enabled = true,
                required_width = 110,
            },
            symlink_target = {
                enabled = false,
            },
        },
        filesystem = {
            filtered_items = {
                hide_by_pattern = {
                    '*.meta',
                },
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false,
                never_show = {
                    '.DS_Store',
                    'thumbs.db',
                },
            },
        },
        window = {
            mappings = {
                ['<Space>'] = false,
            },
            width = 30,
        },
    },
}
