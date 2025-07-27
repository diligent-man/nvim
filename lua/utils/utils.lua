require("utils.alias")


---@param inp_table table
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


---@return string
local function get_curr_buf_fpath()
    return api.nvim_buf_get_name(0)
end


---@param args table
---@return void
local function open_help_next_tab(args)
    local topic = ""

    if args and args.args then
        topic = args.args
    end

    vicmd("tab help " .. topic)
end


return {
    pairs_by_keys = pairs_by_keys,
    get_curr_buf_fpath = get_curr_buf_fpath,
    open_help_next_tab = open_help_next_tab,
}
