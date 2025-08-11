return {
    "nvim-lualine/lualine.nvim",
    branch = "master",
    commit = "a94fc68960665e54408fe37dcf573193c4ce82c9",
    pin = true,

    lazy = false,
    dependencies = {
        "archibate/lualine-time",
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons"
    },

    config = function()
        require("lualine").setup(
                require("plugins.lualine.cosmic").config
        )
    end
}
