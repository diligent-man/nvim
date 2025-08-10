---@type table
local persistence = require("persistence")


return {
    {
        "folke/persistence.nvim",
        version = "v3.1.0",
        pin = true,

        event = "BufReadPre",

        opts = {},

        keys = {
            {"<leader>ps", function() persistence.load() end, desc = "Restore Session"},
            {"<leader>pS", function() persistence.select() end,desc = "Select Session"},
            {"<leader>pl", function() persistence.load({last = true}) end, desc = "Restore Last Session"},
            {"<leader>pd", function() persistence.stop() end, desc = "Don't Save Current Session"},
        },
    },
}
