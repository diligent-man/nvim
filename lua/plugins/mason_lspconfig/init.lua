--[[
The reason I put lsp & mason together because mason acts as an LSP manager
]]
require("utils.alias")

require("plugins.mason_lspconfig.utils.autocmd")
require("plugins.mason_lspconfig.utils.keymap")
require("plugins.mason_lspconfig.utils.diagnostic")


---@type table
local mason_lspconfig = require("plugins.mason_lspconfig.mason_lspconfig")


return mason_lspconfig
