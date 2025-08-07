---@type StdPath
local StdPath = require("utils.StdPath").StdPath

---@type StdPath
local std_path = StdPath.new()


return {
    "mason-org/mason.nvim",

    branch = "main",
    version = "2.0.1",
    pin = true,

    dependencies = {
        "saghen/blink.cmp",
    },

    opts = function()
        local opts = {
            PATH = "append", -- "prepend" | "append" | "skip"
            install_root_dir = std_path.data .. "/mason",

            log_level = log.levels.INFO,
            max_concurrent_installers = math.floor(#vim.loop.cpu_info() / 2),

            registries = {"github:mason-org/mason-registry"},

            -- Builtin providers are:
            --   - mason.providers.registry-api  - uses the https://api.mason-registry.dev API
            --   - mason.providers.client        - uses only client-side tooling to resolve metadata
            providers = {
                "mason.providers.registry-api",
                "mason.providers.client",
            },

            github = {
                -- 1. The repository (e.g. "rust-lang/rust-analyzer")
                -- 2. The release version (e.g. "v0.3.0")
                -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
                download_url_template = "https://github.com/%s/releases/download/%s/%s",
            },

            pip = {
                -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
                upgrade_pip = false,
                install_args = { "--no-cache-dir" },
            },

            ui = {
                check_outdated_packages_on_open = true,

                ---@since 1.0.0
                -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
                -- Defaults to `:h 'winborder'` if nil.
                border = "rounded",

                ---@since 1.11.0
                -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
                backdrop = 90,

                width = 0.8,
                height = 0.9,

                icons = {
                    package_installed = "ꪜ",
                    package_pending = "⏳",
                    package_uninstalled = "◍",
                },

                keymaps = {
                    toggle_package_expand = "<CR>",
                    toggle_package_install_log = "<CR>",

                    update_package = "u",
                    update_all_packages = "U",

                    install_package = "i",
                    check_package_version = "c",

                    check_outdated_packages = "C",
                    uninstall_package = "X",

                    cancel_installation = "<C-c>",
                    apply_language_filter = "<C-f>",

                    toggle_help = "g?",
                }
            }
        }
        return opts
    end
}
