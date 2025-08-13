require("utils.alias")
require("utils.constant")


---@type table
local utils = require("plugins.telescope.utils.utils")


---@type table
local builtin = require("telescope.builtin")

---@type table
local live_multigrep = require("plugins.telescope.utils.multigrep").live_multigrep


---@type function
local find_nvim_cfg = utils.find_nvim_cfg

---@type table
local OPTS = DEFAULT_KEYMAP_OPTS


---@type table
local mappings = {
    --- File---
    {{"n"}, "<leader>ffb", builtin.oldfiles, {desc = "File Browser"}},
    {{"n"}, "<leader>fff", builtin.find_files, {desc = "Find Files"}},
    {{"n"}, "<leader>ffp", builtin.oldfiles, {desc = "Prev Files"}},

    --- Buffers ---
    {{"n"}, "<leader>fbl", builtin.buffers, {desc = "Buffers"}},
    {{"n"}, "<leader>fbc", builtin.current_buffer_fuzzy_find, {desc = "Buf Content"}},

    --- NVim ---
    {{"n"}, "<leader>fvc", find_nvim_cfg, {desc = "Config"}},
    {{"n"}, "<leader>fvo", builtin.vim_options, {desc = "Options"}},

    -- Git
    {{"n"}, "<leader>fgc", builtin.git_commits, {desc = "Git commits"}},
    {{"n"}, "<leader>fgb", builtin.git_bcommits, {desc = "Git buf commits"}},
    {{"n"}, "<leader>fgs", builtin.git_status, {desc = "Git status"}},

    --- Extensions ---
    {{"n"}, "<leader>fe", ":Telescope emoji<CR>", {desc = "Emoji"}},
    {{"n"}, "<leader>fp", ":Telescope project<CR>", {desc = "Projects"}},

    --- Help ---
    {{"n"}, "<leader>fhk", builtin.keymaps, {desc = "Keymap"}},
    {{"n"}, "<leader>fht", builtin.help_tags, {desc = "Tags"}},
    {{"n"}, "<leader>fhc", builtin.commands, {desc = "Commands"}},

    --- Search ---
    {{"n"}, "<leader>fsh", builtin.search_history, {desc = "Search hist"}},

    --- Others ---
    {{"n"}, "<M-1>", builtin.diagnostics, {desc = "Diagnostics"}},  -- Pycharm habit :))
    {{"n"}, "<leader>fr", builtin.registers, {desc = "Registers"}},
    {{"n"}, "<leader>flg", live_multigrep, {desc = "Live Multigrep"}},

}

for _, mapping in pairs(mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end
