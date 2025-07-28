o = vim.opt  -- special option interface for OOP-oriented config in Lua
lo = vim.opt_local  -- equi :setlocal
go = vim.opt_global  -- equi :setglobal
bo = vim.bo  -- equi :setlocal to current buffer
wo = vim.wo  -- equi :setlocal to current window

vicmd = vim.cmd
vienv = vim.env


-- Nvim apis
api = vim.api
cr_aucmd = api.nvim_create_autocmd
cr_augroup = api.nvim_create_augroup
cr_usr_cmd = api.nvim_create_user_command

g_aucmds = api.nvim_get_autocmds
ex_aucmds = api.nvim_exec_autocmds

del_augr_by_name = api.nvim_del_augroup_by_name
del_aucmd = api.nvim_del_autocmd
cl_aucmds = api.nvim_clear_autocmds


-- Nvim fns
fn = vim.fn
winwidth = fn.winwidth
winheight = fn.winheight
