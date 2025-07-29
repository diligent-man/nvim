require("utils.alias")

local utils = require("utils")


std_path = utils.StdPath.new()

-- Bootstrap lazy.nvim
local lazy_path = std_path.data .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazy_path) then
    local lazy_repo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system(
            {"git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, lazy_path}
    )

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            {"Failed to clone lazy.nvim:\n", "ErrorMsg"},
            {out, "WarningMsg"},
            {"\nPress any key to exit..."},
        }, true, {})

        vim.fn.getchar()
        os.exit(1)
    end
end

o.rtp:prepend(lazy_path)


-- remap space as leader key prior to load lazy.nvim
set_keymap("", "<Space>", "<Nop>", opts)
g.mapleader = " "
g.maplocalleader = "\\"


require("lazy").setup({
    spec =
    {
        {import = "plugins"},
    }
})


------------------------------------------------------------------------------------------------------------------------
--- Post-setup ---
vicmd("syntax on")
vicmd("syntax enable")
vicmd("colorscheme dracula_pro_van_helsing_custom")
