---@param t table
---@param val_type string
---@param sort function
---@return table | string
local function _get_dict(t, val_type, sort)
    assert(val_type == "key" or val_type == "value")
    assert(sort == true or sort == false, "Invalid sort value")

    local res = {}

    for k, v in pairs(t) do
        table.insert(res, val_type == "key" and k or v)
    end

    res = sort == true and table.sort(res) or res
    return res
end


---@param t table
---@param sort function
---@param return_as string
---@return table | string
local function get_vals(t, sort)
    sort = sort or false
    return _get_dict(t, "value", sort)
end


---@param t table
---@param sort function
---@param return_as string
---@return table | string
local function get_keys(t, sort)
    sort = sort or false
    return _get_dict(t, "key", sort)
end


return {
    get_keys = get_keys,
    get_vals = get_vals
}
