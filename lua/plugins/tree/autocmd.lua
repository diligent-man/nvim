require("utils.alias")


---@type table
local utils = require("plugins.tree.utils")


---@type function
local autoclose_tab_buffer = utils.autoclose_tab_buffer


cr_aucmd(
        "WinClosed",
        {
            nested = true,
            callback = function ()
                local winnr = tonumber(expand("<amatch>"))
                schedule_wrap(autoclose_tab_buffer(winnr))
            end,

})
