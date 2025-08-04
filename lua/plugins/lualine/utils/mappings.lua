---@type table
local colors = require("plugins.lualine.cosmic.colors").colors


---@type table
local m2c = {
    n = colors.DARKBLUE,
    i = colors.VIOLET,
    v = colors.RED,
    [''] = colors.BLUE,
    V = colors.RED,
    c = colors.MAGENTA,
    no = colors.RED,
    s = colors.ORANGE,
    S = colors.ORANGE,
    [''] = colors.ORANGE,
    ic = colors.YELLOW,
    R = colors.ORANGE,
    Rv = colors.ORANGE,
    cv = colors.RED,
    ce = colors.RED,
    r = colors.CYAN,
    rm = colors.CYAN,
    ['r?'] = colors.CYAN,
    ['!'] = colors.RED,
    t = colors.RED,
}


---@type table
local m2m = {
    n = 'N', -- Normal mode
    i = 'I', -- Insert mode
    v = 'V', -- Visual mode
    [''] = 'V', -- Visual block mode
    V = 'V', -- Visual line mode
    c = 'C', -- Command-line mode
    no = 'N', -- NInsert mode
    s = 'S', -- Select mode
    S = 'S', -- Select line mode
    ic = 'I', -- Insert mode (completion)
    R = 'R', -- Replace mode
    Rv = 'R', -- Virtual Replace mode
    cv = 'C', -- Command-line mode
    ce = 'C', -- Ex mode
    r = 'R', -- Prompt mode
    rm = 'M', -- More mode
    ['r?'] = '?', -- Confirm mode
    ['!'] = '!', -- Shell mode
    t = 'T', -- Terminal mode
}


return {
    m2c = m2c,
    m2m = m2m
}
