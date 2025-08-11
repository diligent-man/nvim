local find_files = require("telescope.builtin").find_files


---@type StdPath
local StdPath = require("utils.StdPath").StdPath


---@type StdPath
local std_path = StdPath.new()


local function find_nvim_cfg()
    find_files{cwd = std_path.config}
end


return {
    find_nvim_cfg = find_nvim_cfg
}
