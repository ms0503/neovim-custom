return {
    {
        dir = '@nvim_dap@',
        name = 'nvim-dap'
    },
    {
        config = true,
        dependencies = {
            dir = '@nvim_dap@',
            name = 'nvim-dap'
        },
        dir = '@nvim_dap_go@',
        name = 'nvim-dap-go'
    },
    {
        config = function()
            require('dap-python').setup('python3')
        end,
        dependencies = {
            dir = '@nvim_dap@',
            name = 'nvim-dap'
        },
        dir = '@nvim_dap_python@',
        name = 'nvim-dap-python'
    },
    {
        dependencies = {
            {
                dir = '@nvim_dap@',
                name = 'nvim-dap'
            },
            {
                dir = '@nvim_nio@',
                name = 'nvim-nio'
            }
        },
        dir = '@nvim_dap_ui@',
        name = 'nvim-dap-ui'
    },
    {
        dependencies = {
            {
                dir = '@nvim_dap@',
                name = 'nvim-dap'
            },
            {
                dir = '@nvim_treesitter@',
                name = 'nvim-treesitter'
            }
        },
        dir = '@nvim_dap_virtual_text@',
        name = 'nvim-dap-virtual-text',
        opts = {
            all_frames = false,
            all_references = false,
            clear_on_continue = false,
            commented = true,
            display_callback = function(variable, _, _, _, options)
                if options.virt_text_pos == 'inline' then
                    return ' = ' .. variable.value:gsub('%s+', ' ')
                else
                    return variable.name .. ' = ' .. variable.value:gsub('%s+', ' ')
                end
            end,
            enabled = true,
            enabled_commands = true,
            highlight_changed_variables = true,
            highlight_new_as_changed = false,
            only_first_definition = true,
            show_stop_reason = true,
            virt_lines = false,
            virt_text_pos = 'inline',
            virt_text_win_col = nil
        }
    }
}
