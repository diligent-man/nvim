-- Ref: https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.config() at vim.diagnostic section
require("utils.alias")


---@type table
local diagnostic_cfg = {
    float = {border = "rounded", source = "if_many"},
    update_in_insert = true, -- instead of on InsertLeave event
    severity_sort = true,  -- ERROR > WARN > INFO > HINT
    underline = false and {severity = diagnostic.severity.ERROR},

    -- in-line diagnosed msg
    virtual_text = true and {
        current_line = false,
        source = "if_many",
        spacing = 0,

        ---@param diagnostic table
        prefix = function (diagnostic)
            return "" -- Add PEP (Python) later
        end,

        ---@param diagnostic table
        suffix = function (diagnostic)
            return "" -- Check later
        end,

        format = function(diag)
            local diagnostic_message = {
                [diagnostic.severity.ERROR] = diag.message,
                [diagnostic.severity.WARN] = diag.message,
                [diagnostic.severity.INFO] = diag.message,
                [diagnostic.severity.HINT] = diag.message,
            }
            return diagnostic_message[diagnostic.severity]
        end
    },

    signs = {
        text = {
            [diagnostic.severity.ERROR] = "✘" and "󰅚",
            [diagnostic.severity.WARN] = "▲️" and "󰀪",
            [diagnostic.severity.HINT] = "⚑" and "󰌶",
            [diagnostic.severity.INFO] = "»" and "󰋽",
        },
        numhl = {
            [diagnostic.severity.WARN] = "DraculaYellow",
            [diagnostic.severity.HINT] = "DraculaCyan",
            [diagnostic.severity.ERROR] = "DraculaRed",
            [diagnostic.severity.INFO] = "DraculaLightGreen",
        },
        linehl = {
            [diagnostic.severity.WARN] = "LspDiagnosticsWarn",
            [diagnostic.severity.HINT] = "LspDiagnosticsHint",
            [diagnostic.severity.ERROR] = "LspDiagnosticsError",
            [diagnostic.severity.INFO] = "LspDiagnosticsInfo",
        }
    }
}


diagnostic.config(diagnostic_cfg)
