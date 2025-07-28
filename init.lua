local LUA_PATH = os.getenv("LUA_PATH")

if LUA_PATH ~= nil then
    package.path = package.path .. ";" .. LUA_PATH
end


require("plugin_manager")
require("core")
