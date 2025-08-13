--[[
Note:
    1/ Ctrl, Shift, Alt (Meta), Win (Super) are modifiers keymap that allows us to press other keys simultaneously.
    2/ Leader key ("space" on my keymap) is a term in Nvim parlance, which solely allows us to press key one by one.
    3/ When remap available keymap to another, the previous keymap will be disabled. Thus, there is no need to set it to <Nop>
    4/ Dont't forget to add <CR>, which is equivalent to "pressing Enter", to command.
    5/ Col effect: Prioritize win in the similar col
    6/ Number allowed: Allow preceded number prior to keymap
    7/ Disabled keymaps were referenced from ":help windows"
]]

require("utils.alias")
require("utils.constant")


---@type table
local OPTS = DEFAULT_KEYMAP_OPTS

---@type table
local mappings = {
    --- Opening/ Closing ---
    {{"n"}, "<leader>wvs", ":vs<CR>", {desc = "Vsplit"}},  -- number allowed (split with specified row)
    {{"n"}, "<leader>wv<S-s>", ":vs", {desc = "Vsplit fnew"}},  -- Vsplit with entered new fname. Number allowed (//)

    {{"n"}, "<leader>wsp", ":sp<CR>", {desc = "Hsplit"}},  -- number allowed (split with specified col)
    {{"n"}, "<leader>ws<S-p>", ":sp", {desc = "Hsplit fnew"}},  -- Hsplit with entered new fname. Number allowed (//)

    {{"n"}, "<leader>wo", "<C-w>o", {desc = "Close all except current"}},  -- Hsplit with entered new fname


    --- Focusing ---
    -- number allowed (move n-th wins). Tips: 999 <leader>w<Left> for the leftmost win
    {{"n"}, "<leader>w<Left>", "<C-w>h", {desc = "Focus left"}},
    {{"n"}, "<leader>wh", "<C-w>h", {desc = "Focus left"}},

    -- number allowed (//). Tips: 999 <leader>w<Right> for the rightmost win
    {{"n"}, "<leader>w<Right>", "<C-w>l", {desc = "Focus right"}},
    {{"n"}, "<leader>wl", "<C-w>l", {desc = "Focus right"}},

    -- number allowed (//). Tips: 999 <leader>w<Down> for the bottommost win
    {{"n"}, "<leader>w<Down>", "<C-w>j", {desc = "Focus down"}},
    {{"n"}, "<leader>wj", "<C-w>j", {desc = "Focus down"}},

    -- number allowed (//). Tips: 999 <leader>w<Up> for the topmost win
    {{"n"}, "<leader>w<Up>", "<C-w>k", {desc = "Focus up"}},
    {{"n"}, "<leader>wk", "<C-w>k", {desc = "Focus up"}},

    {{"n"}, "<leader>wt", "<C-w>t", {desc = "Focus top-left"}},
    {{"n"}, "<leader>wb", "<C-w>b", {desc = "Focus bottom-right"}},


    --- Moving ---
    {{"n"}, "<leader>w<M-r>", "<C-w>r", {desc = "Rot right"}},  -- col effect
    {{"n"}, "<leader>w<M-S-r>", "<C-w><S-r>", {desc = "Rot left"}},  -- col effect

    -- Swap with Nth win (counting from 1). Col effect. Number allowed
    {{"n"}, "<leader>wx", "<C-w>x", {desc = "Win swap"}}, --

    {{"n"}, "<leader>w<S-h>", "<C-w><S-h>", {desc = "Mov win far left"}},
    {{"n"}, "<leader>w<S-l>", "<C-w><S-l>", {desc = "Mov win far right"}},

    {{"n"}, "<leader>w<S-j>", "<C-w><S-j>", {desc = "Mov win bottom"}},
    {{"n"}, "<leader>w<S-k>", "<C-w><S-k>", {desc = "Mov win top"}},

    {{"n"}, "<leader>w<S-t>", "<C-w><S-t>", {desc = "Mov new tab"}},


    --- Resizing ---
    {{"n"}, "<leader>wre", "<C-w>=", {desc = "Equal"}},
    {{"n"}, "<leader>wr_", "<C-w>_", {desc = "Full height"}},
    {{"n"}, "<leader>wr|", "<C-w>|", {desc = "Full width"}},

    -- Top origin (check moving direction later)
    {{"n"}, "<C-M-j>", "<C-w>-", {desc = "Dec height"}},
    {{"n"}, "<C-M-k>", "<C-w>+", {desc = "Inc height"}},

    -- Left origin (check moving direction later)
    {{"n"}, "<C-M-h>", "<C-w><", {desc = "Dec width"}},
    {{"n"}, "<C-M-l>", "<C-w>>", {desc = "Inc width"}},
}


---@type table
local disabled_mappings = {
    "<C-w>+",
    "<C-w>-",
    "<C-w><",
    "<C-w>=",
    "<C-w>>",
    "<C-w>H",
    "<C-w>J",
    "<C-w>K",
    "<C-w>L",
    "<C-w>P",
    "<C-w>R",
    "<C-w>S",
    "<C-w>T",
    "<C-w>W",
    "<C-w>]",
    "<C-w>^",
    "<C-w>_",
    "<C-w>b",
    "<C-w>c",
    "<C-w>d",
    "<C-w>f",
    "<C-w>F",
    "<C-w>g<C-]>",
    "<C-w>g]",
    "<C-w>g}",
    "<C-w>gf",
    "<C-w>gF",
    "<C-w>gt",
    "<C-w>gT",
    "<C-w>g<Tab>",
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
    "<C-w>|",
    "<C-w>}",
    "<C-w><Down>",
    "<C-w><Up>",
    "<C-w><Left>",
    "<C-w><Right>"
}

---@type table
local disabled_mappings_withvariant = {
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
    keymap("n", mapping, "<NOP>")
end


for _, mapping in pairs(disabled_mappings_withvariant) do
    local first_part, second_part = mapping:sub(1, -2), mapping:sub(-1)
    local variant_mapping = string.format("%s<C-%s>", first_part, second_part)

    keymap("n", mapping, "<NOP>")
    keymap("n", variant_mapping, "<NOP>")
end
