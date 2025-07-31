---------------------------------------------------- Nvim apis ---------------------------------------------------------
api = vim.api
cr_aucmd = api.nvim_create_autocmd
cr_augroup = api.nvim_create_augroup
cr_usr_cmd = api.nvim_create_user_command

g_aucmds = api.nvim_get_autocmds
ex_aucmds = api.nvim_exec_autocmds

del_augr_by_name = api.nvim_del_augroup_by_name
del_aucmd = api.nvim_del_autocmd
cl_aucmds = api.nvim_clear_autocmds

api_map = api.nvim_set_keymap  -- use set_keymap instead
api_buff_map = api.nvim_buf_set_keymap  -- use set_keymap instead


nvim_win_close = api.nvim_win_close
nvim_list_wins = api.nvim_list_wins
nvim_win_get_buf = api.nvim_win_get_buf
nvim_win_get_tabpage = api.nvim_win_get_tabpage

nvim_tabpage_list_wins = api.nvim_tabpage_list_wins
------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------- Nvim fns -----------------------------------------------------
fn = vim.fn

winwidth = fn.winwidth
winheight = fn.winheight

getbufinfo = fn.getbufinfo

expand = fn.expand
------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------- Lua APIs ------------------------------------------------------
-- Misc
vicmd = vim.cmd
vienv = vim.env

schedule = vim.schedule
schedule_wrap = vim.schedule_wrap

-- Var Namespaces
g = vim.g

-- Keymap
set_keymap = vim.keymap.set
del_keymap = vim.keymap.del

-- Options
o = vim.opt  -- special option interface for OOP-oriented config in Lua
lo = vim.opt_local  -- equi :setlocal
go = vim.opt_global  -- equi :setglobal
bo = vim.bo  -- equi :setlocal to current buffer
wo = vim.wo  -- equi :setlocal to current window




-- Table's apis
tbl_map = vim.tbl_map
tbl_filter = vim.tbl_filter  -- same Python's filter()
tbl_isempty = vim.tbl_isempty  -- same Python's map()
------------------------------------------------------------------------------------------------------------------------
