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
local function make_title_str()
    ---@type table
    sys_info = vim.uv.os_uname()

    ---@type table
    infra = {
        vim.uv.os_gethostname(),
        sys_info["sysname"],
        sys_info["version"]:match("~([0-9a-zAZ].*-%a*)")
    }

    infra = string.format("%s (%s-%s)", infra[1], infra[2], infra[3])
    abs_fname = vim.fn.expand("%:p")
    return string.format("%s --- %s", infra, abs_fname)
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
    make_title_str = make_title_str,
    get_curr_buf_fpath = get_curr_buf_fpath,
    open_help_next_tab = open_help_next_tab,
}
