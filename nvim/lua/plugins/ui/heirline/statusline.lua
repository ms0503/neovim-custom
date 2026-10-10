local conditions = require('heirline.conditions')
local get_icon = require('utils').get_icon
local utils = require('heirline.utils')

local mode = {
    hl = function(self)
        local mode = self.mode:sub(1, 1)
        return {
            bg = self.mode_colors[mode],
            fg = 'editor',
        }
    end,
    init = function(self)
        self.mode = vim.fn.mode(1)
    end,
    provider = function(self)
        return ' ' .. self.mode_names[self.mode] .. ' '
    end,
    static = {
        mode_colors = {
            R = 'err', -- #f75464
            S = 'guttermod', -- #375fad
            V = 'const', -- #c77dbb
            [''] = 'guttermod', -- #375fad
            [''] = 'const', -- #c77dbb
            ['!'] = 'gutteradd', -- #549159
            c = 'warning', -- #f2c55c
            i = 'todo', -- #8bb33d
            n = 'link', -- #548af7
            r = 'err', -- #f75464
            s = 'guttermod', -- #375fad
            t = 'gutteradd', -- #549159
            v = 'const', -- #c77dbb
        },
        mode_names = {
            R = 'R',
            Rc = 'Rc',
            Rv = 'Rv',
            Rvc = 'Rv',
            Rvx = 'Rv',
            Rx = 'Rx',
            S = 'S_',
            V = 'V_',
            Vs = 'Vs',
            [''] = '^S',
            [''] = '^V',
            ['s'] = '^V',
            ['!'] = '!',
            ['no'] = 'N?',
            ['r?'] = '?',
            c = 'C',
            cv = 'Ex',
            i = 'I',
            ic = 'Ic',
            ix = 'Ix',
            n = 'N',
            niI = 'Ni',
            niR = 'Nr',
            niV = 'Nv',
            no = 'N?',
            noV = 'N?',
            nov = 'N?',
            nt = 'Nt',
            r = '...',
            rm = 'M',
            s = 'S',
            t = 'T',
            v = 'V',
            vs = 'Vs',
        },
    },
    update = {
        'ModeChanged',
        callback = vim.schedule_wrap(function()
            vim.cmd('redrawstatus')
        end),
        pattern = '*:*',
    },
}

local git_ctx = {
    condition = conditions.is_git_repo,
    hl = {
        bold = true,
        fg = 'const', -- #c77dbb
    },
    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0
            or self.status_dict.removed ~= 0
            or self.status_dict.changed ~= 0
    end,
    {
        provider = function(self)
            return ' '
                .. get_icon('GitBranch')
                .. ' '
                .. self.status_dict.head
                .. ' '
        end,
    },
}

local filetype = {
    {
        hl = function(self)
            return {
                fg = self.icon_color,
            }
        end,
        init = function(self)
            local filename = vim.api.nvim_buf_get_name(0)
            local suffix = vim.fn.fnamemodify(filename, ':e')
            self.icon, self.icon_color =
                require('nvim-web-devicons').get_icon_color(
                    filename,
                    suffix,
                    { default = true }
                )
        end,
        provider = function(self)
            return ' ' .. self.icon and (self.icon .. ' ')
        end,
    },
    {
        provider = function()
            return vim.bo.filetype .. ' '
        end,
    },
}

local git_st = {
    {
        hl = {
            fg = 'gutteradd', -- #549159
        },
        provider = function(self)
            local count = self.status_dict.added or 0
            return 0 < count and (get_icon('GitAdd') .. ' ' .. count .. ' ')
        end,
    },
    {
        hl = {
            fg = 'gutterdel', -- #868a91
        },
        provider = function(self)
            local count = self.status_dict.removed or 0
            return 0 < count and (get_icon('GitDelete') .. ' ' .. count .. ' ')
        end,
    },
    {
        hl = {
            fg = 'guttermod', -- #375fad
        },
        provider = function(self)
            local count = self.status_dict.changed or 0
            return 0 < count and (get_icon('GitChange') .. ' ' .. count .. ' ')
        end,
    },
}

local diag = {
    condition = conditions.has_diagnostics,
    init = function(self)
        self.errors =
            #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.hints =
            #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info =
            #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        self.warnings =
            #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    end,
    static = {
        error_icon = get_icon('DiagnosticError'),
        hint_icon = get_icon('DiagnosticHint'),
        info_icon = get_icon('DiagnosticInfo'),
        warn_icon = get_icon('DiagnosticWarn'),
    },
    update = {
        'BufEnter',
        'DiagnosticChanged',
    },
    {
        hl = {
            fg = 'err', -- #f75464
        },
        provider = function(self)
            return 0 < self.errors
                and (self.error_icon .. ' ' .. self.errors .. ' ')
        end,
    },
    {
        hl = {
            fg = 'warning', -- #f2c55c
        },
        provider = function(self)
            return 0 < self.warnings
                and (self.warn_icon .. ' ' .. self.warnings .. ' ')
        end,
    },
    {
        hl = {
            fg = 'link', -- #548af7
        },
        provider = function(self)
            return 0 < self.info and (self.info_icon .. ' ' .. self.info .. ' ')
        end,
    },
    {
        hl = {
            fg = 'number', -- #2aacb8
        },
        provider = function(self)
            return 0 < self.hints
                and (self.hint_icon .. ' ' .. self.hints .. ' ')
        end,
    },
    {
        provider = ' ',
    },
}

local lsp = {
    condition = conditions.lsp_attached,
    provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
            table.insert(names, server.name)
        end
        return get_icon('ActiveLSP') .. ' ' .. table.concat(names, ', ') .. ' '
    end,
    update = {
        'LspAttach',
        'LspDetach',
    },
}

local ruler = {
    provider = '%l:%c %P ',
}

local scroll = {
    hl = {
        fg = 'tag', -- #d5b778
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return self.sbar[i]
    end,
    static = {
        sbar = {
            '󰝦',
            '󰪞',
            '󰪟',
            '󰪠',
            '󰪡',
            '󰪢',
            '󰪣',
            '󰪣',
            '󰪥',
        },
    },
}

git_ctx = utils.insert(git_ctx, filetype, git_st)

return {
    hl = {
        bg = 'folded', -- #393b40
        fg = 'virtual', -- #6b6b6b
    },
    mode,
    git_ctx,
    {
        provider = '%=',
    },
    diag,
    lsp,
    ruler,
    scroll,
}
