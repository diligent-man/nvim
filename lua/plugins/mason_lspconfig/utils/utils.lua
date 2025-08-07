require("utils.alias")


---@param server string
---@param opts table
---@return void
local function override_capabilities(server, opts)
        local capabilities = lsp.protocol.make_client_capabilities()

        if has("nvim-0.11") == 0 then
            require("lspconfig")[server].setup(opts)
        else
            lsp.config(server, deep_extend("force", capabilities, opts))
        end

    lsp.enable(server)
end


return {
    override_capabilities = override_capabilities
}
