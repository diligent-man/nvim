require("utils.alias")
require("utils.constant")


---@type table
local api = require("nvim-tree.api")


--[[
                        Usage note
Glyphs for git status (Default). Check nvim-tree.renderer.icons.glyphs.git
    {
      untracked = "★"      ignored = "◌"
      renamed = "➜"        deleted = ""
      unstaged = "✗"       staged = "✓"    unmerged = ""
    }

Tree filter:                                           <f> + regex
Tree search: same as nvim (inc)search


View toggling
    1/ Toggle ignored files (by .gitignore):           <S-i>
    2/ Toggle dotfiles:                                <S-h>
    3/ Toggle git clean (show file tracked by git):    <S-c>
    4/ Toggle loaded files (file on buffer):           <S-b>
    5/ Toogle bookmarked files:                        <S-m>
    6/ Toogle regex matched files:                     <S-u>
    7/ Recursively expand all:                         <S-e>

File ops:
    Trash file:                                        <S-d>
    Remove file (permanent delete !):                  <d>

    Create file/ dir:                                  <a> + fname/ dir_name
        -> Dir must end with "/" (Linux)

    Copy:                                              <c> + new location + <p>
    Move:                                              <x> + new location + <p>
    Rename:                                            <e> or same philosophy with Linux

API call: api.<module>.<fn>
]]


--- Predefined commands ---
---@type table
local cmd_mappings = {
    {{"n"}, "<C-b>", ":NvimTreeToggle<CR>", {desc = "Toggle tree"}},
    {{"n"}, "<C-B>", ":NvimTreeFindFileToggle<CR>", {desc = "Focus file"}},

    {{"n"}, "<leader>eca", ":NvimTreeCollapse<CR>", {desc = "Collapse all"}},
    {{"n"}, "<leader>ecb", ":NvimTreeCollapseKeepBuffers<CR>", {desc = "Collapse all but opened buffer(s)"}},
    {{"n"}, "<leader>e<F5>", ":NvimTreeRefresh<CR>", {desc = "Refresh"}},
}


