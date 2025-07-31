---@param first_chr string
---@param rest_str string
---@return string
local function capitalize(first_chr, rest_str)
    return first_chr:upper() .. rest_str
end


---@param str string
---@param strip_type string
---@return string
local function strip(str, strip_type)
    strip_type = strip_type or "both"
    assert(strip_type == "both" or
            strip_type == "lstrip" or
            strip_type == "rstrip",
            "Wrong strip option"
    )

    ---@type string
    local re = ".-"

    ---@type string
    local ws = "%s*"

    if strip == "lstrip" then
        re = string.format("^%s(%s)$", ws, re)
    elseif strip == "rstrip" then
        re = string.format("^(%s)%s$", re, ws)
    else
        re = string.format("^%s(%s)%s$", ws, re, ws)
    end

    return str:match("^%s*(.-)%s*$")
end


---@param str string
---@return string
local function lstrip(str)
    return strip(str, "lstrip")
end


---@param str string
---@return string
local function rstrip(str)
    return strip(str, "rstrip")
end


---@param inp string
---@param delim string
---@param start number
---@return table
local function split(inp, delim, start)
    start = start or 1

    local i = 1
    local res = {}
    local delim_from, delim_to = string.find(inp, delim, start)

    while delim_from do
        table.insert(res, string.sub(inp, i , delim_from-1))
        i  = delim_to + 1
        delim_from, delim_to = string.find(inp, delim, i)
    end

    table.insert(res, string.sub(inp, i))
    return res
end


return {
    split = split,
    strip = strip,
    lstrip = lstrip,
    rstrip = rstrip,
    capitalize = capitalize
}
