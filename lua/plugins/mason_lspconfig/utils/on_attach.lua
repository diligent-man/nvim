require("utils.alias")
require("utils.constant")


---@type table
local utils = require("plugins.mason_lspconfig.utils.utils")


---@type table
local OPTS = DEFAULT_KEYMAP_OPTS

---@type function
local check_triggeredChr = utils.check_triggeredChr


---@type table
local disabled_mappings = {
    "grn",
    "gra",
    "grr",
    "gri",
    "grt",
    "gO",
    "K",
}


for _, mapping in pairs(disabled_mappings) do
    keymap("n", mapping, "<NOP>")
end


local on_attach = function(client, bufnr)
    ---@type table
    local mappings = {
        --- Buffer-related ---
        -- Be carefule when use
        {{"n"}, "gbR", lsp.buf.rename, {desc = "Rename", buffer = bufnr}},
        {{"i"}, "<C-l>R", lsp.buf.rename, {desc = "Rename", buffer = bufnr}},

        {{"n"}, "gbca", lsp.buf.code_action, {desc = "Code Action", buffer = bufnr}},
        {{"i"}, "<C-l>ca", lsp.buf.code_action, {desc = "Code Action", buffer = bufnr}},

        --overriden by require("telescope.builtin").lsp_references later
        {{"n"}, "gbr", lsp.buf.references, {desc = "Reference", buffer = bufnr}},
        {{"i"}, "<C-l>r",  lsp.buf.references, {desc = "Reference", buffer = bufnr}},

        -- overriden by require('telescope.builtin').lsp_implementations later
        {{"n"}, "gbi", vim.lsp.buf.implementation, {desc = "Implementation", buffer = bufnr}},
        {{"i"}, "<C-l>i", vim.lsp.buf.implementation, {desc = "Implementation", buffer = bufnr}},

        -- overriden by require('telescope.builtin').lsp_type_definitions later
        {{"n"}, "gbd", lsp.buf.type_definition, {desc = "Definition", buffer = bufnr}},
        {{"i"}, "<C-l>d", lsp.buf.type_definition, {desc = "Definition", buffer = bufnr}},

        {{"n"}, "gbD", lsp.buf.declaration, {desc = "Declaration", buffer = bufnr}},
        {{"i"}, "<C-l>D", lsp.buf.declaration, {desc = "Declaration", buffer = bufnr}},

        {{"n"}, "gbs", lsp.buf.document_symbol, {desc = "Doc Symbols", buffer = bufnr}},
        {{"i"}, "<C-l>s", lsp.buf.document_symbol, {desc = "Doc Symbols", buffer = bufnr}},

        {{"n"}, "gbS", lsp.buf.signature_help, {desc = "Signature", buffer = bufnr}},

        {{"n"}, "gbk", lsp.buf.hover, {desc = "Hover info", buffer = bufnr}},
        {{"i"}, "<C-l>k", lsp.buf.hover, {desc = "Hover info", buffer = bufnr}},

        {{"n"}, "gblsprs", ":LspRestart<CR>", {desc = "Restart LSP", buffer = bufnr}},

        -- Ddiagnostics
        --{{"n"}, "gd", diagnostic.open_float, {desc = "Floated diagnostic", buffer = bufnr}}
    }

    for _, mapping in pairs(mappings) do
        local modes, lhs, rhs, other = unpack(mapping)
        keymap(modes, lhs, rhs, other, OPTS)
    end

    -- Signature pop up (ref NvChad)
    cr_aucmd(
        {"TextChangedI", "CursorHold", "CursorHoldI", "VimResized"},
        {
            desc = "Auto pop up fn/ method signature with triggerChars in specified events",
            group = cr_augroup("LspSignature", {clear = true}),
            buffer = bufnr,
            callback = function()
                if client.server_capabilities.signatureHelpProvider then
                    local triggerChars = client.server_capabilities.signatureHelpProvider.triggerCharacters

                    if check_triggeredChr(triggerChars) then
                        lsp.buf.signature_help({
                            focus = false,
                            silent = true,
                            max_height = 10,
                            max_width = 80,
                            offset_x = 0,
                            offset_y = 0,
                            border = "double",
                            title = "abcasdasda",
                            title_pos = "center"
                        })
                    end
                end
            end
        }
    )
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
    on_attach = on_attach,
    override_capabilities = override_capabilities,
}
