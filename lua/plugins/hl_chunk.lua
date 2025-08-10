return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("hlchunk").setup({
            blank = {enable = false},
            line_num = {enable = false},
            indent = {
                delay = 200,
                enable = true,
                ahead_lines = 5,
                use_treesitter = false,

                style = {
                    --vim.api.nvim_get_hl(0, {name = "DraculaRed"}),
                    --vim.api.nvim_get_hl(0, {name = "DraculaYellow"}),
                    --vim.api.nvim_get_hl(0, {name = "DraculaSkyBlue"}),
                    --vim.api.nvim_get_hl(0, {name = "DraculaOrange"}),
                    --vim.api.nvim_get_hl(0, {name = "DraculaLightGreen"}),
                    --vim.api.nvim_get_hl(0, {name = "DraculaPurple"}),
                    --vim.api.nvim_get_hl(0, {name = "DraculaCyan"}),

                    vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui")
                },

                chars = {
                    " ",
                    --"│",
                    --"¦",
                    --"┆",
                    --"┊"
                },

                filter_list = {
                    -- Not show indent for the 1 level
                    function(v)
                        return v.level ~= 1
                    end,
                },
            },
            chunk = {
                enable = true,
                priority = 15,
                style = "#61AFEF",
                use_treesitter = true,
                max_file_size = 1024 ^ 4,  -- 1TB

                chars = {
                    horizontal_line = "─",
                    vertical_line = "│",
                    left_top = "╭",
                    left_bottom = "╰",
                    right_arrow = ">",
                },

                textobject = "",

                error_sign = true,

                duration = 200,
                delay = 100,
            }
        })
    end
}
