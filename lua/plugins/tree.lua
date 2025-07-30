return {
    "nvim-tree/nvim-tree.lua",
    branch = "master",
    version = "1.13.0",
    pin = true,

    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},

    config = function()
        require("nvim-tree").setup {}
    end
}
