require("utils.alias")


--cr_aucmd(
--        {"LspAttach"},
--        {
--            callback = function(e)
--                local client = vim.lsp.get_client_by_id(e.data.client_id)
--                if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
--                    vim.opt.completeopt = {"menu", "menuone", "noinsert", "fuzzy", "popup" }
--
--                    vim.lsp.completion.enable(true, client.id, e.buf, {autotrigger = true})
--                end
--            end
--        }
--)
