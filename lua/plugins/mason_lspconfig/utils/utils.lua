require("utils.alias")

local on_attach = require("plugins.mason_lspconfig.utils.on_attach_keymap").on_attach


---@param nufnr number
---@return void
local function highlight_symbol(bufnr)
    --Highlight references of the word under your cursor when your cursor rests there for a little while.
    local group = cr_augroup("highlight_symbol", {clear = false})

    cl_aucmds({buffer = bufnr, group = group})

    cr_aucmd(
            {"CursorHold", "CursorHoldI"},
            {
                group = group,
                buffer = bufnr,
                callback = lsp.buf.document_highlight
            }
    )

    cr_aucmd(
            {"CursorMoved", "CursorMovedI"},
            {
                group = group,
                buffer = bufnr,
                callback = lsp.buf.clear_references,
            }
    )

    cr_aucmd(
            {"LspDetach"},
            {
                group = group,
                callback = function(e)
                    lsp.buf.clear_references()
                    cl_aucmds{group = group, buffer = bufnr}
                end
            }
    )
end


---@param client table
---@param method table
---@param bufnr? integer some lsp support methods only in specific files
---@return boolean
local function is_method_supported(client, method, bufnr)
    -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
    if has("nvim-0.11") == 1 then
        return client:supports_method(method, bufnr)
    else
        return client.supports_method(method, {bufnr = bufnr})
    end
end


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
    highlight_symbol = highlight_symbol,
    is_method_supported = is_method_supported,
    override_capabilities = override_capabilities,
}
