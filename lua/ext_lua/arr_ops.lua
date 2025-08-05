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


---@param arr table
---@return table
local function reverse(arr)
    ---@type table
    local reversed = {}

    for i = #arr, 1, -1 do
        table.insert(reversed, arr[i])
    end

    return reversed
end


---@param arr table
---@return table
local function shuffle(arr)
    ---@type number
    local n = #arr

    while n > 1 do
        local k = math.random(n)
        arr[n], arr[k] = arr[k], arr[n]
        n = n - 1
    end

    return arr
end


-- ref: https://devforum.roblox.com/t/unpacking-multiple-tables-into-a-bigger-table-has-unexpected-behavior/1535219
---@param ... table
---@return table
local function merge(...)
    local Output = {}
    local i = 1

    for _, list in ipairs({...}) do
        for _, item in ipairs(list) do
            table.insert(Output, i, item)
            i = i + 1
        end
    end
    return Output
end


return {
    is_in = is_in,
    reverse = reverse,
    shuffle = shuffle,
    merge = merge
}
