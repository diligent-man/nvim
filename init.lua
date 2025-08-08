local LUA_PATH = os.getenv("LUA_PATH")

if LUA_PATH ~= nil then
    package.path = package.path .. ";" .. LUA_PATH
end

_G["IS_LEADER_MAP"] = false

require("utils.PluginManager")
require('core')
