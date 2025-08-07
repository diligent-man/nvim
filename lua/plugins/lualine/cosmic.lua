---@type table
local arr_ops = require("ext_lua.arr_ops")

---@type table
local fn_ops = require("ext_lua.fn_ops")


---@type table
local dict_ops = require("ext_lua.dict_ops")


---@type function
local get_icon = require("nvim-web-devicons").get_icon


---@type function
local get_curr_buf_fpath = require("utils").get_curr_buf_fpath


---@type StatusBar
local StatusBar = require("plugins.lualine.utils.StatusBar").StatusBar


---@type table
local utils = require("plugins.lualine.utils.utils")

---@type table
local colors = require("plugins.lualine.utils.colors").colors

---@type table
local icon_sets = require("plugins.lualine.utils.icon_sets").icon_sets


---@type function
local reverse = arr_ops.reverse

---@type function
local shuffle = arr_ops.shuffle

---@type function
local merge = arr_ops.merge

---@type function
local get_vals = dict_ops.get_vals

---@type function
local partial = fn_ops.partial


---@type function
local get_m2c = utils.get_m2c

---@type function
local get_m2m = utils.get_m2m

---@type function
local hide_in_width = utils.hide_in_width

---@type function
local get_random_icon = utils.get_random_icon

---@type function
local create_separator = utils.create_separator

---@type function
local get_animated_color = utils.get_animated_color

---@type function
local get_opposite_color = utils.get_opposite_color

---@type function
local create_mode_based_component = utils.create_mode_based_component


math.randomseed(os.time())


---@type StatusBar
local status_bar = StatusBar.new()

---@type table
local icon_sets_list = shuffle(get_vals(icon_sets))

---@type table
local left_icon_components = {}
for _, icons in pairs(icon_sets_list) do
    table.insert(left_icon_components,{
        function()
            return get_random_icon(icons)
        end,

        color = function()
            return {
                --bg = colors.BG,
                fg = get_animated_color()
            }
        end,
        cond = partial(hide_in_width, 121),
    })
end


---@type table
local right_icon_components = {}
for _, icons in pairs(reverse(icon_sets_list)) do
    table.insert(right_icon_components,{
        function()
            return get_random_icon(icons)
        end,

        color = function()
            return {
                --bg = colors.BG,
                fg = get_animated_color()
            }
        end,
        cond = partial(hide_in_width, 121),
    })
end


------------------------------------------------------------------------------------------------------------------------
--- Left Sections ---
--- Order: Mode -> Sep -> Dir -> Sep -> Fname -> sep -> Lsp -> Cur time -> Icons -> Search count
local left_sections = deep_extend("error", {}, {
    {
        get_m2m,

        color = function()
            return {
                fg = colors.BG,
                bg = get_m2c(),
                gui = 'bold,italic',
            }
        end,

        padding = { left = 1, right = 1 },
    },
    create_separator("left", true),
    {
        function()
            --print(get_curr_buf_fpath())
            --print(vim.fn.fnamemodify(get_curr_buf_fpath(), ":t"))
            --local icon, color = get_icon_color(vim.fn.fnamemodify(get_curr_buf_fpath(), ":t"))

            --print(
            --    i1, icon, color
            --)
            return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
        end,

        icon = '',

        color = function()
            local virtual_env = vim.env.VIRTUAL_ENV

            if virtual_env then
                return {
                    fg = get_m2c(),
                    gui = 'bold,italic,underline,undercurl',
                }
            else
                return {
                    fg = get_m2c(),
                    gui = 'bold,italic',
                }
            end
        end,

        cond = partial(hide_in_width, 60),
    },
    create_separator("right", nil, partial(hide_in_width, 41)),
    {
        "filename",

        function()
            ---@type self
            local os_symbols = {
                unix = {" ", "Linux"},
                dos = {"", "Win"},
                mac = {"", "Darwin"},
            }

            ---@type string
            local icon = get_icon(vim.fn.fnamemodify(get_curr_buf_fpath(), ":t"))

            ---@type string
            local format = vim.bo.fileformat
            format = os_symbols[format][2]

            return string.format("(%s) %s", format, icon)
        end,

        color = function()
            local mode_color = get_m2c()
            local opposite_color = get_opposite_color(mode_color)

            return {
                fg = colors.BG,
                bg = opposite_color,
                gui = 'bold,italic'
            }
        end,

        symbols =
        {
            modified = '[~]',
            readonly = '[-]',
            unnamed = '[No Name]',
            newfile = '[New]'
        },

        cond = partial(hide_in_width, 41)
    },
    create_separator("left", nil, partial(hide_in_width, 41)),
    {
        function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_clients()
            if next(clients) == nil then
                return msg
            end
            local lsp_short_names = {
                pyright = 'py',
                tsserver = 'ts',
                rust_analyzer = 'rs',
                lua_ls = 'lua',
                clangd = 'c++',
                bashls = 'sh',
                jsonls = 'json',
                html = 'html',
                cssls = 'css',
                tailwindcss = 'tw',
                dockerls = 'docker',
                sqlls = 'sql',
                yamlls = 'yml',
            }
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return lsp_short_names[client.name] or client.name:sub(1, 2)
                end
            end
            return msg
        end,
        icon = ' ',
        color = {
            fg = colors.YELLOW,
            gui = 'bold',
        },
        cond = partial(hide_in_width, 103)
    },
    {
        "ctime",
        cond = partial(hide_in_width, 13),

        color = function()
            return { fg = get_animated_color() }
        end
    },
    unpack(left_icon_components)
})

