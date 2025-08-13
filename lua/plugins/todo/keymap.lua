require("utils.alias")

---@type table
local todo = require("todo-comments")


---@type table
local OPTS = DEFAULT_KEYMAP_OPTS


---@type table
local mappings = {
    {{"n"}, "<leader>C]", todo.jump_next, {desc = "Next ToDo"}},
    {{"n"}, "<leader>C[", todo.jump_prev, {desc = "Prev ToDo"}},
    {{"n"}, "<leader>Ct", ":TodoTelescope<CR>", {desc = "ToDo Telescope"}}
}


for _, mapping in pairs(mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end
