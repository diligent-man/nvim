-- Ref: https://github.com/nvim-telescope/telescope.nvim/blob/b4da76be54691e854d3e0e02c36b0245f945c2c7/lua/telescope/config.lua#L78
---@type table
local default_setup = {
            borderchars = {
                prompt  = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
                results = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
                preview = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"}
            },

            scroll_strategy = "limit",
            layout_strategy = "horizontal",
            sorting_strategy = "ascending",
            selection_strategy = "reset",

			prompt_prefix = "🖉 ",
            selection_caret = " ",
			multi_icon = " ▌",

            initial_mode = "insert",
            path_display = {"smart"},

            results_title = "Results",

            dynamic_preview_title=true,
            preview = {
                filesize_limit = 1024, -- MB
                timeout = 10000, -- ms
                treesitter =
                {
                    enable = true,
                    disable = {}  -- ftypes to ignore syntax hl
                },
                msg_bg_fillchar = "",
                hide_on_startup = true,
            },
            --set_env = {COLORTERM = "truecolor", number = true}
}


return {
    default_setup = default_setup
}
