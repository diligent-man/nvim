require("utils.alias")
require("utils.constant")


---@type table
local utils = require("plugins.telescope.utils.utils")

---@type function
local live_multigrep = require("plugins.telescope.utils.multigrep").live_multigrep


---@type function
local find_nvim_cfg = utils.find_nvim_cfg


---@type table
local OPTS = DEFAULT_KEYMAP_OPTS


---@type table
local mappings = {
    {{"n"}, "<leader>fg", live_multigrep, {desc = "Live Multigrep"}},
    {{"n"}, "<leader>fh", require('telescope.builtin').help_tags, {desc = "Help Tags"}},
    {{"n"}, "<leader>ff", require('telescope.builtin').find_files, {desc = "Files"}},
    {{"n"}, "<leader>fcfg", find_nvim_cfg, {desc = "Nvim cfg"}},
}


for _, mapping in pairs(mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end
