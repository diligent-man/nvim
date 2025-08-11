--[[
TODO: Make completion select by Tab not arrow
TODO: Rename with current buffer instead of all files
TODO: How to exit lsp signature ?
]]
require("utils.alias")
require("utils.constant")


---@type table
local OPTS = DEFAULT_KEYMAP_OPTS

---@type table
local mappings = {
    --- Mason
    {{"n"}, "<leader>mam", ":Mason<CR>", {desc = "Menu"}},

    --- LSP
    {{"i"}, "<C-Space>", function() lsp.completion.get() end, {desc = "Autocomplete"}},
}


for _, mapping in pairs(mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end
