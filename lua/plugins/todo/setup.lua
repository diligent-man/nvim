return {
    "folke/todo-comments.nvim",

    version = "v1.4.0",
    pin = true,

    dependencies = {"nvim-lua/plenary.nvim"},

    config = function ()
        require("plugins.todo.keymap")
        require("todo-comments").setup({
            signs = true, -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {
                TODO = {icon = " ", color = "TODO"},
                HACK = {icon = " ", color = "HACK"},
                NOTE = {icon = " ", color = "NOTE", alt = {"INFO"}},
                WARN = {icon = " ", color = "WARN", alt = {"WARNING", "XXX"}},
                TEST = {icon = "⏲ ", color = "TEST", alt = {"TESTING", "PASSED", "FAILED"}},
                FIX  = {icon = " ", color = "error", alt = {"FIXME", "BUG", "FIXIT", "ISSUE"}},
                PERF = {icon = " ", color = "PERF", alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}}
            },

            gui_style = {
                fg = "ITALIC",
                bg = "ITALIC",
            },
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
            -- highlighting of the line containing the todo comment
            -- * before: highlights before the keyword (typically comment characters)
            -- * keyword: highlights of the keyword
            -- * after: highlights after the keyword (todo text)
            highlight = {
                multiline = true,
                multiline_pattern = "^.",
                multiline_context = 10,
                before = "", -- "fg" or "bg" or empty
                keyword = "bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
                after = "fg", -- "fg" or "bg" or empty
                max_line_len = 400,
                exclude = {},

                -- uses treesitter to match keywords in comments only
                comments_only = true,

                -- pattern or table of patterns, used for highlighting (vim regex)
                --pattern = [[.*<(KEYWORDS)\s*(\s:)=]],
                pattern = [[<(KEYWORDS)>]],
            },

            -- list of named colors where we try to extract the guifg from the
            -- list of highlight groups or use the hex color if hl not found as a fallback
            colors = {
                TODO = {"#79CBDC"},
                HACK = {"#10B981"},
                NOTE = {"#FFAAFF"},
                WARN = {"#FBBF24"},
                PERF = {"#FF63AB"},
                TEST = {"#FF00FF"}
            },

            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },

                -- ripgrep regex
                pattern = [[\b(KEYWORDS):]],
            }
        })
    end
}
