return {
    "folke/which-key.nvim",

    version = "v3.17.0",
    pin = true,

    dependencies = {"echasnovski/mini.icons", version = "*"},
    event = "VeryLazy",

    opts = {
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
                {plugin = "nvim-tree.lua", pattern = "explorer", icon = "󰙅", color="yellow"}
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
