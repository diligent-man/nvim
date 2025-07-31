require("utils.alias")
require("utils.constant")


---@type table
local utils = require("utils")

---@type StdPath
local StdPath = require("utils.StdPath").StdPath


---@type function
local set_leader = utils.set_leader


---@class PluginManager
---@field __lazy_path string
---@field __lazy_repo string
local PluginManager = {
    __lazy_path = StdPath.new().data .. "/lazy/lazy.nvim",
    __lazy_repo = "https://github.com/folke/lazy.nvim.git"
}

PluginManager.__index = PluginManager


---@return PluginManager
function PluginManager.new()
    local obj = setmetatable({}, PluginManager)
    return obj
end


---@return void
function PluginManager:pre_init()
    g.loaded_netrw = 1
    g.loaded_netrwPlugin = 1
end


---@return void
function PluginManager:bootstrap()
    set_leader("<Space>", " ", "\\")

    if not (vim.uv or vim.loop).fs_stat(self.__lazy_path) then
        local out = fn.system(
                {
                    "git",
                    "clone",
                    "--filter=blob:none",
                    "--branch=stable",
                    self.__lazy_repo,
                    self.__lazy_path
                }
        )

        if vim.v.shell_error ~= 0 then
            api.nvim_echo({
                {"Failed to clone lazy.nvim:\n", "ErrorMsg"},
                {out, "WarningMsg"},
                {"\nPress any key to exit..."},
            }, true, {})

            fn.getchar()
            os.exit(1)
        end
    end

    o.rtp:prepend(self.__lazy_path)
end


---@return void
function PluginManager:run_setup()
    require("lazy").
    setup({
        spec =
        {
            {import = "plugins"},
        }
    })
end


---@return void
function PluginManager:post_init()
    vicmd("syntax on")
    vicmd("syntax enable")
    vicmd("colorscheme dracula_pro_van_helsing_custom")

    --------------------------------------------------------------------------------------------------------------------
    --- NVim Tree ---
    set_hl(0, "NvimTreeNormal", {bg="#2B2D30"})
    set_hl(0, "NvimTreeRootFolder", {italic=true, bold=true, fg="#00FFFF"})

    set_hl(0, "NvimTreeOpenedHL", {fg = "#FFFFFF", bg = "#0B94FC", bold=true})

    set_hl(0, "NvimTreeSymlink", {italic=true})
    set_hl(0, "NvimTreeSymlinkFolderName", {fg="#9580F9", italic=true})

    set_hl(0, "NvimTreeFolderName", {fg="#02AEFF"})
    set_hl(0, "NvimTreeEmptyFolderName", {fg="#02AEFF"})

    set_hl(0, "NvimTreeGitFolderStagedHL", {fg = "#00FF00"})
    set_hl(0, "NvimTreeGitFileStagedHL", {fg = "#00FF00"})
    --------------------------------------------------------------------------------------------------------------------
end


-- Call PluginManager immediately when import due to bootstraping other plugins
---@type PluginManager
plugin_manager = PluginManager.new()

plugin_manager:bootstrap()
plugin_manager:pre_init()
plugin_manager:run_setup()
plugin_manager:post_init()
