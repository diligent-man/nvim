require("utils.alias")
require("utils.constant")



-- Window splitting
--set_keymap("n", "<leader>sv", ":vs<CR>", opts)
--set_keymap("n", "<leader>sh", ":sp<CR>", opts)
--set_keymap("n", "<leader>se", "<C-w>=", opts)
--set_keymap("n", "<leader>sf", "<C-w>|", opts)


-- plugins/tree
set_keymap("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>",
        {desc = "Toggle file explorer"}, DEFAULT_KEYMAP_OPTS
)
set_keymap("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>",
        {desc = "Toggle file explorer on current file"}, DEFAULT_KEYMAP_OPTS
)
set_keymap("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>",
        {desc = "Collapse file explorer"}, DEFAULT_KEYMAP_OPTS
)
set_keymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>",
        {desc = "Refresh file explorer"}, DEFAULT_KEYMAP_OPTS
)
