
require("utils.alias")




return {
    "saghen/blink.cmp",

    version = "v1.6.0",
    pin = true,

    lazy = false,
    dependencies = {"echasnovski/mini.icons", version = "*"},

    config = function ()
        require("blink.cmp").setup({
            keymap = {
                preset = "none",
                -- Navigation --
                ["<Up>"] = {"select_prev", "fallback"},
                ["<C-k>"] = {"select_prev", "fallback"},

                ["<Down>"] = {"select_next", "fallback"},
                ["<C-j>"] = {"select_next", "fallback"},

                -- Selection --
                ["<Tab>"] = {"accept", "fallback"},
                ["<CR>"] = {"accept", "fallback"},

                -- Others --
                ["<C-e>"] = {"hide" or "canel", "fallback"},
                ["<C-space>"] = {"show", "show_documentation", "hide_documentation"},

                -- Quick select
                ["<A-0>"] = {function(cmp) cmp.accept({index = 1}) end},
                ["<A-1>"] = {function(cmp) cmp.accept({index = 2}) end},
                ["<A-2>"] = {function(cmp) cmp.accept({index = 3}) end},
                ["<A-3>"] = {function(cmp) cmp.accept({index = 4}) end},
                ["<A-4>"] = {function(cmp) cmp.accept({index = 5}) end},
                ["<A-5>"] = {function(cmp) cmp.accept({index = 6}) end},
                ["<A-6>"] = {function(cmp) cmp.accept({index = 7}) end},
                ["<A-7>"] = {function(cmp) cmp.accept({index = 8}) end},
                ["<A-8>"] = {function(cmp) cmp.accept({index = 9}) end},
                ["<A-9>"] = {function(cmp) cmp.accept({index = 10}) end},


                --['<C-space>'] = {function(cmp)
                --
                --    for k, v in pairs(cmp) do
                --        print(k,v)
                --    end
                --
                --    cmp.show({providers = {"snippets"}})
                --end
            },
            snippets = {preset = "default"},
            completion = {
                keyword = {range = "full"},
                -- trigger = {},
                list = {
                    max_items = 9999,
                    cycle = {from_top = true, from_bottom = true},
                    selection = {preselect = false, auto_insert = true}
                },
                --accept = {},
                menu = {
                    max_height = 12,
                    scrolloff = 3,
                    auto_show = true,
                    scrollbar = false,
                    border = "rounded",
                    draw = {
                        treesitter = { "lsp" },
                        align_to = "kind_icon",
                        columns = {{"item_idx"}, {"kind_icon"}, {"label", gap = 1, "label_description"}, {"source_name"}},
                        components = {
                            label = {
                                width = { fill = false, max = 60 },
                            },
                            label_description = {
                                width = { max = 50 },
                                text = function(ctx)
                                    --[[
                                    Some data fields
                                        label_description,
                                        label_detail
                                        source_id (e.g. lsp, buffer, cmdline),
                                        source_name (e.g. LSP, Buffer, Cmdkine)
                                    ]]
                                    if ctx.source_id == "lsp" then
                                        if ctx.label_description:len() > 0 then
                                            return "(" .. ctx.label_description .. ")"
                                        else
                                            return " "
                                        end
                                    else
                                        return ctx.label_description
                                    end
                                end,
                                highlight = function(_)
                                    return { { group = "DraculaComment" } }
                                end
                            },
                            kind = {
                                text = function(ctx)
                                    return ctx.kind
                                end,

                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            },
                            kind_icon = {
                                text = function(ctx)
                                    local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return kind_icon
                                end,

                                highlight = function(ctx)
                                    local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                                    return hl
                                end,
                            },
                            item_idx = {
                                highlight = "BlinkCmpItemIdx",
                                text = function(ctx)
                                    if ctx.idx <= 10 then
                                        return tostring(ctx.idx-1)
                                    else
                                        return " "
                                    end
                                end
                            }
                        }
                    }
                },
                documentation = {
                    auto_show = false,
                    auto_show_delay_ms = 200,
                    treesitter_highlighting = true,  -- Turn off if lag
                    window = {
                        scrollbar = true,
                        border = "rounded",
                        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
                    }
                },
                ghost_text = {enabled = true},
            },

            -- Experimental (Used built-in LSP instead)
            signature = {
                enabled = false,
                window = {border = "rounded"}
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            -- See the fuzzy documentation for more information
            fuzzy = {
                implementation = "prefer_rust_with_warning",
                prebuilt_binaries = {
                    force_version = "v1.6.0"
                },
                sorts = {
                    "exact",
                    "score",
                    "sort_text",
                }
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = function(_)
                    local success, node = pcall(vim.treesitter.get_node)

                    ---@type table
                    local comment_signs = {"comment", "line_comment", "block_comment"}

                    if success and node and vim.tbl_contains(comment_signs, node:type()) then
                        return {"buffer"}
                    else
                        return {"lsp", "path", "snippets", "buffer"}
                    end
                end,

                -- optionally inherit from the `default` sources
                per_filetype = {
                    -- lua = { inherit_defaults = true, 'lsp', 'path' },
                },


                --providers = {}
            },

            cmdline = {},
            term = {}
        })
    end
}
