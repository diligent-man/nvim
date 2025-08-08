require("utils.alias")

local on_attach = require("plugins.mason_lspconfig.utils.on_attach_keymap").on_attach


---@param server string
---@param opts table
---@return void
local function override_capabilities(server, capabilities, opts)
        capabilities = capabilities or {}
        local default_capabilities = lsp.protocol.make_client_capabilities()

        if has("nvim-0.11") == 0 then
            -- not tested !
            require("lspconfig")[server].setup(opts)
            require("lspconfig")[server].setup({
                on_attach = on_attach,
                capabilities = deep_extend("force", default_capabilities, capabilities),
            })
        else
            lsp.config(server, opts)
            lsp.config(server, {
                on_attach = on_attach,
                capabilities = deep_extend("force", default_capabilities, capabilities)
            })
        end

    lsp.enable(server)
end


return {
    override_capabilities = override_capabilities
}
