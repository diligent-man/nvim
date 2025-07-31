---@type function
local km = require("utils.alias").keymap

---@type table
local OPTS = require("utils.constant").DEFAULT_KEYMAP_OPTS


km("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", {desc = "Toggle file explorer"}, OPTS)
km("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", {desc = "Toggle file explorer on current file"}, OPTS)
km("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", {desc = "Collapse file explorer"}, OPTS)
km("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", {desc = "Refresh file explorer"}, OPTS)
