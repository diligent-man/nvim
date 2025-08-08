require("utils.alias")


local on_attach = function(client, bufnr)
    vim.lsp.completion.enable(
            true,
            client.id,
            bufnr, {
                autotrigger = true,
                --convert = function(item)
                --    return {abbr = item.label:gsub('%b()', '')}
                --end,
    })

    local attach_opts = {silent = true, buffer = bufnr}
    --keymap("n", "gD", lsp.buf.declaration, attach_opts)
    --keymap("n", "gd", lsp.buf.definition, attach_opts)
    --vim.keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
    --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
    --vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
    --vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
    --vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
    --vim.keymap.set('n', '<leader>wl', function()
    --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --end, attach_opts)
    --vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
    --vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
    --vim.keymap.set('n', 'so', require('telescope.builtin').lsp_references, attach_opts)
end

return {
    on_attach = on_attach
}
