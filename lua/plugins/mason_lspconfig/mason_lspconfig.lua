---@type table
local servers = require("plugins.mason_lspconfig.utils.servers").servers

---@type table
local override_capabilities = require("plugins.mason_lspconfig.utils.on_attach").override_capabilities


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
        local mason_registry = require("mason-registry")

        ---@type table
        local ensure_installed = {}
        for server, cfg in pairs(servers) do
            ---@type string | nil
            local install_method = cfg.install_method or nil

            if install_method == nil then
                list_extend(ensure_installed, {string.format("%s@%s", server, cfg.version)})
            else
                if not mason_registry.get_package(server):is_installed() then
                    mason_registry.refresh(
                            function()
                                vicmd(string.format(":MasonInstall %s@%s", server, cfg.version))
                            end
                    )
                end
            end
        end

        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
            automatic_enable = true
        })
        ----------------------------------------------------------------------------------------------------------------

        for server, cfg in pairs(servers) do
            override_capabilities(server, cfg.capabilities, cfg.opts)
        end
    end
}
