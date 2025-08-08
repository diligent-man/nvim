---@type table
local servers = require("plugins.mason_lspconfig.utils.servers").servers

---@type table
local utils = require("plugins.mason_lspconfig.utils.utils")


return {
    "mason-org/mason-lspconfig.nvim",

    branch = "main",
    version = "2.0.1",
    pin = true,

    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
        "nvim-tree/nvim-web-devicons"
    },

    config = function()
        ---@type table
        local ensure_installed = {}
        for server, cfg in pairs(servers) do
            list_extend(ensure_installed, {string.format("%s@%s", server, cfg.version)})
        end

        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
            automatic_enable = true
        })
        ----------------------------------------------------------------------------------------------------------------

        for server, cfg in pairs(servers) do
            utils.override_capabilities(server, cfg.capabilities, cfg.opts)
        end
    end
}
