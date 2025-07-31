---@type table
local utils = require("utils.utils")

---@type table
local scrolling = require("utils.scrolling")


return {
    set_leader = utils.set_leader,
    make_title_str = utils.make_title_str,
    get_curr_buf_fpath = utils.get_curr_buf_fpath,
    open_help_next_tab = utils.open_help_next_tab,

    get_scrolloff = scrolling.get_scrolloff,
    get_sidescrolloff = scrolling.get_sidescrolloff,
}
