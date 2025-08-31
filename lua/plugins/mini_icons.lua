return {
    "echasnovski/mini.icons",
    version = "*",
    priority = 1000,

    config = function ()
        require("mini.icons").setup({
              style = "glyph",
              default = {
                  lsp = {glyph = "🌐", hl = "MiniIconsAzure"},
              },
              lsp = {
                  class = {glyph = "", hl = "DraculaSoftBlue"},
                  constant = {glyph = "", hl = "MiniIconsOrange"},
                  ["function"] = {glyph = "", hl = "MiniIconsRed"},
                  keyword = {glyph = ""},
                  module = {glyph = "", hl = "DraculaGrey"},
                  method = {glyph = "", hl = "MiniIconsRed"},
                  property = {glyph = "", hl = "MiniIconsPurple"},
                  variable = {glyph = "", hl = "MiniIconsOrange"},
                  text = {glyph = "", hl="DraculaWhite"},
              }
        })

        MiniIcons.mock_nvim_web_devicons()

        -- Check https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-icons.md
        -- Features: Tweaking built-in maps for "LSP kind" to include icons.
        MiniIcons.tweak_lsp_kind()
    end
}
