---@type table
local colors = {
    BG = "#171421", -- Dark background
    --BG = "#16181b", -- Dark background

    FG = "#c5c4c4",
    YELLOW = "#e8b75f",
    CYAN = "#00bcd4",
    LIGHTBLUE = "#89ddff",
    GREEN = "#00e676",
    ORANGE = "#ff7733",
    VIOLET = "#9d7cd8",
    MAGENTA = "#d360aa",
    BLUE = "#4f9cff",
    RED = "#ff3344",
    WHITE = "#FFFFFF",
    CHARCOAL = "#192C2E",
    CHARCOAL_GREY = "#364946"
}


---@type table
local opposite_colors = {
        [colors.RED] = colors.CYAN,
        [colors.BLUE] = colors.ORANGE,
        [colors.GREEN] = colors.MAGENTA,
        [colors.MAGENTA] = colors.LIGHTBLUE,
        [colors.ORANGE] = colors.BLUE,
        [colors.CYAN] = colors.YELLOW,
        [colors.VIOLET] = colors.LIGHTBLUE,
        [colors.YELLOW] = colors.RED,
        [colors.LIGHTBLUE] = colors.VIOLET,
}


return {
    colors = colors,
    opposite_colors = opposite_colors
}
