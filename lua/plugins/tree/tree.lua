return {
    "nvim-tree/nvim-tree.lua",
    branch = "master",
    version = "1.13.0",
    pin = true,

    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},

    config = function()
        require("nvim-tree").
        setup
        {
            view = {width = 30, relativenumber = false},
            renderer = {indent_markers = {enable = true}},

            sort = {sorter = "case_sensitive"},

            filters = {dotfiles = false},
            git = {ignore = false},

            actions =
            {
                open_file = {window_picker = {enable = true}}
            },
        }
    end
}
