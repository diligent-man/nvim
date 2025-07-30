return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    tag = "v0.10.0",

    lazy = false,
    build = ":TSUpdate",

    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.
        setup({
            highlight = {
                -- check highlight later
                enable = false,
                additional_vim_regex_highlighting = false
            },

            indent = {
                enable = true,
                disable = {"python", "css", "ruby"}
            },

            ensure_installed = {
                -- Main lang
                "python",

                "cpp",
                "cmake",

                "lua",
                "ruby",
                "java",

                -- ops
                "bash",
                "powershell",

                -- config
                "yaml",
                "dockerfile",
                "gitignore"
            }
        })
    end
}
