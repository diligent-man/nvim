require("utils.alias")
require("utils.constant")


---@type table
local OPTS = DEFAULT_KEYMAP_OPTS

---@type table
local mappings = {
    --- Confirm & Autowrite were set to true as default in options
    {{"n", "v"}, "<leader>qq", ":q<CR>", {desc = "Quit"}},
    {{"n", "v"}, "<leader>qa", ":qa<CR>", {desc = "Quit all"}},
    {{"t"}, "<Esc>", "<C-\\><C-n>", {desc = "Exit term mode"}},

    --- Line moving
    {{"n"}, "<A-k>", ":m .-2<CR>==", {desc = "Move line up"}},
    {{"n"}, "<A-j>", ":m +1<CR>==", {desc = "Move line down"}},

    {{"i"}, "<A-k>", "<ESC>:m .-2<CR>==gi", {desc = "Move line up"}},
    {{"i"}, "<A-j>", "<ESC>:m .+1<CR>==gi", {desc = "Move line down"}},

    {{"v"}, "<A-k>", ":m '<-2<CR>gv=gv", {desc = "Move line up"}},
    {{"v"}, "<A-j>", ":m '>+1<CR>gv=gv", {desc = "Move line down"}},
}


for _, mapping in pairs(mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end
