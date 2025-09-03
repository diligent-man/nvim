--[[
    This scipts aims to provide some examples in making snippet. Feel free to exclude it by.

Each snippet is created via add_snippets(filetype, snippets, opts), in which
    filetype: nil | "<specific_ext>" | table of exts | "all"
    snippets: a table input by a snippet node (s). Each snippet node includes context, nodes, opts. (check nodes/snippet.lua)
    opts: a table of options includes "strict", "select", "pos" (check init.lua of LuaSnipp)
]]
require("utils.alias")

---@type table
local ls = require("luasnip")

---@type table
local extras = require("luasnip.extras")

---@type table
local fmt = require("luasnip.extras.fmt")

---@type table
local types = require("luasnip.util.types")

---@type table
local conds = require("luasnip.extras.conditions")

---@type table
local conds_expand = require("luasnip.extras.conditions.expand")


---@type function
local s = ls.snippet

---@type function
local t = ls.text_node

---@type function
local i = ls.insert_node

---@type function
local c = ls.choice_node

---@type function
local f = ls.function_node

---@type function
local d = ls.dynamic_node

---@type function
local r = ls.restore_node

---@type function
local sn = ls.snippet_node


---@type function
local fmta = fmt.fmta

---@type function
local fmt = fmt.fmt


---@type function
local lamda = extras.lambda

---@type function
local rep = extras.rep

---@type function
local partial = extras.partial

---@type function
local match = extras.match

---@type function
local nonempty = extras.nonempty

---@type function
local dynamic_lambdal = extras.dynamic_lambda


---@type string
local filetype = "all"

---@type string
local sample_str = "\"This is an example snippet\""

---@type string
local fn_template = [[
{}
function {}({})
    {}
end
]]


-- Simple form with manual invocation
ls.add_snippets(filetype, {s("ex_1", t(sample_str))})

ls.add_snippets(filetype, {
    s({
        trig="ex_2",
        desc="Detailed form with manual invocation"
    }, t(sample_str))
})

ls.add_snippets(filetype, {
    s({
        trig="ex_3",
        wordTrig=true,
        snippetType="autosnippet",  -- nil | snippet | autosnippet
        desc="Complex form with auto-trigger invocation",
    }, t(sample_str))
})

ls.add_snippets(filetype, {
    s({
        trig="ex_4",
        desc="Multiple choice node"
    },
            c(1,
                    {
                        fmt("local {} = {} or {}", {
                            i(1, "name"),
                            i(2, "val"),
                            i(3, "val")}
                        ),

                        fmt("local {} = {}", {
                            i(1, "global name"),
                            i(2, "global val")}
                        ),

                        fmt("{} = {}", {
                            i(1, "name"),
                            i(2, "val")}
                        )
                    }
            ))
})

ls.add_snippets(filetype, {
    s({
        trig="ex_5",
        desc="Multiple argument choice node",
    },
            c(1,
                    {
                        fmta("local <> = <> or <>", {
                            i(1, "name"),
                            i(2, "val"),
                            i(3, "val")}
                        ),

                        fmta("local <> = <>", {
                            i(1, "global name"),
                            i(2, "global val")}
                        )
                    }
            ))
})

ls.add_snippets(filetype, {
    s({
        trig="ex_6",
        desc="Function node"
    }, c(1,
            {
                fmt([[require("{}")]], {
                    i(1, "package_or_module_name")
                }),

                fmt([[
                ---@type {}
                local {} = require("{}")
                ]], {
                    i(1, "type"),
                    f(function(values)
                        local value = values[1][1]
                        local path = split(value, "%.")
                        return path[#path]
                    end, {2}),
                    i(2, "package_or_module_name")
                })
            }
    ))
})

ls.add_snippets(filetype, {
    s({
        trig="ex_7",
        desc="Dynamic node",
    }, fmt(fn_template, {
        d(3, function(values)
            local param_str = values[1][1]:gsub(" ", "")

            if param_str == "" then
                return sn(1, {t("")})
            end

            local params = split(param_str, ",")
            local nodes = {}
            for idx, param in ipairs(params) do
                table.insert(
                        nodes,
                        sn(
                                idx,
                                fmt("\n\n---@param {} {}", {t(param), i(1, "dtype")})
                        )
                )
            end

            table.insert(
                    nodes,
                    sn(
                            #nodes+1,
                            fmt("\n\n---@return {}", {i(1, "return_type")})
                    )
            )
            return sn(nil, nodes)
        end, {2}),
        i(1, "name"),
        i(2, "vals"),
        i(4, "Your code")
    }))
})
