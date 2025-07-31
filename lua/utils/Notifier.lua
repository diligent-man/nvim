---@type table
local arr_ops = require("ext_lua.arr_ops")

---@type table
local dict_ops = require("ext_lua.dict_ops")


---@type function
local is_in = arr_ops.is_in

---@type function
local get_keys = dict_ops.get_keys


---@class Notifier
---@field __opts table
---@field __level string
---@field __log_levels string | table
local Notifier = {
    __opts = {},
    __level = "WARN",
    __log_levels = get_keys(vim.log.levels, ", ", nil, "table")
}

Notifier.__index = Notifier


---@return Notifier
function Notifier.new()
    local obj = setmetatable({}, Notifier)
    return obj
end


---@param msg string
---@param level string: [TRACE| DEBUG| INFO| WARN| ERROR| OFF]. Default: WARN
---@param opts table: Default: {}
---@return void
function Notifier:notify(msg, level, opts)
    assert(msg ~= nil, "Get none msg")

    if level == nil then
        level = self.__level
    else
        level = level:upper()
        assert(is_in(self.__log_levels, level) == true,
                string.format("Invalid level. Should be in %s",
                        get_keys(vim.log.levels, ", ", nil, "string")
                )
        )
    end

    vim.notify(string.format("%s: %s", level, msg), vim.log.levels[level], opts or self.__opts)
end


return {
    Notifier = Notifier
}
