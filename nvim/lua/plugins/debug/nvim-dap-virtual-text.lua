-- Virtual text support for nvim-dap
-- repo: https://github.com/theHamsta/nvim-dap-virtual-text

return {
    dependencies = {
        {
            dir = '@nvim_dap@',
            name = 'nvim-dap',
        },
        {
            dir = '@nvim_treesitter@',
            name = 'nvim-treesitter',
        },
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
        virt_text_win_col = nil,
    },
}
