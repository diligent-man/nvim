---@type StdPath
local StdPath = require("utils.StdPath").StdPath

---@type table
local persistence = require("persistence")

---@type string
local sep = require("ext_lua.os_ops").os_sep()


---@type StdPath
local std_path = StdPath.new()


return {
    {
        "folke/persistence.nvim",
        version = "v3.1.0",
        pin = true,

        event = "BufReadPre",

        opts = {
            dir = std_path.state ..  sep .. "sessions",
            need = 0
        },

        keys = {
            {"<leader>ps", function() persistence.load() end, desc = "Restore Session"},
            {"<leader>pS", function() persistence.select() end,desc = "Select Session"},
            {"<leader>pl", function() persistence.load({last = true}) end, desc = "Restore Last Session"},
            {"<leader>pd", function() persistence.stop() end, desc = "Don't Save Current Session"},
        },
    },
}
