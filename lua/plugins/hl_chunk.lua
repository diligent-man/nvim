return {
    "shellRaining/hlchunk.nvim",
    verion = " v1.3.0",
    pin = true,

    event = {"BufReadPre", "BufNewFile"},

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
                    -- get_hl(0, {name = "DraculaRed"}),
                    -- get_hl(0, {name = "DraculaYellow"}),
                    -- get_hl(0, {name = "DraculaSkyBlue"}),
                    -- get_hl(0, {name = "DraculaOrange"}),
                    -- get_hl(0, {name = "DraculaLightGreen"}),
                    -- get_hl(0, {name = "DraculaPurple"}),
                    -- get_hl(0, {name = "DraculaCyan"}),

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
                delay = 100,
                enable = true,
                priority = 15,
                duration = 200,
                textobject = "",
                style = "#61AFEF",
                error_sign = true,
                use_treesitter = true,
                max_file_size = 1024 ^ 4,  -- 1TB

                chars = {
                    horizontal_line = "─",
                    vertical_line = "│",
                    left_top = "╭",
                    left_bottom = "╰",
                    right_arrow = ">",
                }
            }
        })
    end
}
