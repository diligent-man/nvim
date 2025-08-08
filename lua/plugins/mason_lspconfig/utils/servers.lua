--[[
   There are six fields can be configured
        cmd (table): Override the default command used to start the server
        filetypes (table): Override the default list of associated filetypes for the server
        capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        settings (table): Override the default settings passed when initializing the server.
        root_markers (table): A list of files or folders. We will use this to determine the root of the project.

    MUST have fields:
        + version: retrieved from official github
        + doc: url to official doc
        + default_cfg: url to default server config
        + opts
            - filetypes
            - root_markers

    Optional fields: the rest

]]

---@type table
local servers =
{
    ["lua_ls"] = {
        version = "3.15.0",
        doc = "https://luals.github.io/wiki/configuration/",
        default_cfg = "https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/lua_ls.lua",
        opts =
        {
            root_markers = {
                ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml",
                "selene.toml", "selene.yml", ".luarc.json", ".git"
            }
        }
    },

    ["pyright"] = {
        version = "1.1.403",
        doc = "https://microsoft.github.io/pyright/#/",
        default_cfg = "https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/pyright.lua",
        opts =
        {
            root_markers = {
                "pyproject.toml", "setup.py", "setup.cfg",
                "requirements.txt", "Pipfile", "pyrightconfig.json", ".git"
            },
        }
    },

    ["clangd"] = {
        version = "20.1.8",
        doc = "https://clangd.llvm.org/",
        default_cfg = "https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/clangd.lua",
        opts = {
            filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "proto"},
            root_markers = {".git"}
        }
    },

    ["jdtls"] = {
        version = "v1.48.0",
        doc = "https://projects.eclipse.org/projects/eclipse.jdt.ls",
        default_cfg = "https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/jdtls.lua",
        opts = {
            filetypes = {"java"},
            root_markers = {
                -- Multi-module projects
                ".git", "build.gradle", "build.gradle.kts",

                -- Single-module projects
                "build.xml", -- Ant
                "pom.xml", -- Maven
                "settings.gradle", -- Gradle
                "settings.gradle.kts", -- Gradle
            }
        }
    },

    ["bashls"] = {
        version = "5.6.0",
        doc = "https://github.com/bash-lsp/bash-language-server?tab=readme-ov-file",
        default_cfg = "https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/bashls.lua",
        opts = {
            filetypes = {"bash", "sh"},
            root_markers = {".git"}
        }
    },

    -- not work !
    ["docker_language_server"] = {
        version = "v0.15.0",
        doc = "",
        default_cfg = "https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/dockerls.lua",
        opts = {
            filetypes = {"dockerfile"},
            root_markers = {".git"}
        }
    },

    -- Database connection ?
    ["sqls"] = {
        version = "v0.2.28",
        doc = "https://github.com/sqls-server/sqls?tab=readme-ov-file",
        default_cfg = "https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/sqls.lua",
        supported_db = {"MySQL", "PostgreSQL", "SQLite3", "MSSQL", "H2", "Vertica"},
        opts = {
            filetypes = {"sql", "mysql"},
            root_markers = {".git"}
        }
    },

    ["cmake"] = {
        version = "0.1.11",
        doc = "https://github.com/regen100/cmake-language-server",
        default_cfg = "https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/cmake.lua",
        opts = {
            filetypes = {
                "cmake",
                "CMakeList.txt"  -- added
            },
            root_markers = {".git"}
        }
    }
}


return {
    servers = servers
}
