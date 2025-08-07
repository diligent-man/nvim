return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    tag = "v0.10.0",

    lazy = false,
    build = ":TSUpdate",

    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true
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
