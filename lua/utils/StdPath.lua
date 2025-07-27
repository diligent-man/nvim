local os_ops = require(".utils.alias")
local os_ops = require(".utils.os_ops")
local arr_ops = require(".utils.arr_ops")
local str_ops = require(".utils.str_ops")
local dict_ops = require(".utils.dict_ops")

local Notifier = require(".utils.Notifier").Notifier


local is_in = arr_ops.is_in
local split = str_ops.split
local os_name  = os_ops.os_name
local get_vals = dict_ops.get_vals


local StdPath = {
    __notifier = Notifier.new(),

    __paths = {
        "config", "data", "run",
        "state", "cache", "log",
        "config_dirs", "data_dirs"
    }
}


StdPath.__index = function (self, key)
    ---@type table
    local _paths = getmetatable(self).__paths

    print()

    assert(is_in(_paths, key) == true,
    string.format("Attr should be in %s. Get \"%s\" instead", get_vals(_paths, ", "), key)
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
    return fn.stdpath(key)
    end


---@return table
function StdPath.new()
    local obj = setmetatable({}, StdPath)
    return obj
end


return {
    StdPath = StdPath
}
