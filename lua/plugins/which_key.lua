return {
    "folke/which-key.nvim",

    version = "v3.17.0",
    pin = true,

    dependencies = {"echasnovski/mini.icons", version = "*"},
    event = "VeryLazy",

    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    }
}
