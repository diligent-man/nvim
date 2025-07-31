require("utils.alias")


---@type table
local utils = require("utils")


---@type function
local open_help_next_tab = utils.open_help_next_tab


------------------------------------------------------------------------------------------------------------------------


--[[
cr_usr_cmd(
        'SayHello',
        'echo "Hello world!"',
        {
            bang = true
            desc = "Example usr-defined cmd that executes CLI command"
        }
)
]]

------------------------------------------------------------------------------------------------------------------------


cr_usr_cmd(
        "H",
        open_help_next_tab,
        {
            nargs = '?',         -- Allows zero or one argument (the help topic)
            complete = 'help',   -- Enables tab completion for help topics
            desc = 'Open help in a new tab' -- Description for the command
        }
)
