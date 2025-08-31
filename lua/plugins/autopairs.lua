return {
    "windwp/nvim-autopairs",
    branch = "master",
    commit = "23320e75953ac82e559c610bec5a90d9c6dfa743",
    pin = true,

    event = "InsertEnter",

    opts = {
        fast_wrap = {},
        disable_filetype = {},
    },

    config = function()
        require("nvim-autopairs").setup({})
    end
}
