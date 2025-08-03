---@type table
local persistence = require("persistence")


return {
    -- Session management. This saves your session in the background,
    -- keeping track of open buffers, window arrangement, and more.
    -- You can restore sessions when returning through the dashboard.
    {
        "folke/persistence.nvim",

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