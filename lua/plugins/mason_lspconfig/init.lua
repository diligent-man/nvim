--[[
The reason I put lsp & mason together because mason acts as an LSP manager
]]
require("plugins.mason_lspconfig.autocmd")
require("plugins.mason_lspconfig.keymap")
require("plugins.mason_lspconfig.diagnostic")


---@type table
local mason_lspconfig = require("plugins.mason_lspconfig.mason_lspconfig")


return mason_lspconfig
