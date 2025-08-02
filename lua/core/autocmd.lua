require("lfs")

require("utils.alias")
require("utils.constant")


---@type table
local utils = require("utils")

---@type table
local os_ops = require("ext_lua.os_ops")

------@type Notifier
local Notifier = require("utils.Notifier").Notifier


---@type Notifier
local notifier = Notifier.new()

---@type function
local os_sep = os_ops.os_sep

---@type function
local get_curr_buf_fpath = utils.get_curr_buf_fpath

---@type function
local open_help_next_tab = utils.open_help_next_tab


--[[
Vim apis for autocmd (see utils.alias for more info)
    cr_augroup
    cr_aucmd

    g_aucmds
    ex_aucmds

    del_augr_by_name
    del_aucmd
    cl_aucmds
]]


-- Sample autocmd. Add 1 space before bracket to reactivate code block
--[[
cr_aucmd(
        {'BufEnter'},
        {
            pattern = {"*"},
            callback = function(e)
                print(string.format('event fired: %s', vim.inspect(e)))
            end
        }
)
--]]


------------------------------------------------------------------------------------------------------------------------
-- Text highlighting ---
------------------------------------------------------------------------------------------------------------------------
cr_aucmd(
        {"TextYankPost"},
        {
            desc = "Highlight yanked text",
            group = cr_augroup("YankHighlight", {clear = true}),
            callback = function()
                vim.highlight.on_yank({
                    higroup = "IncSearch",
                    timeout = 200,
                })
            end
        }
)


------------------------------------------------------------------------------------------------------------------------
--- Terminal ---
------------------------------------------------------------------------------------------------------------------------

-- Enter insert mode when switching to terminal
cr_aucmd("TermOpen", {
  command = "setlocal listchars= nonumber norelativenumber nocursorline",
})

cr_aucmd("TermOpen", {
  pattern = "",
  command = "startinsert"
})


------------------------------------------------------------------------------------------------------------------------
--- Backup file ---
---------------------------------------------------------------------------------------------------------------------------

cr_aucmd(
        {"BufWritePre"},
        {
            desc = [[
                     Add timestamp as extension to backup filename.
                     Timestamp format: Weekday-DateMonthYear-HourMinSec
                     Backup extension format: ".{Timestamp}.bak"
                     Number of bak files is guaranteed to not exceed "MAX_NUM_BAK_FILES"
                   ]],
            pattern = "*",
            callback = function()
                -- Remove files exceeded MAX_NUM_BAK_FILES
                local bak_fname = get_curr_buf_fpath():gsub(os_sep(), "%%")

                ---@type table
                local prev_bak_files = {}
                for fname in lfs.dir(o.backupdir:get()[1]) do
                    if fname:find(bak_fname, 1, true) ~= nil then
                        table.insert(prev_bak_files, fname)
                    end
                end

                if #prev_bak_files > MAX_NUM_BAK_FILES then
                    table.sort(prev_bak_files, function(fname1, fname2) return fname1 > fname2 end)

                    for i = MAX_NUM_BAK_FILES + 1, #prev_bak_files, 1 do
                        os.remove(o.backupdir:get()[1] .. prev_bak_files[i])
                    end
                end

                -- Extension str appended to bak file
                o.bex = string.format(".%s.bak", os.date("%w-%d%m%y-%H%M%S"))
            end
        }
)
------------------------------------------------------------------------------------------------------------------------
--- Misc commands ---
---------------------------------------------------------------------------------------------------------------------------

cr_aucmd(
        {"CmdlineLeave"},
        {
            desc = "Trick to map :h and :help with usr-defined :H cmd.",

            callback = function()
                ---@type string
                local inp_cmd = fn.getcmdline()

                --[[
                Matches: {
                        h {topic}, help {topic},
                        H {topic}, Help {topic}  --> prompt ERROR when run (fix later)
                    }
                --]]
                ---@type boolean
                local is_match = false

                ---@type table
                local re = {
                  cmd_begin = ":*",  -- '*' for multi-matching
                  sep = "%s*",
                  help_topic = "[a-zA-Z%-%._']*"
                }

                ---@type table
                local cmd_variants = {"h[elp]*", "Help", "Hel", "He"}  -- shout not change this order

                for i, variant in ipairs(cmd_variants) do
                    local match_cond = string.format("^(%s%s)(%s)(%s)$", re.cmd_begin, variant, re.sep, re.help_topic)
                    local _, _, topic = inp_cmd:match(match_cond)

                    if topic ~= nil then
                        if i > 1 then
                            notifier:notify("E492 for :Help {topic} is currently in fix", "WARN")
                        end

                        open_help_next_tab(topic)
                        is_match = true
                    end

                    if is_match then
                        break
                    end
                end
            end
        }
)



------------------------------------------------------------------------------------------------------------------------
--- Cursor line ---
---------------------------------------------------------------------------------------------------------------------------
cr_augroup("cursorline", {clear = true})

cr_aucmd({ "WinEnter", "BufEnter"}, {
    group = "cursorline",
    desc = "Turn on cursorline when entering window/ buffer",
    callback = function()
        wo.cursorline = true
        wo.cursorcolumn = true
    end
})

cr_aucmd({"WinLeave", "BufLeave"}, {
    group = "cursorline",
    desc = "Turn off cursor line when leaving window/ buffer",
    callback = function()
        wo.cursorline = false
        wo.cursorcolumn = false
    end,
})
------------------------------------------------------------------------------------------------------------------------
--- plugins/tree ---
---------------------------------------------------------------------------------------------------------------------------

--vim.api.nvim_create_autocmd("BufEnter", {
--  nested = true,
--  callback = function()
--    if #vim.api.list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
--      vim.cmd "quit"
--    end
--  end
--})
