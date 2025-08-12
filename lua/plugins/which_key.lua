require("utils.alias")

-- In conjunction with core/keymap/windows to completely disable built-in commands for <C-w>
keymap("n", "<C-w>", "NOP")

return {
    "folke/which-key.nvim",

    version = "v3.17.0",
    pin = true,

    dependencies = {"echasnovski/mini.icons", version = "*"},
    event = "VeryLazy",

    opts = {
        preset = "classic",
        delay = 0,

        plugins = {
            presets = {
                windows = false,
                nav = true,
                z = true,
                g = true
            }
        },

        win =
        {
            wo = {
                -- value between 0-100 0 for fully opaque and 100 for fully transparent
                winblend = 0
            }
        },

        layout = {spacing = 1},
        keys = {scroll_down = "<c-j>", scroll_up = "<c-k>"},
        icons =
        {
            rules =
            {
                -- normal case for pattern
                {pattern = "buffer", icon = "", color="orange"},
                {pattern = "emoji", icon = "😀", color="yellow"},
                {pattern = "nvim", icon = "", color="green"},
                {pattern = "help", icon = "󰋖", color="purple"},
                {pattern = "command", icon = "</>", color="silver"},

                {pattern = "register", icon = "📋", color="white"},
                {pattern = "project", icon = "📚", color="lightred"},
                {plugin = "nvim-tree.lua", pattern = "explorer", icon = "󰙅", color="yellow"},
            }
        }
    },

    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({global = false})
            end,
            desc = "Sample",
        },
    }
}
