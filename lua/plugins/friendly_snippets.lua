---@type StdPath
local StdPath = require("utils.StdPath").StdPath

---@type string
local os_sep = require("ext_lua.os_ops").os_sep


---@type StdPath
local std_path = StdPath.new()


---@type string
local snippet_path = table.concat({std_path.config, "lua", "snippets"}, os_sep())


return {
    "diligent-man/friendly-snippets",

    --version=
    pin=true,

    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_lua").load({paths = snippet_path})
    end
}
