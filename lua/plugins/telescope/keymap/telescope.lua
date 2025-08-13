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
        ["<C-r><C-w>"] = actions.nop,
        ["<C-r><C-a>"] = actions.nop,
        ["<C-r><C-f>"] = actions.nop,
        ["<C-r><C-l>"] = actions.nop,

        -- Keymap to set
        -- Preview
        ["<c-p>"] = layout.toggle_preview,

        -- actions.preview_scrolling_left/ right are unavailable till v0.2.0
        ["<M-j>"] = actions.cycle_previewers_next,
        ["<M-k>"] = actions.cycle_previewers_prev,

        ["<M-h>"] = actions.preview_scrolling_down,
        ["<M-l>"] = actions.preview_scrolling_up,

        -- Result
        -- actions.results_scrolling_left/ right are unavailable till v0.2.0
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-h>"] = actions.results_scrolling_down,
        ["<C-l>"] = actions.results_scrolling_up,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

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
        ["<C-M-h>"] = actions.which_key,
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
        ["<c-p>"] = layout.toggle_preview,

        -- actions.preview_scrolling_left/ right are unavailable till v0.2.0
        ["<M-j>"] = actions.cycle_previewers_next,
        ["<M-k>"] = actions.cycle_previewers_prev,

        ["<M-h>"] = actions.preview_scrolling_down,
        ["<M-l>"] = actions.preview_scrolling_up,

        -- Result
        -- actions.results_scrolling_left/ right are unavailable till v0.2.0
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-h>"] = actions.results_scrolling_down,
        ["<C-l>"] = actions.results_scrolling_up,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        -- Cursor
        ["<C-Home>"] = actions.move_to_top,
        ["<C-End>"] = actions.move_to_bottom,

        -- Selection
        ["<C-s>"] = actions.toggle_all,
        ["<C-t>"] = actions.select_tab,
        ["<C-v>s"] = actions.select_vertical,
        ["<C-s>p"] = actions.select_horizontal,

        -- Misc
        ["<C-c>"] = actions.close,
        ["<C-M-h>"] = actions.which_key
    }
}

return {
    mappings = mappings
}
