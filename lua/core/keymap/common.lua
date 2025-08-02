require("utils.alias")
require("utils.constant")


---@type table
local OPTS = DEFAULT_KEYMAP_OPTS

---@type table
local mappings = {
    --- Confirm & Autowrite were set to true as default in options
    {{"n", "v"}, "<leader>qq", ":q<CR>", {desc = "Quit"}},
    {{"n", "v"}, "<leader>qa", ":qa<CR>", {desc = "Quit all"}},
}


for _, mapping in pairs(mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end
