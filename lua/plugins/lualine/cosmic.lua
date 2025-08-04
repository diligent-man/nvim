---@type table
local arr_ops = require("ext_lua.arr_ops")

---@type table
local dict_ops = require("ext_lua.dict_ops")


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
local get_vals = dict_ops.get_vals


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
local get_middle_color = utils.get_middle_color

---@type function
local get_animated_color = utils.get_animated_color

---@type function
local create_mode_based_component = utils.create_mode_based_component


math.randomseed(os.time())


---@type StatusBar
local status_bar = StatusBar.new()

---@type table
local icon_sets_list = shuffle(get_vals(icon_sets))


------------------------------------------------------------------------------------------------------------------------
--- Left Sections ---
--- Order: Mode -> Sep -> File dir -> Sep -> Fname -> sep -> '' -> Lsp info -> Icons -> Search count
status_bar:ins_left({
    get_m2m,

    color = function()
        --print(get_m2c())
        return {
            fg = colors.BG,
            bg = get_m2c(),
            gui = 'bold,italic',
        }
    end,

    padding = {left = 1, right = 1},
})


status_bar:ins_left(create_separator("left", true))

status_bar:ins_left({
    function()
        return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    end,
    icon = ' ',
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
                gui = 'bold',
            }
        end
    end,
})

status_bar:ins_left(create_separator("right"))
status_bar:ins_left(create_mode_based_component('filename', nil, colors.BG))
status_bar:ins_left(create_separator("left"))

status_bar:ins_left({
    function()
        return ''
    end,

    color = function()
        return {
            fg = get_middle_color(),
        }
    end,
    cond = hide_in_width,
})


status_bar:ins_left({
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
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
})


for _, icons in pairs(icon_sets_list) do
    status_bar:ins_left({
        function()
            return get_random_icon(icons)
        end,
        color = function()
            return {
                fg = get_animated_color(),
            }
        end,
        cond = hide_in_width,
    })
end

status_bar:ins_left({
    'searchcount',
    color = {
        fg = colors.GREEN,
        gui = 'bold',
    },
})


------------------------------------------------------------------------------------------------------------------------
--- Right Sections ---
--- Right part: macro recording -> selection count -> icons -> Git status -> '' -> sep ->
---             cursor location -> git branch -> sep -> file progress

status_bar:ins_right({
    function()
        local reg = vim.fn.reg_recording()
        return reg ~= '' and '[' .. reg .. ']' or ''
    end,

    color = {
        fg = '#ff3344',
        gui = 'bold',
    },

    cond = function()
        return vim.fn.reg_recording() ~= ''
    end,
})


status_bar:ins_right({
    'selectioncount',
    color = {
        fg = colors.GREEN,
        gui = 'bold',
    },
})


for _, icons in ipairs(reverse(icon_sets_list)) do
    status_bar:ins_right({
        function()
            return get_random_icon(icons)
        end,

        color = function()
            return {
                fg = get_animated_color(),
            }
        end,
        cond = hide_in_width,
    })
end


status_bar:ins_right({
    function()
        local git_status = vim.b.gitsigns_status_dict

        if git_status then
            return string.format("+%d ~%d -%d",
                    git_status.added or 0,
                    git_status.changed or 0,
                    git_status.removed or 0
            )
        end
        return ""
    end,

    icon = '󰊢 ',

    color = {
        fg = colors.RED,
        gui = "bold",
    },
    cond = hide_in_width,
})


status_bar:ins_right({
    function()
        return ''
    end,
    color = function()
        return { fg = get_middle_color() }
    end,
    cond = hide_in_width,
})

status_bar:ins_right(create_separator('right'))
status_bar:ins_right(create_mode_based_component('location', nil, colors.BG))
status_bar:ins_right(create_separator('left'))

status_bar:ins_right({
    'branch',
    icon = ' ',
    --[[ Truncates and formats Git branch names for display in lualine:
      First segment: Uppercase, truncated to 1 character.
      Middle segments: Lowercase, truncated to 1 character.
      Last segment: Unchanged.
      Separator: › between truncated segments and the last segment.

      Example Input/Output:
          Branch										Name	Output
          backend/setup/tailwind		Bs›tailwind
          feature/add-ui						Fa›add-ui
          main											main
      ]]
    fmt = function(branch)
        if branch == '' or branch == nil then
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
})


status_bar:ins_right(create_separator('right'))
status_bar:ins_right(create_mode_based_component('progress', nil, colors.BG))
------------------------------------------------------------------------------------------------------------------------


return {
    config = status_bar:get_config()
}
