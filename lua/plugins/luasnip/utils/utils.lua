---@type table
local ls = require("luasnip")


---@param idx number
---@return void
local function change_choice(idx)
    if ls.choice_active() then
        ls.change_choice(idx)
  end
end


return {
    change_choice = change_choice
}
