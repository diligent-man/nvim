require("utils.alias")
require("utils.constant")


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
            on_attach = require("plugins.tree.keymap").on_attach,

            hijack_cursor = true,  -- keep caret at first chr
            respect_buf_cwd = false,  -- automatically return cwd when close tree

            -- These for "nvim-telescope/telescope-project.nvim"
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true
            },

            view = {
                width = 30,
                relativenumber = false,
                centralize_selection = true,
                side = "left",

            },

            renderer = {
                indent_markers = {enable = true},
                highlight_git = "all",  -- color group NvimTreeGit*HL (set later)
                highlight_opened_files = "name",  -- color group NvimTreeOpenedHL (set later)

                icons =
                {
                    show = {hidden = true, modified = true},

                }
            },

            filters =
            {
                -- true for hidding dotfiles
                dotfiles = true,

                -- Excluded file to display on tree when dotfiles = true
                --exclude = {".gitignore", ".env*", ".dockerfile"}
            },

            git =
            {
                -- show file ignored by .gitignore
                ignore = true
            },


            sort = {sorter = "case_sensitive"},

            actions =
            {
                open_file =
                {
                    -- Allow to pick window when select other files
                    window_picker = {enable = true}
                }
            },

            actions =
            {
                change_dir = {restrict_above_cwd = false},  -- due to "nvim-telescope/telescope-project.nvim"
                expand_all = {exclude = {".git", "target", "build"}},
                open_file = {window_picker = {chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"}}
            },

            tab=
            {
                sync = {open = true, close = true},
            }
        }
    end
}
