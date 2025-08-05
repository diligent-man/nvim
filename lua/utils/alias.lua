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


list_wins = api.nvim_list_wins
win_close = api.nvim_win_close
win_get_buf = api.nvim_win_get_buf
win_get_tabpage = api.nvim_win_get_tabpage
get_current_win = api.nvim_get_current_win

buf_get_name = api.nvim_buf_get_name

tabpage_list_wins = api.nvim_tabpage_list_wins

set_hl = api.nvim_set_hl
------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------- Nvim fns -----------------------------------------------------
fn = vim.fn

winwidth = fn.winwidth
winheight = fn.winheight

getbufinfo = fn.getbufinfo

expand = fn.expand
stdpath = fn.stdpath

mode = fn.mode
------------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------- Lua APIs ------------------------------------------------------
-- Misc
vicmd = vim.cmd
vienv = vim.env

log = vim.log
notify = vim.notify

schedule = vim.schedule
schedule_wrap = vim.schedule_wrap

uv = vim.uv -- libUV library


-- Var Namespaces
g = vim.g


-- Keymap
keymap = vim.keymap.set
del_map = vim.keymap.del


-- Options
o = vim.opt  -- special option interface for OOP-oriented config in Lua
lo = vim.opt_local  -- equi :setlocal
go = vim.opt_global  -- equi :setglobal
bo = vim.bo  -- equi :setlocal to current buffer
wo = vim.wo  -- equi :setlocal to current window


-- Table
tbl_map = vim.tbl_map

tbl_values = vim.tbl_values
tbl_keys = vim.tbl_keys

map = vim.tbl_map
split = vim.split
filter = vim.tbl_filter
count =  vim.tbl_count

contains = vim.tbl_contains
isempty = vim.tbl_isempty

extend = vim.tbl_extend
deep_extend = vim.tbl_deep_extend


-- libUV
os_uname = uv.os_uname
os_gethostname = uv.os_gethostname

-- String ops
trim = vim.trim

-- JSON
json = vim.json
------------------------------------------------------------------------------------------------------------------------
