local M = {}

local icons = {
    ActiveLSP = '',
    ActiveTS = '',
    ArrowLeft = '',
    ArrowRight = '',
    Bookmarks = '',
    BufferClose = '󰅖',
    DapBreakpoint = '',
    DapBreakpointCondition = '',
    DapBreakpointRejected = '',
    DapLogPoint = '.>',
    DapStopped = '󰁕',
    Debugger = '',
    DefaultFile = '󰈙',
    Diagnostic = '󰒡',
    DiagnosticError = '',
    DiagnosticHint = '󰌵',
    DiagnosticInfo = '󰋼',
    DiagnosticWarn = '',
    Ellipsis = '…',
    FileModified = '',
    FileNew = '',
    FileReadOnly = '',
    FoldClosed = '',
    FoldOpened = '',
    FoldSeparator = ' ',
    FolderClosed = '',
    FolderEmpty = '',
    FolderOpen = '',
    Git = '󰊢',
    GitAdd = '',
    GitBranch = '',
    GitChange = '',
    GitConflict = '',
    GitDelete = '',
    GitIgnored = '◌',
    GitRenamed = '➜',
    GitSign = '▎',
    GitStaged = '✓',
    GitUnstaged = '✗',
    GitUntracked = '★',
    LSPLoaded = '',
    LSPLoading1 = '',
    LSPLoading2 = '󰀚',
    LSPLoading3 = '',
    Lazy = '󰒲 ',
    MacroRecording = '',
    Package = '󰏖',
    Paste = '󰅌',
    Refresh = '',
    Search = '',
    SearchText = '󰺯',
    Selected = '❯',
    Session = '󱂬',
    Sort = '󰒺',
    Spellcheck = '󰓆',
    Tab = '󰓩',
    TabClose = '󰅙',
    Terminal = '',
    Window = '',
    WordFile = '󰈭',
}

--- Filter array, like JavaScript's Array.prototype.filter
---
---@generic T
---@param arr T[]
---@param filterFn fun(v:any, i:number, arr:T[]):bool
---@return T[]
function M.filter(arr, filterFn)
    local result = {}
    for i, v in ipairs(arr) do
        if filterFn(v, i, arr) then
            table.insert(result, v)
        end
    end
    return result
end

--- Get icon from icon set
---
---@param icon_name string
---@return string
function M.get_icon(icon_name)
    return icons[icon_name] or ''
end

--- Get table keys
---
---@param tbl table
---@return (number|string)[]
function M.keys(tbl)
    local result = {}
    for k, _ in pairs(tbl) do
        table.insert(result, k)
    end
    return result
end

--- Map array, like JavaScript's Array.prototype.map
---
---@generic T, U
---@param arr T[]
---@param mapFn fun(v:any, i:number, arr:T[]):U
---@return U[]
function M.map(arr, mapFn)
    local result = {}
    for i, v in ipairs(arr) do
        result[i] = mapFn(v, i, arr)
    end
    return result
end

return M
