local conditions = require('heirline.conditions')
local get_icon = require('utils').get_icon
local utils = require('heirline.utils')

local icon = {
    hl = function(self)
        return {
            fg = self.icon_color
        }
    end,
    init = function(self)
        local filename = self.filename
        local suffix = vim.fn.fnamemodify(filename, ':e')
        self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, suffix, { default = true })
    end,
    provider = function(self)
        return ' ' .. self.icon and (self.icon .. ' ')
    end
}

local name = {
    hl = function(self)
        local is_em = self.is_active or self.is_visible
        return {
            bold = is_em,
            italic = is_em
        }
    end,
    provider = function(self)
        local filename = self.filename
        return filename == '' and '[No Name]' or vim.fn.fnamemodify(filename, ':t')
    end
}

local flags = {
    {
        condition = function(self)
            return vim.api.nvim_buf_get_option(self.bufnr, 'modified')
        end,
        hl = {
            fg = 'yellow'
        },
        provider = '[+]'
    },
    {
        condition = function(self)
            local bufnr = self.bufnr
            return not vim.api.nvim_buf_get_option(bufnr, 'modifiable') or vim.api.nvim_buf_get_option(bufnr, 'readonly')
        end,
        hl = {
            fg = 'orange'
        },
        provider = function(self)
            if vim.api.nvim_buf_get_option(self.bufnr, 'buftype') == 'terminal' then
                return ' ' .. get_icon('Terminal') .. ' '
            else
                return get_icon('FileReadOnly')
            end
        end
    }
}

local diag = {
    condition = conditions.has_diagnostics,
    init = function(self)
        local bufnr = self.bufnr
        if 0 < #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR }) then
            self.diagnostic_color = 'red1'
            self.diagnostic_icon = self.error_icon
        elseif 0 < #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN }) then
            self.diagnostic_color = 'yellow'
            self.diagnostic_icon = self.warn_icon
        elseif 0 < #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT }) then
            self.diagnostic_color = 'teal'
            self.diagnostic_icon = self.hint_icon
        elseif 0 < #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.INFO }) then
            self.diagnostic_color = 'blue2'
            self.diagnostic_icon = self.info_icon
        else
            self.diagnostic_icon = ''
        end
    end,
    static = {
        error_icon = get_icon('DiagnosticError'),
        hint_icon = get_icon('DiagnosticHint'),
        info_icon = get_icon('DiagnosticInfo'),
        warn_icon = get_icon('DiagnosticWarn')
    },
    update = {
        'BufEnter',
        'DiagnosticChanged'
    },
    {
        hl = function(self)
            return {
                fg = self.diagnostic_color
            }
        end,
        provider = function(self)
            return ' ' .. self.diagnostic_icon .. ' '
        end
    }
}

local buf = {
    hl = function(self)
        if self.is_active then
            return {
                bg = 'bg',
                fg = 'fg'
            }
        else
            return {
                bg = 'bg_dark',
                fg = 'comment'
            }
        end
    end,
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
    end,
    {
        provider = '  '
    },
    icon,
    name,
    flags,
    diag,
    {
        provider = '  '
    }
}

return utils.make_buflist(buf, {
    hl = {
        fg = 'gray'
    },
    provider = ''
}, {
    hl = {
        fg = 'gray'
    },
    provider = ''
})
