require("utils.alias")
require("utils.constant")


---@type Notifier
local Notifier = require("utils.Notifier").Notifier


---@type Notifier
local notifier = Notifier.new()


---@param leader string
---@param new_leader_val string
---@param new_local_leader_val string
---@return void
local function set_leader(leader, new_leader_val, new_local_leader_val)
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


---@return string
local function make_title_str()
    ---@type table
    sys_info = os_uname()

    ---@type table
    infra = {
        os_gethostname(),
        sys_info["sysname"],
        sys_info["version"]:match("~([0-9a-zAZ].*-%a*)")
    }

    infra = string.format("%s (%s-%s)", infra[1], infra[2], infra[3])
    abs_fname = expand("%:p")
    return string.format("%s --- %s", infra, abs_fname)
end


---@return string
local function get_curr_buf_fpath()
    return buf_get_name(0)
end


---@param arg string
---@return void
local function open_help_next_tab(arg)
    -- Priority: Nvim user-defined cmd called > Directly called
    local topic = arg.args or arg or ""

    if topic:len() == 0 then
       notifier:notify("Get empty topic for help redirect to help.txt", "WARN", {"open_help_next_tab"})
    end

    vicmd("tab help " .. topic)
end


return {
    set_leader = set_leader,
    make_title_str = make_title_str,
    get_curr_buf_fpath = get_curr_buf_fpath,
    open_help_next_tab = open_help_next_tab
}
