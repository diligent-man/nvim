--[[
Some extensions check later
    1/ https://github.com/sudormrfbin/cheatsheet.nvim (cmd)
    2/ https://github.com/AckslD/nvim-neoclip.lua (clipboard)
    3/ https://github.com/debugloop/telescope-undo.nvim

There are 3 ways to configure/ override keymap in telescope buffer
    + telescope.defaults.mappings (expert only)
    + mappings field in telescope.setup() table or inside a given picker (e.g. find_files) (my choice)
    + As a anonymous fn in "attach_mappings" of a specific picker

We can deactivate a specific built-in keymap by setting it to false (as below) or actions.nop
]]


require("utils.alias")


---@type table
local default_setup = require("plugins.telescope.utils.default_setup").default_setup


return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    version = "v0.1.8",
    pin = true,

    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            commit = "1f08ed60cafc8f6168b72b80be2b2ea149813e55",
            build = "make",
            pin = true
        },
        {
            "xiyaowong/telescope-emoji.nvim",
            commit = "86248d97be84a1ce83f0541500ef9edc99ea2aa1",
            pin = true

        },
        {
            "nvim-telescope/telescope-project.nvim",
            commit = "8e11df94419e444601c09828dadf70890484e443",
            pin = true
        },
        {
            "nvim-telescope/telescope-file-browser.nvim"
        }
    },

    config = function ()
        require("plugins.telescope.keymap.nvim")

        ---@type table
        local telescope = require("telescope")

        ---@type table
        local state = require("telescope.actions.state")

        ---@type table
        local project_actions = require("telescope._extensions.project.actions")

        ---@type table
        local utils = require("plugins.telescope.utils.utils")


        ---@type table
        local mappings = require("plugins.telescope.keymap.telescope").mappings


        ---@type function
        local get_src_root = utils.get_src_root

        ---@type function
        local open_proj_in_new_tab = utils.open_proj_in_new_tab


        ---@type table
        --local project_utils = require("telescope._extensions.project.utils")

        ----------------------------------------------------------------------------------------------------------------

        ---@type table
        local emoji = {
            action = function(emoji)
                -- argument emoji is a table.
                -- {name="", value="", cagegory="", description=""}
                setreg("*", emoji.value)
                vi_put({emoji.value}, "c", false, true)
            end,
        }

        ---@type table
        local fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }

        ---@type
        local project = {
            order_by = "asc",
            --theme = "dropdown",
            search_by = {"title", "path"},
            hidden_files = true,
            sync_with_nvim_tree = true,
            ignore_missing_dirs = true,

            base_dirs = {
                {path = get_src_root(), max_depth = 99},
            },

            on_project_selected = function(prompt_bufnr)
                ---@type table
                local picker = state.get_current_picker(prompt_bufnr)

                if #picker:get_multi_selection() > 0 then
                    for _, entry in pairs(picker:get_multi_selection()) do
                        open_proj_in_new_tab(entry.path, true)
                    end
                else
                    ---@type string
                    local proj_path = state.get_selected_entry(prompt_bufnr).value
                    open_proj_in_new_tab(proj_path, true)
                end
            end,

            mappings = {
                n = {
                    ["c"] = false,
                    ["d"] = false,
                    ["r"] = false,
                    ["C"] = false,
                    ["f"] = false,
                    ["w"] = false,
                    ["o"] = false,

                    ["<C-b>"] = project_actions.browse_project_files,  -- check telescope-file-browser.nvim for more info
                    ["<C-r>"] = project_actions.recent_project_files,
                    ["<C-s>"] = project_actions.search_in_project_files,  -- live grep
                },
                i = {
                    ["<c-d>"] = false,
                    ["<c-v>"] = false,
                    ["<c-a>"] = false,
                    ["<c-A>"] = false,
                    ["<c-f>"] = false,
                    ["<c-l>"] = false,
                    ["<c-o>"] = false,

                    ["<C-b>"] = project_actions.browse_project_files,  -- check telescope-file-browser.nvim for more info
                    ["<C-r>"] = project_actions.recent_project_files,
                    ["<C-s>"] = project_actions.search_in_project_files,  -- live grep
                }
            }
        }
        ----------------------------------------------------------------------------------------------------------------

        telescope.setup({
            defaults = deep_extend("error", default_setup, {mappings = mappings}),

            pickers = {},

            -- Full list at https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
            extensions = {
                emoji = emoji,
                fzf = fzf,
                project = project
            }
        })

        telescope.load_extension("fzf")
        telescope.load_extension("emoji")
        telescope.load_extension("project")
        telescope.load_extension("file_browser")
    end
}
