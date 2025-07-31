---@type table
local iterator = require("ext_lua.iterator")


---@type function
local pairs_by_keys = iterator.pairs_by_keys


---@param t table
---@param sep string
---@param fn function
---@param return_as string
---@return table | string
local function get_vals(t, sep, fn, return_as)
    sep = sep or " "
    return_as = return_as or "string"
    assert(return_as == "table" or return_as == "string", "Invalid return type")

    local res = {}

    for _, val in pairs_by_keys(t, fn) do
        table.insert(res, val)
    end

    table.sort(res)

    if return_as == "string" then
        local tmp_res = res
        res = "{"

        for i, val in ipairs(tmp_res) do
            if i == 1 then
                res = res .. val
            else
                res = res .. sep .. val
            end
        end

        res = res .. "}"
    end

    return res
end


---@param t table
---@param sep string
---@param fn function
---@param return_as string
---@return table | string
local function get_keys(t, sep, fn, return_as)
    sep = sep or " "
    return_as = return_as or "string"
    assert(return_as == "table" or return_as == "string", "Invalid return type")

    local res = {}

    for key, _ in pairs_by_keys(t, fn) do
        table.insert(res, key)
    end

    if return_as == "string" then
        local tmp_res = res
        res = "{"

        for i, key in ipairs(tmp_res) do
            if i == 1 then
                res = res .. key
            else
                res = res .. sep .. key
            end
        end

        res = res .. "}"
    end

    return res
end


return {
    get_keys = get_keys,
    get_vals = get_vals
}
