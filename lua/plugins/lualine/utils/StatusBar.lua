---@type table
local colors = require("plugins.lualine.cosmic.colors").colors


---@type table
local base = {
    options = {
        component_separators = '',
        section_separators = '',
        theme = {
            normal = {
                c = {
                    fg = colors.FG,
                    bg = colors.BG,
                },
            },
            inactive = {
                c = {
                    fg = colors.FG,
                    bg = colors.BG,
                },
            }, -- Simplified inactive theme
        },
        disabled_filetypes = {
            'neo-tree',
            'undotree',
            'sagaoutline',
            'diff',
        },
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

                'location',
                color = function()
                    return {
                        fg = colors.FG,
                        gui = 'bold',
                    }
                end,
            },
        },
        lualine_x = {
            {
                'filename',
                color = function()
                    return {
                        fg = colors.FG,
                        gui = 'bold,italic',
                    }
                end,
            },
        },
        lualine_y = {},
        lualine_z = {},
    },
}


--[[
According to lualine README.md, lualine statusline has layout as below, in which A-C & X-Z are sections to configure. To
make code easy to follow, I use sections C on the LHS and X on the RHS as a reference system, and thus I just need two
below helper functions to configure.
        +-------------------------------------------------+
        | A | B | C                             X | Y | Z |
        +-------------------------------------------------+
]]

local function ins_left(component)
    table.insert(base.sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(base.sections.lualine_x, component)
end


return {
    base = base
}