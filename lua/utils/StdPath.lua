require("utils.alias")


---@return Notifier
local Notifier = require("utils.Notifier").Notifier

---@return table
local os_ops = require("ext_lua.os_ops")

---@return table
local arr_ops = require("ext_lua.arr_ops")

---@return table
local str_ops = require("ext_lua.str_ops")

---@return table
local dict_ops = require("ext_lua.dict_ops")


---@return function
local is_in = arr_ops.is_in

---@return function
local split = str_ops.split

---@return function
local os_name  = os_ops.os_name

---@return function
local get_vals = dict_ops.get_vals


---@class StdPath
---@field __notifier Notifier
---@field __paths table
local StdPath = {
    __notifier = Notifier.new(),

    __paths = {
        "state", "cache", "log",
        "config", "data", "run",
        "config_dirs", "data_dirs"
    }
}


---@field self self
---@field key string
---@return string
StdPath.__index = function (self, key)
    ---@type table
    local _paths = getmetatable(self).__paths

    print()

    assert(is_in(_paths, key) == true,
    string.format("Attr should be in %s. Get \"%s\" instead", get_vals(_paths, true, ", "), key)
    )

    if key == "config_dirs" or key == "data_dirs" then
        local prompt = string.format("Additional \"%s\"",
                    string.gsub(key, "_", " "))

        if os_name() == "win" then
            prompt = prompt .. "in Windows in not applicable"
            error(prompt)
        else
            for _, word in pairs(split(key, "_")) do
                prompt = prompt .. " MUST be changed to " .. string.format("\"%s\" by stdpath(\"%s\")", word, word)
                break
            end

            getmetatable(self).__notifier:notify(prompt, "WARN")
            key = split(key, "_")[1]
        end
    end
    return stdpath(key)
    end


---@return StdPath
function StdPath.new()
    local obj = setmetatable({}, StdPath)
    return obj
end


return {
    StdPath = StdPath
}
