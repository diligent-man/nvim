require("utils.alias")
require("utils.constant")


---@param leader string
---@param new_leader_val string
---@param new_local_leader_val string
---@return void
function set_leader(leader, new_leader_val, new_local_leader_val)
    leader = leader or "<Space>"
    new_leader_val = new_leader_val or " "
    new_local_leader_val = new_local_leader_val or "\\"

    -- reset mapleader
    set_keymap("", leader, "<Nop>", DEFAULT_KEYMAP_OPTS)

    -- set new val
    g.mapleader = new_leader_val
    g.maplocalleader = new_local_leader_val

    _G["IS_LEADER_MAP"] = true
end


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
    set_leader = set_leader,
    pairs_by_keys = pairs_by_keys,
    make_title_str = make_title_str,
    get_curr_buf_fpath = get_curr_buf_fpath,
    open_help_next_tab = open_help_next_tab,
}
