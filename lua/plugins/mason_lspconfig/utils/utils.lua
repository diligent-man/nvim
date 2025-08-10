require("utils.alias")


---@param bufnr number
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
                callback = function(_)
                    lsp.buf.clear_references()
                    cl_aucmds{group = group, buffer = bufnr}
                end
            }
    )
end


---@param  triggerChr string
---@return boolean
local function check_triggeredChr(triggerChr)
    local cur_line = api.nvim_get_current_line()
    local pos = api.nvim_win_get_cursor(0)[2]

    local prev_char = cur_line:sub(pos - 1, pos - 1)
    local cur_char = cur_line:sub(pos, pos)

    for _, char in ipairs(triggerChr) do
        if cur_char == char or prev_char == char then
            return true
        end
    end
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


return {
    highlight_symbol = highlight_symbol,
    check_triggeredChr = check_triggeredChr,
    is_method_supported = is_method_supported,
}
