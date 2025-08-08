require("utils.alias")


---@type table
local diagnostic_cfg = {
    virtual_text = true,  -- in-line diagnosed msg
    underline = false,

    signs = {
        text = {
            [diagnostic.severity.ERROR] = "✘",
            [diagnostic.severity.WARN] = "▲️",
            [diagnostic.severity.HINT] = "⚑",
            [diagnostic.severity.INFO] = "»",
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


return {
    diagnostic_cfg = diagnostic_cfg
}
