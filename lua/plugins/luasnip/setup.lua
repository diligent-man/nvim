require("utils.alias")


return {
    "L3MON4D3/LuaSnip",

    version = "v2.*",
    pin=true,

    build = "make install_jsregexp",
    lazy = true,

    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    config = function()
        require("plugins.luasnip.example_snippets")
        require("plugins.luasnip.keymap")

        ---@type table
        local ls = require("luasnip")

        ls.setup({
            history=true,
            enable_autosnippets=true
        })
    end
}