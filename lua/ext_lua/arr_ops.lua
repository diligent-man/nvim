---@param arr: table
---@param ele: string | number
---@return boolean
local function is_in(arr, ele)
    ---@type boolean
    local flag = false

    for _, v in pairs(arr) do
        if v == ele then
            flag = true
            break
        end
    end

    return flag
end


return {
    is_in = is_in
}
