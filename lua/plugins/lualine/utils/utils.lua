require("utils.alias")


---@type table
local mappings = require("plugins.lualine.utils.mappings")

---@type table
local colors = require("plugins.lualine.utils.colors").colors

---@type table
local opposite_colors = require("plugins.lualine.utils.colors").opposite_colors


---@type table
local m2c = mappings.m2c

---@type table
local m2m = mappings.m2m



---@return string
local function get_m2m()
    return m2m[mode()] or '[UNKNOWN]'
end


---@return string
local function get_m2c()
    return m2c[mode()]
end


---@param mode_color string
---@return string
local function get_opposite_color(mode_color)
    -- Return the opposite color, or fallback to foreground color
    return opposite_colors[mode_color] or colors.FG
end


---@param mode_color string
---@return string
local function get_animated_color(mode_color)
    -- Define a list of all available colors
    local all_colors = {
        colors.BLUE,
        colors.GREEN,
        colors.MAGENTA,
        colors.ORANGE,
        colors.CYAN,
        colors.VIOLET,
        colors.YELLOW,
        colors.LIGHTBLUE,
    }

    -- Create a list of possible opposite colors (excluding the current mode color)
    local possible_opposites = {}
    for _, color in ipairs(all_colors) do
        if color ~= mode_color then
            table.insert(possible_opposites, color)
        end
    end

    -- Randomly select an opposite color
    if #possible_opposites > 0 then
        local random_index = math.random(1, #possible_opposites)
        return possible_opposites[random_index]
    else
        return colors.FG -- Default to foreground color if no opposite found
    end
end


---@param color1 string
---@param color2 string
---@param step number
---@return string
local function interpolate_color(color1, color2, step)
    -- Blend two colors based on the given step factor (0.0 -> color1, 1.0 -> color2)
    local blend = function(c1, c2, stp)
        return math.floor(c1 + (c2 - c1) * stp)
    end
    -- Extract the RGB values of both colors (in hex)
    local r1, g1, b1 = tonumber(color1:sub(2, 3), 16), tonumber(color1:sub(4, 5), 16), tonumber(color1:sub(6, 7), 16)
    local r2, g2, b2 = tonumber(color2:sub(2, 3), 16), tonumber(color2:sub(4, 5), 16), tonumber(color2:sub(6, 7), 16)

    -- Calculate the new RGB values for the blended color
    local r = blend(r1, r2, step)
    local g = blend(g1, g2, step)
    local b = blend(b1, b2, step)

    -- Return the blended color in hex format
    return string.format('#%02X%02X%02X', r, g, b)
end


---@param color_step number
---@return string
local function get_middle_color(color_step)
    -- Set default value for color_step if not provided
    color_step = color_step or 0.5 -- If color_step is nil, default to 0.5

    local color1 = get_m2c() -- Get the current mode color
    local color2 = get_opposite_color(color1) -- Get the opposite color

    -- Return an interpolated color between the two (based on the color_step value)
    return interpolate_color(color1, color2, color_step)
end


---@param content string | function | nil
---@param icon string | function | nil
---@param color_fg string | nil
---@param color_bg string | nil
---@return table
local function create_mode_based_component(content, icon, color_fg, color_bg, cond)
    -- Function to create a mode-based component (e.g., statusline)
    -- with optional content, icon, and colors
    return {
        type(content) == "function" and content() or content,
        icon = type(icon)  == "function" and icon() or icon,

        color = function()
            local mode_color = get_m2c()
            local opposite_color = get_opposite_color(mode_color)

            return {
                fg = color_fg or colors.FG,
                bg = color_bg or opposite_color,
                gui = 'bold,italic'
            }
        end,
        cond = cond
    }
end


---@param width number
---@return boolean
local function hide_in_width(width)
    -- Condition: Hide in width (only show the statusline when the window width is greater than 80)
    -- This ensures that the statusline will only appear if the current window width exceeds 80 characters.
    width = width or 80
    return winwidth(0) > width
end


---@param side string
---@param use_mode_color boolean | nil
---@param cond function | nil
---@return table
local function create_separator(side, use_mode_color, cond)
    -- Function to create a separator component based on side (left/right) and optional mode color
    return {
        function()
            return side == "left" and "" or ""
        end,

        color = function()
            -- Set color based on mode or opposite color
            local color = use_mode_color and get_m2c() or get_opposite_color(get_m2c())
            return {
                fg = color,
            }
        end,

        padding = {left = 0},
        cond = cond
    }
end


---@param icons table
---@return string
local function get_random_icon(icons)
    return icons[math.random(#icons)] -- Returns a random icon from the set
end


return {
    hide_in_width = hide_in_width,

    get_m2m = get_m2m,
    get_m2c = get_m2c,

    get_random_icon = get_random_icon,
    get_opposite_color = get_opposite_color,
    get_animated_color = get_animated_color,
    interpolate_color = interpolate_color,
    get_middle_color = get_middle_color,

    create_separator = create_separator,
    create_mode_based_component = create_mode_based_component
}
