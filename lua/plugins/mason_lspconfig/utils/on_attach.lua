require("utils.alias")
require("utils.constant")


---@type table
local OPTS = DEFAULT_KEYMAP_OPTS


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
        {{"n"}, "gbrn", lsp.buf.rename, {desc = "Rename", buffer = bufnr}},
        {{"i"}, "<C-l>rn", lsp.buf.rename, {desc = "Rename", buffer = bufnr}},

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
    }

    for _, mapping in pairs(mappings) do
        local modes, lhs, rhs, other = unpack(mapping)
        keymap(modes, lhs, rhs, other, OPTS)
    end
end


return {
    on_attach = on_attach
}
