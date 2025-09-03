---@type table
local fn_ops = require("ext_lua.fn_ops")

---@type table
local utils = require("plugins.autocomplete.utils.utils")


---@type function
local partial = fn_ops.partial

---@type function
local accept = utils.accept


return {
    preset = "none",
    -- Navigation --
    ["<Up>"] = {"select_prev", "snippet_backward", "fallback"},
    ["<C-k>"] = {"select_prev", "snippet_backward", "fallback"},

    ["<Down>"] = {"select_next", "snippet_forward", "fallback"},
    ["<C-j>"] = {"select_next", "snippet_forward", "fallback"},

    -- Selection --
    ["<Tab>"] = {"accept", "fallback"},
    ["<CR>"] = {"accept", "fallback"},

    -- Others --
    ["<C-e>"] = {"hide" or "canel", "fallback"},
    ["<C-space>"] = {"show", "show_documentation", "hide_documentation"},

    -- Quick select
    ["<A-0>"] = {partial(accept, 1)},
    ["<A-1>"] = {partial(accept, 2)},
    ["<A-2>"] = {partial(accept, 3)},
    ["<A-3>"] = {partial(accept, 4)},
    ["<A-4>"] = {partial(accept, 5)},
    ["<A-5>"] = {partial(accept, 6)},
    ["<A-6>"] = {partial(accept, 7)},
    ["<A-7>"] = {partial(accept, 8)},
    ["<A-8>"] = {partial(accept, 9)},
    ["<A-9>"] = {partial(accept, 10)},
}
