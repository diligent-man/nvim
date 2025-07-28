local StdPath = require("utils.StdPath")
local Notifier = require("utils.Notifier")

local utils = require("utils.utils")

local os_ops = require("utils.os_ops")
local str_ops = require("utils.str_ops")
local arr_ops = require("utils.arr_ops")
local dict_ops = require("utils.dict_ops")


---@type table
return {
    StdPath = StdPath.StdPath,
    Notifier = Notifier.Notifier,

    pairs_by_keys = utils.pairs_by_keys,
    make_title_str = utils.make_title_str,
    get_curr_buf_fpath = utils.get_curr_buf_fpath,
    open_help_next_tab = utils.open_help_next_tab,

    os_sep = os_ops.os_sep,
    os_ops = os_ops.os_name,

    split = str_ops.split,
    capitalize = str_ops.capitalize,

    is_in = arr_ops.is_in,

    get_keys = dict_ops.get_keys,
    get_vals = dict_ops.get_vals,
}
