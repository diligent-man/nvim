require("utils.alias")


local function autoclose_tab_buffer(winnr)
    --[[
    This will:
        Close the tab if nvim-tree is the last buffer in the tab (after closing a buffer)
        Close vim if nvim-tree is the last buffer (after closing a buffer)
        Close nvim-tree across all tabs when one nvim-tree buffer is manually closed if and only if tabs.sync.close is set.
    Ref: https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#background (@rwblokzijl)
    ]]
    local api = require"nvim-tree.api"

    local tabnr = nvim_win_get_tabpage(winnr)

    local bufnr = nvim_win_get_buf(winnr)
    local buf_info = getbufinfo(bufnr)[1]

    local tab_wins = tbl_filter(function(w) return w ~= winnr end, nvim_tabpage_list_wins(tabnr))
    local tab_bufs = tbl_map(nvim_win_get_buf, tab_wins)

    -- close buffer was nvim tree
    if buf_info.name:match(".*NvimTree_%d*$") then
        -- Close all nvim tree on :q
        if not tbl_isempty(tab_bufs) then                         -- and was not the last window (not closed automatically by code below)
            api.tree.close()
        end
    else                                                          -- else closed buffer was normal buffer
        if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
            local last_buf_info = getbufinfo(tab_bufs[1])[1]

            if last_buf_info.name:match(".*NvimTree_%d*$") then   -- and that buffer is nvim tree
                schedule(function ()
                    if #nvim_list_wins() == 1 then                -- if its the last buffer in vim
                        vicmd("quit")                             -- then close all of vim
                    else                                          -- else there are more tabs open
                        nvim_win_close(tab_wins[1], true)         -- then close only the tab
                    end
                end)
            end
        end
    end
end


return {
    autoclose_tab_buffer = autoclose_tab_buffer
}
