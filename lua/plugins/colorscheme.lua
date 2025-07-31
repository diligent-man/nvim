require("utils.alias")

return {
    "diligent-man/dracula-pro.nvim",
    priority = 1000,

    config = function()
        -- 1: Include background fill colors
        -- 0: Not include background fill colors
        g.dracula_colorterm = 0
    end
}