-- api.tree.change_root_to_parent
---@type table
local api_mappings = {
    --- Dir traversing---
    {"n", "i", api.tree.change_root_to_node, "CD"},
    {"n", "o", api.tree.change_root_to_parent, "CD .."},

    {"n", "E", api.tree.expand_all, "Expand All"},
    {"n", "P", api.node.navigate.parent, "Parent Directory"},
    {"n", "<leader>efc", api.tree.collapse_all, "Collapse All"},

    {"n", "H", api.tree.toggle_hidden_filter, "Toggle Filter: Dotfiles"},
    {"n", "I", api.tree.toggle_gitignore_filter, "Toggle Filter: Git Ignore"},
    {"n", "S", api.tree.toggle_no_bookmark_filter, "Toggle Filter: No Bookmark"},
    --{"n", "", api.node.open.toggle_group_empty, "Toggle Group Empty"},
    --{"n", "", api.tree.toggle_no_buffer_filter, "Toggle Filter: No Buffer"},
    --{"n", "", api.tree.toggle_git_clean_filter, "Toggle Filter: Git Clean"},
    --{"n", "", api.tree.toggle_custom_filter, "Toggle Filter: Hidden"},


    --- File Ops ---
    --- File opening
    {"n", "<CR>", api.node.open.edit, "Open"},
    {"n", "<Tab>", api.node.open.preview, "Preview"},
    {"n", "<leader>wv", api.node.open.vertical, "Vsplit"},  -- overlap with core/keymap/windows which makes which-key cannot render desc
    {"n", "<leader>wh", api.node.open.horizontal, "Hsplit"},  -- overlap with core/keymap/windows which makes which-key cannot render desc
    {"n", "<leader>w<S-t>", api.node.open.tab, "Open in new tab"},  -- overlap with core/keymap/windows which makes which-key cannot render desc
    --{"n", "", api.node.open.edit, "Open"},
    -- {"n", "", api.node.open.replace_tree_buffer, "Open"},
    --{"n", "", api.node.open.no_window_picker, "Open: No Window Picker"},

    --- File Pasting/ Copy/ Cut/ Creating/ Rename
    {"n", "p", api.fs.paste, "Paste"},
    {"n", "c", api.fs.copy.node, "Copy"},
    {"n", "x", api.fs.cut, "Cut"},
    {"n", "n", api.fs.create, "Create File Or Directory"},
    {"n", "<F2>", api.fs.rename, "Rename"},

    --{"n", "", api.fs.rename_full, "Rename full path"},
    --{"n", "", api.fs.rename_basename, "Rename with base"},
    --{"n", "", api.fs.rename_sub, "Rename with omitted fname"},

    --- Fname copy
    {"n", "<leader>efnc", api.fs.copy.filename, "Fname Copy"},
    {"n", "<leader>efn<S-c>", api.fs.copy.absolute_path, "Abs fname copy"},
    --{"n", "<leader>efnpp", api.fs.copy.relative_path, "Copy Relative Path"},

    --{"n", "", api.fs.cut, "Cut"},
    --{"n", "", api.fs.copy.basename, "Copy basename"},

    --- File remove
    {"n", "d", api.fs.trash, "Trash"},
    {"n", "D", api.fs.remove, "Delete"},


    --- Tree traversing ---
    {"n", "}", api.node.navigate.sibling.next, "Next Sibling"},
    {"n", "{", api.node.navigate.sibling.prev, "Previous Sibling"},

    {"n", "<S-Home>", api.node.navigate.sibling.first, "First Sibling"},
    {"n", "<S-End>", api.node.navigate.sibling.last, "Last Sibling"},


    --- Tree filter ---
    {"n", "f", api.live_filter.start, "Live Filter: Start"},
    --{"n", "", api.tree.search_node, "Search"},  -- use Nvim built-in search instead
    --{"n", "F", api.live_filter.clear, "Live Filter: Clear"},


    --- File selection (does not have bulky copy !)
    {"n", "s", api.marks.toggle, "Select"},
    {"n", "<leader>efbm", api.marks.bulk.move, "Move Bookmarked"},
    {"n", "<leader>efbd", api.marks.bulk.trash, "Trash Bookmarked"},
    {"n", "<leader>efbD", api.marks.bulk.delete, "Delete Bookmarked"},


    --- Misc ---
    {"n", ".", api.node.run.system, "Run SysCmd"},  -- "e.g xdg-open in Linux, which runs default apps for selected extension"
    {"n", "<M-Enter>", api.node.show_info_popup, "Info"},

    --{"n", "<2-LeftMouse>", api.node.open.edit, "Open"},
    --{"n", "<2-RightMouse>", api.tree.change_root_to_node, "CD"},

    --{"n", "", api.tree.close, "Close"},
    --{"n", "", api.tree.toggle_help, "Help"},

    --{"n", "", api.node.run.cmd, "Run Nvim Command"},

    --{"n", "", api.node.navigate.parent_close, "Close Directory"},
    --{"n", "", api.node.navigate.diagnostics.next, "Next Diagnostic"},
    --{"n", "", api.node.navigate.diagnostics.prev, "Prev Diagnostic"},

    --{"n", "", api.node.navigate.git.prev, "Prev Git"},
    --{"n", "", api.node.navigate.git.next, "Next Git"},
}


for _, mapping in pairs(cmd_mappings) do
    local modes, lhs, rhs, other = unpack(mapping)
    keymap(modes, lhs, rhs, other, OPTS)
end


local function on_attach(bufnr)
    ---@param desc string
    ---@return table
    local function opts(desc)
        return {desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
    end

    -- Not load default
    --api.config.mappings.default_on_attach(bufnr)
    
    for _, mapping in pairs(api_mappings) do
        local modes, lhs, rhs, desc = unpack(mapping)
        keymap(modes, lhs, rhs, other, opts(desc, bufnr))
    end
end


return {
    on_attach = on_attach
}
