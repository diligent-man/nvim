---@param t table
---@param val_type string
---@param sort function
---@param sep string
---@param return_as string
---@return table | string
local function _get_dict(t, val_type, sort, sep, return_as)
    assert(val_type == "key" or val_type == "value")
    assert(sort == true or sort == false, "Invalid sort value")
    assert(return_as == "table" or return_as == "string", "Invalid return type")

    local res = {}

    for k, v in pairs(t) do
        table.insert(res, val_type == "key" and k or v)
    end

    if sort then
        table.sort(res)
    end

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
---@param sort function
---@param sep string
---@param return_as string
---@return table | string
local function get_vals(t, sort, sep, return_as)
    sort = sort or false
    sep = sep or " "
    return_as = return_as or "table"

    return _get_dict(t, "value", sort, sep, return_as)
end


---@param t table
---@param sort function
---@param sep string
---@param return_as string
---@return table | string
local function get_keys(t, sort, sep, return_as)
    sort = sort or false
    sep = sep or " "
    return_as = return_as or "table"

    return _get_dict(t, "key", sort, sep, return_as)
end


return {
    get_keys = get_keys,
    get_vals = get_vals
}
