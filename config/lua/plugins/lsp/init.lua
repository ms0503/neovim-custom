local formatter = require('plugins.lsp.formatter')
local lsp = require('plugins.lsp.lsp')
local misc = require('plugins.lsp.misc')
local ui = require('plugins.lsp.ui')

table.unpack = table.unpack or unpack

return {
    table.unpack(formatter),
    table.unpack(lsp),
    table.unpack(misc),
    table.unpack(ui),
}
