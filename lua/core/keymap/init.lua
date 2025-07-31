---@type function
local km = require("utils.alias").keymap

---@type table
local OPTS = require("utils.constant").DEFAULT_KEYMAP_OPTS


-- Window splitting
km("n", "<leader>sv", ":vs<CR>", OPTS)
km("n", "<leader>sh", ":sp<CR>", OPTS)
km("n", "<leader>se", "<C-w>=", OPTS)
km("n", "<leader>sf", "<C-w>|", OPTS)
