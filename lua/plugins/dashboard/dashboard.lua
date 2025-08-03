require("utils.alias")
require("utils.constant")


---@type LogoManager
local LogoManager = require("plugins.dashboard.collected_logos").LogoManager


return {
    "nvimdev/dashboard-nvim",
    commit = "c42fcfbd96dfcaa486c0a0ab52494316f1c31350",
    pin = true,
    event = 'VimEnter',

    dependencies = {
        "juansalvatore/git-dashboard-nvim",
        "folke/persistence.nvim",
        "nvim-tree/nvim-web-devicons",
    },

    opts = function()
        ---@type LogoManager
        local logo_manager = LogoManager.new("ascii", 3)

        local opts = {
            theme = "doom",
            change_to_vcs_root = true,

            hide = {
                -- this is taken care of by lualine
                -- enabling this messes up the actual last status setting after loading a file
                statusline = false
            },

            config = {
                -- Center the Dashboard on the vertical (from top to bottom)
                vertical_center =  true,
                disable_move = true,

                header = logo_manager:get_logo(),

                week_header = {
                    enable = WEEK_HEADER, --boolean use a week header
                    concat = "",   --concat string after time string line
                    append = {}    --table append after time string line
                },

                center = {
                    {
                        action = "ene",
                        desc = " New File",
                        icon = " ",
                        key = "n"
                    },
                    {
                        action = "lua require('persistence').load({last = true})",
                        desc = " Restore Last Session",
                        icon = " ",
                        key = "s"
                    },
                    {
                        action = "Lazy",
                        desc = " Lazy",
                        icon = "󰒲 ",
                        key = "l"
                    },
                    {
                        action = "q",
                        desc = " Quit",
                        icon = " ",
                        key = "q"
                    },
                    {
                        action = "silent !xdg-open https://github.com/diligent-man",
                        icon = " ",
                        desc = " GitHub",
                        key = "g"
                    },

                    {
                        action = "silent !xdg-open https://www.youtube.com/",
                        icon = " ",
                        desc = " Youtube",
                        key = "y"
                    }

                    --{action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f"},
                    --{action = 'lua LazyVim.pick("oldfiles")()',     desc = " Recent Files",       icon = " ", key = "r"},
                    --{action = 'lua LazyVim.pick("live_grep")()',    desc = " Find Text",          icon = " ", key = "g"},
                    --{action = 'lua LazyVim.pick.config_files()()',  desc = " Config",             icon = " ", key = "c"},
                    --{action = "LazyExtras",                           desc = " Lazy Extras",          icon = " ", key = "x"},
                },

                footer = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

                    ---@type string
                    local prompt = string.format("⚡ Neovim loaded %s/%s plugins in %.2f ms", stats.loaded, stats.count, ms)
                    return {prompt}
                end,
            },
        }

        -- balance margins
        for _, button in ipairs(opts.config.center) do
            button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
            button.key_format = "  %s"
        end

        set_hl(0, "DashboardHeader", {fg = "#52B65E"})
        set_hl(0, "DashboardFooter", {fg = "#61974C"})

        set_hl(0, "DashboardDesc", {fg = "#FFF700"})
        set_hl(0, "DashboardKey", {fg = "#FF80BF"})
        set_hl(0, "DashboardIcon", {fg = "skyblue"})
        --set_hl(0, "DashboardShortCut", {fg = "#61974C"})
        return opts
    end
}
