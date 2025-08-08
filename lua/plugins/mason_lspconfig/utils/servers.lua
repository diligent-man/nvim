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
        doc = "https://luals.github.io/wiki/configuration/",
        opts =
        {
            root_markers = {
                ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml",
                "selene.toml", "selene.yml", ".luarc.json", ".git"
            },
            settings = {Lua = {runtime = {version = "LuaJIT"}}}
        }
    },

    ["pyright"] = {
        version = "1.1.403",
        doc = "https://microsoft.github.io/pyright/#/",
        opts =
        {
            root_markers = {{"pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json"}, ".git"},
        }
    },

    ["clangd"] = {
        version = "20.1.8",
        doc = "https://clangd.llvm.org/",
        opts = {}
    },

    ["bashls"] = {
        version = "5.5.0",
        doc = "https://github.com/bash-lsp/bash-language-server?tab=readme-ov-file",
        opts = {
            filetypes = {"bash", "sh"},
            root_markers = {".git"}
        }
    }
}


return {
    servers = servers
}
