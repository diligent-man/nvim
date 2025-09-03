require("utils.alias")


---@type table
local ls = require("luasnip")


---@type function
local fmt = require("luasnip.extras.fmt").fmt

---@type function
local fmta = require("luasnip.extras.fmt").fmta


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
local sn = ls.snippet_node


---@type string
local ft = "lua"

---@type string
local fn_template = [[{}
local function {}({})
    {}
end


]]

---@type function
local fn_snip = function(values)
    local param_str = values[1][1]:gsub(" ", "")

    if param_str == "" then
        return sn(1, { t("") })
    end

    local params = split(param_str, ",")
    local nodes = {}
    for idx, param in ipairs(params) do
        table.insert(
                nodes,
                sn(
                        idx,
                        fmt(
                                string.format("%s---@param {} {}", idx==1 and "\n" or "\n\n"),
                                { t(param), i(1, "dtype")}
                        )
                )
        )
    end

    table.insert(
            nodes,
            sn(
                    #nodes + 1,
                    fmt("\n\n---@return {}", { i(1, "return_type") })
            )
    )
    return sn(nil, nodes)
end

---@param is_local boolean
---@return table
local function make_var(is_local)
    return fmt(is_local and "---@type {}\nlocal {} = {}" or "---@type {}\n{} = {}", {
        i(2, "name"),
        i(3, "val"),
        i(1, "dtype")
    })
end


ls.add_snippets(ft, {
    s({
        trig = "req",
        desc = "Import package/ module"
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
                    end, { 2 }),
                    i(2, "package_or_module_name")
                })
            }
    ))
})
ls.add_snippets(ft, {
    s({
        trig = "var",
        desc = "Declare variable",
    },
            c(1,
                    {
                        make_var(true),
                        make_var(false)
                    }
            )
    )
})
ls.add_snippets(ft, {
    s({
        trig = "forn",
        desc = "Numeric-for"
    }, c(1,
            {
                fmt("for {} = {}, {}, {} do\n\t {}\n end", {
                    i(1, "i"),
                    i(2, "begin"),
                    i(3, "end"),
                    i(4, "incr"),
                    i(5, "code")
                }),

                fmt("for {} = {}, {} do\n\t {}\n end", {
                    i(1, "i"),
                    i(2, "begin"),
                    i(3, "end"),
                    i(4, "code")
                })
            }
    ))
})
ls.add_snippets(ft, {
    s({
        trig = "if",
        desc = "If/ If-else"
    }, c(1,
            {
                fmt([[if {} then
    {}
end]], {
                    i(1, "cond"),
                    i(2, "code"),
                }),

                fmt([[if {} then
    {}
else
    {}
end]], {
                    i(1, "cond"),
                    i(2, "code"),
                    i(3, "code"),
                }),

                fmt([[if {} then
    {}
elseif {} then
    {}
else
    {}
end]], {
                    i(1, "cond"),
                    i(2, "code"),
                    i(3, "cond"),
                    i(4, "code"),
                    i(5, "code")
                })
            }
    ))
})
ls.add_snippets(ft, {
    s({
        trig = "fn",
        desc = "Make function",
    },
            fmt(fn_template, {
                d(3, fn_snip, {2}),
                i(1, "name"),
                i(2, "vals"),
                i(4, "Your code")
            }))
})
ls.add_snippets(ft, {
    s({
        trig = "cls",
        desc = "Make class",
    },
            fmt([[---@class {}
---@field
{}]], {
                i(1, "ClsName"),
                d(2, function(values)
                    ---@type string
                    local param_str = values[1][1]:gsub(" ", "")

                    if param_str == "" then
                        return sn(1, { t("") })
                    end

                    ---@type string
                    local param = split(param_str, ",")[1]

                    ---@type table
                    local nodes = {}

                    table.insert(nodes, sn(#nodes + 1, fmta("local <> = {<>}\n\n\n", {t(param), i(1)})))
                    table.insert(nodes, sn(#nodes + 1, fmt("{}.__index = {}\n\n\n\n", {t(param), t(param)})))
                    table.insert(nodes, sn(#nodes + 1,
                            fmta([[---@return <>
function <>.new(<>)
    local obj = setmetatable({}, <>)
    return obj
end



]], {t(param), t(param), i(1), t(param)})))
                    table.insert(nodes, sn(#nodes + 1, fmta([[return {
    <> = <>
}

]], {t(param), t(param)})))
                    return sn(nil, nodes)
                end, {1})
            }))
})
