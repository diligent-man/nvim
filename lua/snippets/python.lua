require("utils.alias")


---@type table
local ls = require("luasnip")


---@type function
local fmt = require("luasnip.extras.fmt").fmt


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
local ft = "python"

---@type string
local cls_template_1 = "class {}:\n\tdef __init__(self, {}) -> None:\n\t\t{}\n\t\treturn None\n\n\n"

---@type string
local cls_template_2 = "class {}(object, ):\n\tdef __init__(self, {}) -> None:\n\t\t{}\n\t\treturn None\n\n\n"


---@param is_void boolean
---@return table
local function make_fn(is_void)
    if is_void == true then
        return fmt([[def {}({}) -> None:
    {}
    return None


]], {
            i(1, "name"),
            i(2),
            i(3, "# Your code")
        })
    else
        return fmt([[def {}({}) -> {}:
    {}
    return


]],{
            i(1, "name"),
            i(2),
            i(3, "dtype"),
            i(4, "# Your code")
        })
    end
end

---@type function
local function make_cls()
    return {
        i(1),
        i(2),
        d(3, function(values)
            ---@type string
            local param_str = values[1][1]:gsub(" ", "")

            ---@type string
            local param = split(param_str, ",")[1]

            ---@type table
            local nodes = {}

            table.insert(nodes,
                    sn(#nodes + 1,
                            fmt("super({}, self).__init__()\n\t\t{}",
                                    {
                                        t(param),
                                        i(1)
                                    }
                            )
                    )
            )
            return sn(nil, nodes)
        end, {1})
    }
end


ls.add_snippets(ft, {
    s({
        trig = "s.",
        desc = "Self",
    }, t("self.")
    )
})
ls.add_snippets(ft, {
    s({
        trig = "__",
        desc = "Create magic method",
    }, fmt("def __{}__(self, {}) -> {}\n\t{}\n\treturn ",
            {
                i(1, "name"),
                i(2),
                i(3, "dtype"),
                i(4, "# Your code"),
            }
    ))
})
ls.add_snippets(ft, {
    s({
        trig = "if",
        desc = "If/ If-else"
    }, c(1,
            {
                fmt([[if {}:
    {}
]], {
                    i(1, "cond"),
                    i(2, "code"),
                }),

                fmt([[if {}:
    {}
else:
    {}
]], {
                    i(1, "cond"),
                    i(2, "code"),
                    i(3, "code"),
                }),

                fmt([[if {}:
    {}
elif {}:
    {}
else:
    {}
]], {
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
        trig = "def",
        desc = "Define function",
    }, c(1,
            {
                make_fn(true),
                make_fn(false)
            }
    ))
})
ls.add_snippets(ft, {
    s({
        trig = "def",
        desc = "Define function",
    }, c(1,
            {
                make_fn(true),
                make_fn(false)
            }
    ))
})
ls.add_snippets(ft, {
    s({
        trig = "cls",
        desc = "Define function",
    }, c(1,
            {
                fmt(cls_template_1, make_cls()),
                fmt(cls_template_2, make_cls())
            }
    ))
})
