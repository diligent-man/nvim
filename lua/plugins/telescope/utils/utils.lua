require("utils.alias")


---@type table
local find_files = require("telescope.builtin").find_files


---@type table
local os_ops = require("ext_lua.os_ops")


---@type StdPath
local StdPath = require("utils.StdPath").StdPath


---@type StdPath
local std_path = StdPath.new()


local function find_nvim_cfg()
    find_files{cwd = std_path.config}
end


local function get_src_root(lang)
    lang = lang or ""

    ---@type string
    local sep = os_ops.os_sep()

    ---@type string | nil
    local SOURCE_ROOT = os.getenv("SOURCE_ROOT")

    ---@type string | nil
    local HOME = os.getenv("HOME")

    assert(SOURCE_ROOT ~= nil, "SOURCE_ROOT not in PATH env")
    assert(HOME ~= nil, "HOME not in PATH env")

    local proj_path = string.format("%s%s%s%s%s", HOME, sep, SOURCE_ROOT, sep, lang)
    return proj_path
end


---@param proj_path string
---@param  focus_tree boolean
---@return
local function open_proj_in_new_tab(proj_path, focus_tree)
    focus_tree = focus_tree or true

    local has_nvim_tree, _ = pcall(require, "nvim-tree")

    vicmd("tabnew ")
    require('telescope._extensions.project.utils').change_project_dir(proj_path)

    if has_nvim_tree and focus_tree then
        vicmd("NvimTreeFocus")
    end
end


return {
    find_nvim_cfg = find_nvim_cfg,
    get_src_root = get_src_root,
    open_proj_in_new_tab = open_proj_in_new_tab
}
