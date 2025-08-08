require("utils.alias")

---@type table
local utils = require("plugins.mason_lspconfig.utils.utils")

---@type function
local is_method_supported = utils.is_method_supported

---@type function
local highlight_symbol = utils.highlight_symbol


cr_aucmd(
        {"LspAttach"},
        {
            desc = "Configureed functionalities on LSP Attach. For keymap, check on_attach_keymap.lua",
            group = cr_augroup("lsp-attach", {clear = true}),
            callback = function(e)
                ---@type table
                local client = lsp.get_client_by_id(e.data.client_id)

                ---@type number
                local bufnr = e.buf

                if client and is_method_supported(client, lsp.protocol.Methods.textDocument_completion, bufnr) then
                    o.completeopt = {"menu", "menuone", "noinsert", "fuzzy", "popup" }
                    lsp.completion.enable(true, client.id, bufnr, {autotrigger = true})
                end

                --client.server_capabilities.documentHighlightProvider = false
                if client and is_method_supported(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, bufnr) then
                    highlight_symbol(bufnr)
                end

            end
        }
)
