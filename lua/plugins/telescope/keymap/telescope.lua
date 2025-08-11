--[[
There are 3 ways to configure/ override keymap in telescope buffer
    + telescope.defaults.mappings (expert only)
    + mappings field in telescope.setup() table or inside a given picker (e.g. find_files) (my choice)
    + As a anonymous fn in "attach_mappings" of a specific picker

We can deactivate a specific built-in keymap by setting it to false (as below) or actions.nop
]]
---@type table
local actions = require("telescope.actions")

---@type table
local layout = require("telescope.actions.layout")


---@type table
local mappings = {
    i = {
        -- Keymap to deactivate
        ["<LeftMouse>"] = actions.nop,
        ["<2-LeftMouse>"] = actions.nop,
        ["<C-n>"] = actions.nop,
        ["<C-x>"] = actions.nop,
        ["<C-v>"] = actions.nop,
        ["<C-u>"] = actions.nop,
        ["<C-d>"] = actions.nop,
        ["<C-f>"] = actions.nop,
        ["<C-k>"] = actions.nop,
        ["<C-w>"] = actions.nop,
        ["<C-_>"] = actions.nop,
        ["<Up>"] = actions.nop,
        ["<Down>"] = actions.nop,
        ["<C-r><C-w>"] = actions.nop,
        ["<C-r><C-a>"] = actions.nop,
        ["<C-r><C-f>"] = actions.nop,
        ["<C-r><C-l>"] = actions.nop,

        -- Keymap to set
        -- Preview
        ["<c-p>"] = layout.toggle_preview,
        ["<M-k>"] = actions.preview_scrolling_up,
        ["<M-j>"] = actions.preview_scrolling_down,
        --["<C-l>"] = actions.preview_scrolling_left,  -- telescope 0.2.0 (unavailable currently)
        --["<C-h>"] = actions.preview_scrolling_right, -- telescope 0.2.0 (unavailable currently)

        -- Result
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,

        ["<C-M-k>"] = actions.results_scrolling_up,
        ["<C-M-j>"] = actions.results_scrolling_down,
        --["<M-h>"] = actions.results_scrolling_left,  -- same as actions.preview_scrolling_right/ left
        --["<M-l>"] = actions.results_scrolling_right, -- same as actions.preview_scrolling_right/ left

        -- Cursor
        ["<C-Home>"] = actions.move_to_top,
        ["<C-End>"] = actions.move_to_bottom,

        -- Selection
        ["<C-s>"] = actions.toggle_all,
        ["<C-o>"] = actions.select_tab,
        ["<C-v>s"] = actions.select_vertical,
        ["<C-s>p"] = actions.select_horizontal,

        -- Misc
        ["<C-c>"] = actions.close,
        ["<C-h>"] = actions.which_key,
    },
    n = {
        -- Keymap to deactivate
        ["<LeftMouse>"] = actions.nop,
        ["<2-LeftMouse>"] = actions.nop,
        ["<C-x>"] = actions.nop,
        ["<C-v>"] = actions.nop,
        ["<C-q>"] = actions.nop,
        ["<M-q>"] = actions.nop,
        ["j"] = actions.nop,
        ["k"] = actions.nop,
        ["H"] = actions.nop,
        ["M"] = actions.nop,
        ["L"] = actions.nop,
        ["<Down>"] = actions.nop,
        ["<Up>"] = actions.nop,
        ["gg"] = actions.nop,
        ["G"] = actions.nop,
        ["<C-u>"] = actions.nop,
        ["<C-d>"] = actions.nop,
        ["<C-f>"] = actions.nop,
        ["<C-k>"] = actions.nop,
        ["<PageUp>"] = actions.nop,
        ["<PageDown>"] = actions.nop,
        ["<M-f>"] = actions.nop,
        ["<M-k>"] = actions.nop,
        ["?"] = actions.nop,

        -- Keymap to set
        -- Preview
        ["<C-p>"] = layout.toggle_preview,
        ["<c-p>"] = layout.toggle_preview,

        ["<M-k>"] = actions.preview_scrolling_up,
        ["<M-j>"] = actions.preview_scrolling_down,
        --["<C-l>"] = actions.preview_scrolling_left,  -- telescope 0.2.0 (unavailable currently)
        --["<C-h>"] = actions.preview_scrolling_right, -- telescope 0.2.0 (unavailable currently)

        -- Result
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,

        ["<C-M-k>"] = actions.results_scrolling_up,
        ["<C-M-j>"] = actions.results_scrolling_down,
        --["<M-h>"] = actions.results_scrolling_left,  -- same as actions.preview_scrolling_right/ left
        --["<M-l>"] = actions.results_scrolling_right, -- same as actions.preview_scrolling_right/ left

        -- Cursor
        ["<C-Home>"] = actions.move_to_top,
        ["<C-End>"] = actions.move_to_bottom,

        -- Selection
        ["<C-s>"] = actions.toggle_all,
        ["<C-o>"] = actions.select_tab,
        ["<C-v>s"] = actions.select_vertical,
        ["<C-s>p"] = actions.select_horizontal,

        -- Misc
        ["<C-c>"] = actions.close,
        ["<C-h>"] = actions.which_key
    }
}


return {
    mappings = mappings
}
