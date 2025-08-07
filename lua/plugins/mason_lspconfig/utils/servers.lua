--[[
Add any additional override configuration in the following tables. Available keys are:
    - cmd (table): Override the default command used to start the server
    - filetypes (table): Override the default list of associated filetypes for the server
    - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    - settings (table): Override the default settings passed when initializing the server.
    - root_markers (table): A list of files or folders. We will use this to determine the root of the project.
]]
---@type table
local servers =
{
    ["lua_ls"] = {
        version = "3.15.0",
        opts =
        {
            root_markers = {
                ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml",
                "selene.toml", "selene.yml", ".luarc.json", ".git"
            },
            settings = {Lua = {runtime = {version = "LuaJIT"}}}
        }
    },

    --["pyright"] = {
    --    version = "1.1.403",
    --    opts =
    --    {
    --        root_markers = {{"pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json"}, ".git"},
    --        python = {
    --            analysis = {
    --                autoSearchPaths = true,
    --                diagnosticMode = "openFilesOnly",
    --                useLibraryCodeForTypes = true
    --            }
    --        }
    --
    --    }
    --}

    ["basedpyright"] = {
        version = "1.31.1",
        opts = {}
    }
}


return {
    servers = servers
}
