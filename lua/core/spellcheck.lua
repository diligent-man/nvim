--[[
This script does not take ane effect at all :)))
]]
require("lfs")
require("utils.alias")


---@type table
local os_ops = require("ext_lua.os_ops")


---@type string
local os_sep = os_ops.os_sep()

---@type string
local HOME = os.getenv("HOME")

---@type string
local SPELL_PATH = VIMRUNTIME .. os_sep .. "spell"


for fname in lfs.dir(SPELL_PATH) do
    if fname:match(".spl$") ~= nil then
        ---@type string
        local src = SPELL_PATH .. os_sep .. fname

        ---@type string
        local dst = HOME .. os_sep .. ".vim" -- .. os_sep .. "spell"

        lfs.mkdir(dst)

        dst = dst .. os_sep .. "spell"
        lfs.mkdir(dst)

        dst = dst .. os_sep .. fname
        lfs.link(src, dst, true)
    end
end
