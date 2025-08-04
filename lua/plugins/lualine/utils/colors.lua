---@type table
local colors = {
    BG = '#16181b', -- Dark background
    FG = '#c5c4c4', -- Light foreground for contrast
    YELLOW = '#e8b75f', -- Vibrant yellow
    CYAN = '#00bcd4', -- Soft cyan
    DARKBLUE = '#2b3e50', -- Deep blue
    GREEN = '#00e676', -- Bright green
    ORANGE = '#ff7733', -- Warm orange
    VIOLET = '#7a3ba8', -- Strong violet
    MAGENTA = '#d360aa', -- Deep magenta
    BLUE = '#4f9cff', -- Light-medium blue
    RED = '#ff3344', -- Strong red
}


---@type table
local opposite_colors = {
        [colors.RED] = colors.CYAN,
        [colors.BLUE] = colors.ORANGE,
        [colors.GREEN] = colors.MAGENTA,
        [colors.MAGENTA] = colors.DARKBLUE,
        [colors.ORANGE] = colors.BLUE,
        [colors.CYAN] = colors.YELLOW,
        [colors.VIOLET] = colors.GREEN,
        [colors.YELLOW] = colors.RED,
        [colors.DARKBLUE] = colors.VIOLET,
}


return {
    colors = colors,
    opposite_colors = opposite_colors
}
