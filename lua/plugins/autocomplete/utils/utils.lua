---@param cmp table
---@param index number
---@return void
local function accpet(cmp, index)
    cmp.accept({index = index})
end


return {
    accpet = accpet
}
