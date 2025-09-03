require("utils.alias")
require("utils.constant")


---@type table
local fn_ops = require("ext_lua.fn_ops")

---@type table
local utils = require("plugins.luasnip.utils.utils")


---@type function
local partial = fn_ops.partial

---@type function
local change_choice = utils.change_choice


---@type table
local OPTS = DEFAULT_KEYMAP_OPTS


---@type table
local mappings = {
    {{"i", "s"}, "<C-l>", partial(change_choice, 1), {desc = "Next snippet (choiceNode only)"}},
    {{"i", "s"}, "<C-h>", partial(change_choice, -1), {desc = "Prev snippet (choiceNode only)"}},
}


for _, mapping in pairs(mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end
