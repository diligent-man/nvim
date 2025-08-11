require("utils.alias")
require("utils.constant")


---@type table
local OPTS = DEFAULT_KEYMAP_OPTS

---@type table
local mappings = {
    {{"n"}, "<leader>tL", ":set relativenumber!<CR>", {desc = "Relative number"}},
}


for _, mapping in pairs(mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end