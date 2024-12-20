vim.cmd('autocmd!')
vim.encoding = 'utf-8'
vim.fileencoding = 'utf-8'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.python3_host_prog = '/home/ms0503/.local/share/nvim/.venv/bin/python3'
vim.scriptencoding = 'utf-8'
vim.wo.number = true

local options = {
    autoindent     = true,
    autoread       = true,
    backspace      = 'eol,indent,start',
    backup         = false,
    breakindent    = true,
    clipboard      = 'unnamedplus',
    cmdheight      = 1,
    compatible     = false,
    cursorcolumn   = true,
    cursorline     = true,
    encoding       = 'utf-8',
    expandtab      = true,
    fileencoding   = 'utf-8',
    fileencodings  = 'utf-8,cp932,sjis,iso-2022-jp,euc-jp',
    fileformat     = 'unix',
    fillchars      = 'eob: ,fold: ,foldclose:,foldopen:,foldsep: ',
    foldcolumn     = '1',
    foldenable     = true,
    foldlevel      = 99,
    foldlevelstart = 99,
    hidden         = true,
    hlsearch       = true,
    ignorecase     = true,
    incsearch      = true,
    laststatus     = 3,
    listchars      = 'eol:$,tab:>-',
    modeline       = true,
    modelines      = 5,
    modifiable     = true,
    number         = true,
    numberwidth    = 5,
    scrolloff      = 8,
    shiftwidth     = 4,
    showcmd        = true,
    showtabline    = 2,
    signcolumn     = 'yes',
    smartcase      = true,
    smartindent    = true,
    smarttab       = true,
    swapfile       = false,
    tabstop        = 4,
    termguicolors  = true,
    timeout        = true,
    timeoutlen     = 1000,
    ttimeoutlen    = 1000,
    updatetime     = 500,
    virtualedit    = 'onemore',
    wildmode       = 'list:longest',
    wrapscan       = true,
    writebackup    = false
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
