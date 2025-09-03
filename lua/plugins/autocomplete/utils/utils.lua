---@param cmp table
---@param index number
---@return void
local function accept(index, cmp)
    cmp.accept({index = index})
end


return {
    accept = accept
}
