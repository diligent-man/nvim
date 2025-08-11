require("utils.alias")
require("utils.constant")

---@type table
local telescope_builtin = require("telescope.builtin")

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
    --- File pickers ---
    {{"n"}, "<leader>ff", telescope_builtin.find_files, {desc = "Files"}},
    {{"n"}, "<leader>flg", live_multigrep, {desc = "Live Multigrep"}},

    --- Vim pickers ---
    {{"n"}, "<leader>fb", telescope_builtin.buffers, {desc = "Buffers"}},
    {{"n"}, "<leader>fo", telescope_builtin.oldfiles, {desc = "Prev files"}},
    {{"n"}, "<leader>fa", telescope_builtin.oldfiles, {desc = "Built-in functionalities"}},
    {{"n"}, "<leader>fsh", telescope_builtin.search_history, {desc = "Search hist"}},
    {{"n"}, "<leader>fht", telescope_builtin.help_tags, {desc = "Help Tags"}},
    {{"n"}, "<leader>fvo", telescope_builtin.vim_options, {desc = "Vi Opts"}},
    {{"n"}, "<leader>fcl", telescope_builtin.registers, {desc = "Clipboard"}},
    {{"n"}, "<leader>fkm", telescope_builtin.keymaps, {desc = "Keymap"}},
    {{"n"}, "<leader>fcb", telescope_builtin.current_buffer_fuzzy_find, {desc = "Cur Buf Find"}},

    -- Git
    {{"n"}, "<leader>fgc", telescope_builtin.git_commits, {desc = "Git commits"}},
    {{"n"}, "<leader>fgb", telescope_builtin.git_bcommits, {desc = "Git buf commits"}},
    {{"n"}, "<leader>fgs", telescope_builtin.git_status, {desc = "Git status"}},

    {{"n"}, "<M-1>", telescope_builtin.diagnostics, {desc = "Diagnostics"}},
}


for _, mapping in pairs(mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end
