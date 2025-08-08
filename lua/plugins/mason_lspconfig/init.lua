--[[
The reason I put lsp & mason together because mason acts as an LSP manager
]]
require("utils.alias")

require("plugins.mason_lspconfig.utils.autocmd")
require("plugins.mason_lspconfig.utils.keymap")


---@type function
local diagnostic_cfg = require("plugins.mason_lspconfig.utils.diagnostic").diagnostic_cfg

---@type table
local mason_lspconfig = require("plugins.mason_lspconfig.mason_lspconfig")


diagnostic.config(diagnostic_cfg)


return mason_lspconfig
