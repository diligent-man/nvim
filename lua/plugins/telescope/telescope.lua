--[[
Some extensions check later
    1/ https://github.com/sudormrfbin/cheatsheet.nvim (cmd)
    2/ https://github.com/AckslD/nvim-neoclip.lua (clipboard)
]]
return {
    'nvim-telescope/telescope.nvim',
    branch = "master",
    version = "0.1.8",
    pin = true,

    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "telescope-fzf-native.nvim",
            commit = "1f08ed60cafc8f6168b72b80be2b2ea149813e55",
            build = "make",
            pin = true
        },
        {
            "xiyaowong/telescope-emoji.nvim",
            commit = "86248d97be84a1ce83f0541500ef9edc99ea2aa1",
            pin = true

        }
    },

    config = function ()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-h>"] = "which_key"
                    }
                }
            },
            pickers = {
                find_files = {
                    theme = "ivy"
                }
            },

            -- Full list at https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
            extensions = {
                -- nvim-telescope/telescope-fzf-native.nvim
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                     -- the default case_mode is "smart_case"
                },
                emoji = {
                    action = function(emoji)
                        -- argument emoji is a table.
                        -- {name="", value="", cagegory="", description=""}
                        setreg("*", emoji.value)
                        nvim_put({emoji.value}, 'c', false, true)
                    end,
                },


            }
        })
        telescope.load_extension("fzf")
        telescope.load_extension("emoji")
end
}
