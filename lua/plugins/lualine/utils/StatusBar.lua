--[[
According to lualine README.md, lualine statusline has layout as below, in which A-C & X-Z are sections to configure. To
make code easy to follow, I use sections C on the LHS and X on the RHS as a reference system, and thus I just need two
below helper methods (ins_left & ins_right) to configure.
        +-------------------------------------------------+
        | A | B | C                             X | Y | Z |
        +-------------------------------------------------+
]]
---@type table
local fn_ops = require("ext_lua.fn_ops")

---@type table
local colors = require("plugins.lualine.utils.colors").colors

---@type table
local utils = require("plugins.lualine.utils.utils")


---@type function
local get_m2c = utils.get_m2c

---@type function
local partial = fn_ops.partial



---@class StatusBar
---@field __base table
local StatusBar = {
    __base = {
    options = {
        component_separators = "",
        section_separators = "",

        theme = {
            normal =
            {
                c = {fg = colors.FG}
            },

            inactive =
            {
                c = {fg = colors.FG, bg = "#364946"},
            },
        },

        disabled_filetypes = {
            statusline = {
                -- https://github.com/nvim-neo-tree/neo-tree.nvim
                "neo-tree",

                -- https://github.com/nvim-tree/nvim-tree.lua
                "NvimTree",
                "undotree",
                "sagaoutline",
                "diff"
            },
            winbar = {},
        },

        ignore_focus = {"Dashboard-Nvim"},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,

        refresh = {
            statusline = 500,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
                "WinEnter",
                "BufEnter",
                "BufWritePost",
                "SessionLoadPost",
                "FileChangedShellPost",
                "VimResized",
                "Filetype",
                --"CursorMoved",
                --"CursorMovedI",
                --"ModeChanged",
            },
        }
    },

    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                "filename",
                color = function()
                    return {
                        fg = colors.BG,
                        bg = get_m2c(),
                        gui = "bold,italic",
                    }
                end
            },
        },

        lualine_x = {
            {
                "location",
                color = function()
                    return {
                        fg = colors.BG,
                        bg = get_m2c(),
                        gui = "bold,italic",
                    }
                end,
            }
        },
        lualine_y = {},
        lualine_z = {},
    },
}
}

StatusBar.__index = StatusBar


---@return StatusBar
function StatusBar.new()
    local obj = setmetatable({}, StatusBar)
    return obj
end


---@param component table
---@return void
function StatusBar:ins_left(component)
    table.insert(self.__base.sections.lualine_c, component)
end


---@param component table
---@return void
function StatusBar:ins_right(component)
    table.insert(self.__base.sections.lualine_x, component)
end


---@return table
function StatusBar:get_config()
    return self.__base
end


return {
    StatusBar = StatusBar
}
