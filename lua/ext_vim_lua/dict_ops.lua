require("utils.alias")


---@param t table
---@param val_type string
---@param sort function
---@param return_as string
---@return table | string
local function _get_dict(t, val_type, sort, return_as)
    assert(val_type == "key" or val_type == "value")
    assert(sort == true or sort == false, "Invalid sort value")
    assert(return_as == "table" or return_as == "string", "Invalid return type")

    res = val_type == "key" and tbl_keys(t) or tbl_values(t)
    res = sort == true and table.sort(res) or res
    res = return_as == "string" and json.encode(res) or res

    return res
end


---@param t table
---@param sort function
---@param return_as string
---@return table | string
local function get_keys(t, sort, return_as)
    sort = sort or false
    return_as = return_as or "table"

    return _get_dict(t, "key", sort, return_as)
end


---@param t table
---@param sort function
---@param return_as string
---@return table | string
local function get_vals(t, sort, return_as)
    sort = sort or false
    return_as = return_as or "table"

    return _get_dict(t, "value", sort, return_as)
end


return {
    get_keys = get_keys,
    get_vals = get_vals
}
