require("utils.alias")
require("utils.constant")


--[[
Note:
    1/ Ctrl, Shift, Alt (Meta), Win (Super) are modifiers keymap that allows us to press other keys simultaneously.
    2/ Leader key ("space" on my keymap) is a term in Nvim parlance, which solely allows us to press key one by one.
    3/ When remap available keymap to another, the previous keymap will be disabled. Thus, there is no need to set it to <Nop>
    4/ Dont't forget to add <CR>, which is equivalent to "pressing Enter", to command.

]]

---@type table
local OPTS = DEFAULT_KEYMAP_OPTS

---@type table
local mappings = {
    --- Resizing ---
    {{"n"}, "<leader>se", "<C-w>=", {desc = "Split equally"}},

    -- Top origin (check moving direction later)
    {{"n"}, "<C-M-j>", "<C-w>-", {desc = "Dec height"}},
    {{"n"}, "<C-M-k>", "<C-w>+", {desc = "Inc height"}},

    -- Left origin (check moving direction later)
    {{"n"}, "<C-M-h>", "<C-w><", {desc = "Dec width"}},
    {{"n"}, "<C-M-l>", "<C-w>>", {desc = "Inc width"}},

    {{"n"}, "<leader>wfh", "<C-w>_", {desc = "Full height"}},
    {{"n"}, "<leader>wfw", "<C-w>|", {desc = "Full width"}},

    {{"n"}, "<leader>w<Left>", "<C-w>h", {desc = "Left win"}},

    --- Splitting ---
    {{"n"}, "<leader>wv", ":vs<CR>", {desc = "Vsplit"}},
    {{"n"}, "<leader>wh", ":sp<CR>", {desc = "Hsplit"}},
}


---@type table
local disabled_mappings = {
    "<C-w>b",
    "<C-w>c",
    "<C-w>d",
    "<C-w>f",
    "<C-w>g",
    "<C-w>h",
    "<C-w>i",
    "<C-w>j",
    "<C-w>k",
    "<C-w>l",
    "<C-w>n",
    "<C-w>o",
    "<C-w>p",
    "<C-w>q",
    "<C-w>r",
    "<C-w>s",
    "<C-w>t",
    "<C-w>v",
    "<C-w>w",
    "<C-w>x",
    "<C-w>z",
    "<C-w>]",
    "<C-w>^",
    "<C-w>_",
}


for _, mapping in pairs(mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end


for _, mapping in pairs(disabled_mappings) do
    local first_part, second_part = mapping:sub(1, -2), mapping:sub(-1)
    local variant_mapping = string.format("%s<C-%s>", first_part, second_part)

    keymap("n", mapping, "<NOP>")
    keymap("n", variant_mapping, "<NOP>")
end
