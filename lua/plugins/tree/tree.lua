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

            renderer = {
                indent_markers = {enable = true},

                icons =
                {
                    show = {hidden = true, modified = true}
                }
            },


            filters =
            {
                -- true for hidding dotfiles
                dotfiles = false,

                -- Excluded file to display on tree when dotfiles = true
                exclude = {".git"}
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

            --[[
            Glyphs for git status (Default). Check nvim-tree.renderer.icons.glyphs.git
                {
                  unstaged = "✗"
                  staged = "✓"
                  unmerged = ""
                  renamed = "➜"
                  untracked = "★"
                  deleted = ""
                  ignored = "◌"
                }
            --]]

            --[[
            View toggling
                1/ Toggle ignored files (by .gitignore): <S-i>
                2/ Toggle dotfiles: <S-h>
                3/ Toggle git clean (show file tracked by git): <S-c>
                4/ Toggle loaded files (file on buffer): <S-b>
                5/ Toogle bookmarked files: <S-m>
                6/ Toogle regex matched files: <S-u>
            ]]
        }
    end
}
