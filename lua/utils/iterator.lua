---@param t table
---@param fn function
---@return function
local function pairs_by_keys(t, fn)
    local copied_t = {}

    for e in pairs(t) do
        table.insert(copied_t, e)
    end

    table.sort(copied_t, fn)
    local i = 0

    local iter = function ()
        i = i + 1
        if copied_t[i] == nil then
            return nil
        else
            return copied_t[i], t[copied_t[i]]
        end
    end

    return iter
end


return {
    pairs_by_keys = pairs_by_keys
}
