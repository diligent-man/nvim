require("utils.alias")
require("utils.constant")


---@type table
local builtin = require("telescope.builtin")

---@type table
local live_multigrep = require("plugins.telescope.utils.multigrep").live_multigrep

---@type table
local OPTS = DEFAULT_KEYMAP_OPTS



---@type table
local mappings = {
    --- File pickers ---
    {{"n"}, "<leader>ff", builtin.find_files, {desc = "Files"}},
    {{"n"}, "<leader>flg", live_multigrep, {desc = "Live Multigrep"}},

    --- Vim pickers ---
    {{"n"}, "<leader>fb", builtin.buffers, {desc = "Buffers"}},
    {{"n"}, "<leader>fo", builtin.oldfiles, {desc = "Prev files"}},
    {{"n"}, "<leader>fa", builtin.oldfiles, {desc = "Built-in functionalities"}},
    {{"n"}, "<leader>fsh", builtin.search_history, {desc = "Search hist"}},
    {{"n"}, "<leader>fht", builtin.help_tags, {desc = "Help Tags"}},
    {{"n"}, "<leader>fvo", builtin.vim_options, {desc = "Vi Opts"}},
    {{"n"}, "<leader>fcl", builtin.registers, {desc = "Clipboard"}},
    {{"n"}, "<leader>fkm", builtin.keymaps, {desc = "Keymap"}},
    {{"n"}, "<leader>fcb", builtin.current_buffer_fuzzy_find, {desc = "Cur Buf Find"}},

    -- Git
    {{"n"}, "<leader>fgc", builtin.git_commits, {desc = "Git commits"}},
    {{"n"}, "<leader>fgb", builtin.git_bcommits, {desc = "Git buf commits"}},
    {{"n"}, "<leader>fgs", builtin.git_status, {desc = "Git status"}},

    {{"n"}, "<M-1>", builtin.diagnostics, {desc = "Diagnostics"}},

    -- Extension
    {{"n"}, "<leader>fe", ":Telescope emoji<CR>", {desc = "Emoji"}},
}

for _, mapping in pairs(mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end
