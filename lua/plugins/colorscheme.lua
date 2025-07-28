require("utils.alias")

return {
    "diligent-man/dracula-pro.nvim",

    config = function()
        -- 1: Include background fill colors
        -- 0: Not include background fill colors
        g.dracula_colorterm = 1

        --local dracula = require("lazy.dracula-pro.nvim")

        --print(dracula)
    end
}