left_sections = merge(left_sections, {
    {
        "searchcount",
        color = {fg = colors.GREEN, gui = 'bold'}
    }
})

for _, component in pairs(left_sections) do
    status_bar:ins_left(component)
end


------------------------------------------------------------------------------------------------------------------------
--- Right Sections ---
--- Right part: macro recording -> selection count -> cur date -> Git status -> sep ->
---             encoding        -> git branch      -> sep      -> location   -> progress
local right_sections = deep_extend("error", {}, {
    {
    function()
        local reg = vim.fn.reg_recording()
        return reg ~= '' and '[' .. reg .. ']' or ''
    end,

    color = {
        fg = colors.LIGHTBLUE,
        gui = 'bold',
    },

    cond = function()
        return vim.fn.reg_recording() ~= ''
    end,
},
    {
    'selectioncount',
    color = {
        fg = colors.GREEN,
        gui = 'bold',
    },
},
    unpack(right_icon_components)
})

right_sections = merge(right_sections, {
    {
    "cdate",
    cond = partial(hide_in_width, 85),

    color = function()
        return {fg = get_animated_color()}
    end
},
    {
    function()
        local git_status = vim.b.gitsigns_status_dict

        if git_status then
            return string.format("+%d ~%d -%d",
                    git_status.added or 0,
                    git_status.changed or 0,
                    git_status.removed or 0
            )
        end
        return "none"
    end,

    icon = "",

    color = {
        fg = colors.RED,
        gui = "bold",
    },

    cond = function()
        ---@type table | nil
        local has_git = vim.b.gitsigns_status_dict
        return has_git ~= nil and hide_in_width(73) or false
    end
},
    create_separator(
            "right", nil,
            function()
                return get_curr_buf_fpath():len() > 0 and partial(hide_in_width, 23) or function() return false end
            end
    ),

    {
        "encoding",
        color = function()
            local mode_color = get_m2c()
            local opposite_color = get_opposite_color(mode_color)

            return {
                fg = colors.BG,
                bg = opposite_color,
                gui = 'bold,italic'
            }
        end,
        show_bomb = true,
        cond = partial(hide_in_width, 23)
    },
    create_separator(
            "right", nil,
            function()
                return get_curr_buf_fpath():len() > 0 and partial(hide_in_width, 23) or function() return false end
            end
    ),
    {
    "branch",
    icon = " ",
    --[[
    Truncates and formats Git branch names for display in lualine:
        First segment: Uppercase, truncated to 1 character.
        Middle segments: Lowercase, truncated to 1 character.
        Last segment: Unchanged.
        Separator: › between truncated segments and the last segment.

      Example Input/Output:
               Branch Name                     Output
          backend/setup/tailwind             Bs›tailwind
          feature/add-ui                     Fa›add-ui
          main                               main
      ]]
    fmt = function(branch)
        if branch == "" or branch == nil then
            return 'No Repo'
        end

        -- Function to truncate a segment to a specified length
        local function truncate_segment(segment, max_length)
            if #segment > max_length then
                return segment:sub(1, max_length)
            end
            return segment
        end

        -- Split the branch name by '/'
        local segments = {}
        for segment in branch:gmatch('[^/]+') do
            table.insert(segments, segment)
        end

        -- Truncate all segments except the last one
        for i = 1, #segments - 1 do
            segments[i] = truncate_segment(segments[i], 1) -- Truncate to 1 character
        end

        -- If there's only one segment (no '/'), return it as-is
        if #segments == 1 then
            return segments[1]
        end

        -- Capitalize the first segment and lowercase the rest (except the last one)
        segments[1] = segments[1]:upper() -- First segment uppercase
        for i = 2, #segments - 1 do
            segments[i] = segments[i]:lower() -- Other segments lowercase
        end

        -- Combine the first segments with no separator and add '›' before the last segment
        local truncated_branch = table.concat(segments, '', 1, #segments - 1) .. '›' .. segments[#segments]

        -- Ensure the final result doesn't exceed a maximum length
        local max_total_length = 15
        if #truncated_branch > max_total_length then
            truncated_branch = truncated_branch:sub(1, max_total_length) .. '…'
        end

        return truncated_branch
    end,

    color = function()
        local mode_color = get_m2c()
        return {
            fg = mode_color,
            gui = 'bold',
        }
    end,

    cond = partial(hide_in_width, 53)
},
    create_separator("right", nil, partial(hide_in_width, 29)),
    create_mode_based_component("location", nil, colors.BG, nil, partial(hide_in_width, 23)),
    create_mode_based_component("progress", nil, colors.BG, nil, partial(hide_in_width, 29))
})


for _, component in pairs(right_sections) do
    status_bar:ins_right(component)
end


return {
    config = status_bar:get_config()
}
